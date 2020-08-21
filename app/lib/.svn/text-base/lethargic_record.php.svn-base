<?php
/* This is going to be a super-cool ActiveRecord like ... thing. Yes.
 *
 * @author Will Fleming wmf22@cornell.edu
 * @created 14April2007
 */

class LethargicRecord {
  
  var $_isUnsaved = true;  // true for Records not yet saved to database
  var $_sqlAttrs = array();  // hash of attribute names and values, formatted for SQL
  //PHP-typed attributes are just member variables. e.g. $object->id._sqlAttrs
  
  // constructor
  function LethargicRecord() {
    // create default values for attributes
    $attrs = array_keys($GLOBALS['LethargicRecord']['schemas'][get_class($this)]);
    foreach($attrs as $attr) {
      if($attr == 'id') {
        $this->id = -1;
        continue;
      }
      
      $type = $GLOBALS['LethargicRecord']['schemas'][get_class($this)][$attr]['Type'];
      
      if(eregi('^VARCHAR', $type) || eregi('CHAR', $type) || eregi('TEXT', $type)) {
        $this->$attr = "";
      } else if(eregi('INT', $type)) {
        $this->$attr = 0;
      } else if(eregi('FLOAT', $type)) {
        $this->$attr = 0.0;
      } else if(strtolower($type) == 'datetime') {
        $this->$attr = time();
      }
    }
  }
  
  /* This method initializes and returns a MySQL link resource
   *
   * The sole argument $options should be a hash. Supported keys are the same as
   * the options to the mysql_connect function (e.g. 'server', 'username'),
   * plus a 'database' option.
   *
   * The settings from $GLOBALS['LethargicRecord']['dbOpts'] will be used as
   * defaults
   */
  /* static */ function &dbConnection($options = NULL) {
    $defaults = array('server' => 'localhost:3306',
                      'username' => '',
                      'password' => '',
                      'new_link' => false,
                      'database' => '');
    if(is_array($GLOBALS['LethargicRecord']['dbOpts'])) {
      $defaults = array_merge($defaults, $GLOBALS['LethargicRecord']['dbOpts']);
    }
    if(!is_array($options)) { $options = array(); }
    $params = array_merge($defaults, $options);
    
    $linkResource = mysql_connect($params['server'], $params['username'], $params['password'], $params['new_link']);
    mysql_select_db($params['database'], $linkResource);
    
    return $linkResource;
  }
  
  /* This method should be called on every model after initialization.
   * It sets up all the proper database connection info.
   */
  /* static */ function setup($className) { 
    $dbLink = LethargicRecord::dbConnection();
    
    // get all the attr types and their types
    $q = "SHOW COLUMNS FROM `" . strtolower($className) . "`";
    $r = mysql_query($q, $dbLink);
    while($row = mysql_fetch_assoc($r)) {
      $GLOBALS['LethargicRecord']['schemas'][$className][$row['Field']] = $row;
    }
    
    // add this class to the super-sketchy global 'factory' that we use to make finding pretty
    global $orm; $orm->$className = new $className();
  }
  
  /* based on the explanations of Ruby on Rails' ActiveRecord::Base.find found at
   * http://weblog.jamisbuck.org/under-the-hood
   *
   * The function can accept a variety of options:
   * To find a single object with a particular id, call find(id).
   *
   * To find the first object that matches a where clause, call
   * find(array('return' => 'first', 'where' => "name LIKE 'something'"))
   *
   * the 'return' option can also have the value 'all' (if the return option is not
   * present, 'all' is assumed):
   * find(array('return' => 'all', 'where' => "name LIKE 'something'"))
   *
   * Additional options to pass are 'order' and 'limit', whose values should be SQL 
   * snippets similar to the 'where' option.
   *
   * You can also pass a boolean value on the 'includeDeleted' key, e.g.
   * find(array('includeDeleted' => true)). The default is false. This is used to include deleted
   * items from tables that support fake-deletion (have an isDeleted column)
   * 
   */
  /*static*/ function find($options = NULL) {
    if(strtolower($options) == 'all') {
      $options = array('return' => 'all');
    } else if(is_string($options)) {
      $options = intval($options);
    }
    if(is_int($options)) {
      $options = array('return' => 'first', 'where' => "id = $options", 'limit' => '1');
    }
    
    if(isset($GLOBALS['LethargicRecord']['schemas'][get_class($this)]['isDeleted'])
    && (!isset($options['includeDeleted']) || !$options['includeDeleted'])) {
      if(!isset($options['where'])) {
        $options['where'] = "isDeleted = 0";
      } else {
        $options['where'] = "isDeleted = 0 AND " . $options['where'];
      }
    }
    
    //FIXME: this isn't working right now (makes valid queries invalid), but should be fixed. (#51)
    //LethargicRecord::_sanitizeOptions($options);
    
    $q = 'SELECT * FROM `' . strtolower(get_class($this)) . '`';
    if(isset($options['where'])) {
      $q .= ' WHERE ' . $options['where'];
    }
    if(isset($options['order'])) {
      $q .= ' ORDER BY ' . $options['order'];
    }
    if($options['return'] == 'first') {
      return array_pop(LethargicRecord::findBySql($q));
    } else {
      if(isset($options['limit'])) {
        $q .= ' LIMIT ' . $options['limit'];
      }
      
      return LethargicRecord::findBySql($q);
    }
  }
  
  /* static */ function findBySql($sql) {
    $dbLink = LethargicRecord::dbConnection();
    $res = mysql_query($sql, $dbLink);
    
    // $sql = mysql_real_escape_string($sql);
 
    $matches = array();
    eregi('FROM \`([A-Za-z\_\-]+)\`', $sql, $matches);
    $model = $matches[1];
    
    $ret = array();
    
    while($row = mysql_fetch_assoc($res)) {
      $ret[] = LethargicRecord::_objectFromRow($model, $row);
    }
        
    return $ret;
  }
  
  /* private static */ function _sanitizeOptions(&$options) {
    $keys = array('where', 'order', 'limit');
    $link = LethargicRecord::dbConnection();
    
    foreach($keys as $key) {
      if(isset($options[$key])) {
        $options[$key] = mysql_real_escape_string($options[$key], $link);
      }
    }
  }
  
  // get the value of an attribute
  function get($attr) {
    if(!array_key_exists($attr, $this->_sqlAttrs)) {
      trigger_error("ArgumentError: '$attr' not a valid attribute!", E_USER_ERROR);
    }
    return $this->$attr;
  }
  
  // set the value of an attribute
  function set($attr, $val) {
    if(!array_key_exists($attr, $this->_sqlAttrs)) {
      trigger_error("ArgumentError: '$attr' not a valid attribute!", E_USER_ERROR);
    }
    $this->$attr = $val;
  }
  
  //save the object back to the db (UPDATE or INSERT)
  function save() {
    $attrs = array_keys($GLOBALS['LethargicRecord']['schemas'][get_class($this)]);
    
    // set updatedAt if exists
    if(in_array('updatedAt', $attrs)) {
      $this->updatedAt = time();
    }
    
    $this->_coerceValues('toSQL');
    
    $q = '';
    if($this->_isUnsaved) {
      $q .= 'INSERT INTO `' . strtolower(get_class($this)) . '`(';
      $iAttrs = $attrs;
      $i = array_search('id', $iAttrs);
      unset($iAttrs[$i]);
      $q .= '`' . implode('`, `', $iAttrs) . '`';
      $q .= ') VALUES (';
      $vals = $this->_sqlAttrs; unset($vals['id']);
      $q .= implode(',', $vals);
      $q .= ')';
    } else {
      $q .= 'UPDATE `' . strtolower(get_class($this)) . '` SET';
      foreach($attrs as $attr) {
        if($attr != 'id')
          $q .= ' `' . $attr . '` = ' . $this->_sqlAttrs[$attr] . ',';
      }
      $q = substr($q, 0, strlen($q) - 1);
      $q .= ' WHERE id = ' . $this->_sqlAttrs['id'];
    }
    
    $link = LethargicRecord::dbConnection();
    $r = mysql_query($q, $link);
    if($r == false)
      trigger_error("SqlError: on query '" . $q . "', mysql returned the error " . mysql_error($link), E_USER_ERROR);
      
    // if this object was just inserted, update it's id and the _isUnsaved attr
    if($this->_isUnsaved) {
      $this->_isUnsaved = false;
      $this->set('id', mysql_insert_id($link));
    }
  }
  
  /* Update the attributes of the object
   *
   * @param hash $vals: attr => value
   */
  function updateAttrs($vals) {
    $attrs = array_keys($vals);
    
    foreach($attrs as $attr) {
      $this->$attr = $vals[$attr];
    }
  }
  
  /* delete the object from the database
   *
   * @param boolean $really: if the object would have been fake-deleted by default, set this
   * to ensure that it really gets deleted 
   */
  function delete($really = false) {
    if(!isset($GLOBALS['LethargicRecord']['schemas'][get_class($this)]['isDeleted'])
    || $really) {
      $link = LethargicRecord::dbConnection();
      $q = 'DELETE FROM `' . strtolower(get_class($this)) . '` WHERE id = ' . $this->get('id');
      mysql_query($q, $link);
    } else {
      $this->isDeleted = 1;
      $this->save();
    }
  }
  
  /* This function will be responsible for manipulating column values between PHP and MySQL
   * the direction argument tells whether we're going from MySQL->PHP or vice versa
   *
   * @arg direction string: should have the value 'toSQL' or 'toPHP'
   * @return void
   */
  /* private */ function _coerceValues($direction) {
    $attrs = array_keys($GLOBALS['LethargicRecord']['schemas'][get_class($this)]);
    $link = LethargicRecord::dbConnection();
    
    switch ($direction) {
      case 'toSQL':
        foreach($attrs as $attr) {
          $type = $GLOBALS['LethargicRecord']['schemas'][get_class($this)][$attr]['Type'];
          if(eregi('^VARCHAR', $type) || eregi('CHAR', $type) || eregi('TEXT', $type)) {
            $this->_sqlAttrs[$attr] = "'" . mysql_real_escape_string($this->$attr, $link) . "'";
          } else if(eregi('INT', $type) || eregi('YEAR', $type)) {
            $this->_sqlAttrs[$attr] = intval($this->$attr);
          } else if(eregi('FLOAT', $type)) {
            $this->_sqlAttrs[$attr] = floatval($this->$attr);
          } else if(strtolower($type) == 'datetime') {
            $this->_sqlAttrs[$attr] = date("'Y-m-d H:i:s'", $this->$attr);
          } else if(eregi('^ENUM', $type)) {
            //TODO: for now, treat enums like plain text. Might be nice eventually to enforce valid values.
            $this->_sqlAttrs[$attr] = "'" . mysql_real_escape_string($this->$attr, $link) . "'";
          }
          //TODO: any other column types? that we'll actually use?
        }
        break;
      
      case 'toPHP':
        foreach($attrs as $attr) {
          $type = $GLOBALS['LethargicRecord']['schemas'][get_class($this)][$attr]['Type'];
          
          if(eregi('^VARCHAR', $type) || eregi('CHAR', $type) || eregi('TEXT', $type)) {
            $this->$attr = stripslashes($this->_sqlAttrs[$attr]);
          } else if(eregi('INT', $type) || eregi('YEAR', $type)) {
            $this->$attr = intval($this->_sqlAttrs[$attr]);
          } else if(eregi('FLOAT', $type)) {
            $this->$attr = floatval($this->_sqlAttrs[$attr]);
          } else if(strtolower($type) == 'datetime') {
            $matches = array();
            preg_match('/(\d\d\d\d)-(\d\d)-(\d\d) (\d\d):(\d\d):(\d\d)/', $this->_sqlAttrs[$attr], $matches);
            $this->$attr = mktime($matches[4], $matches[5], $matches[6], $matches[2], $matches[3], $matches[1]);
          } else if(eregi('^ENUM', $type)) {
            //TODO: for now, treat enums like plain text. Might be nice eventually to enforce valid values.
            $this->$attr = stripslashes($this->_sqlAttrs[$attr]);
          }
        }
        break;
      
      default:
        trigger_error("ArgumentError: _coerceValues expected 'toSQL' or 'toPHP'", E_USER_ERROR);
    }
  }
  
  /* This function is responsible for creating an object from a row */
  /* private static */ function _objectFromRow($class, $rowData) {
    $o = new $class;

    $o->_sqlAttrs = $rowData;
    /* NOTE: Yes, I know I'm being inconsistent with how attr values are internally
     * represented. It shouldn't be a problem under normal use cases, and I don't feel
     * like rearchitecting. If it breaks, I'll fix it. */
    
    $o->_coerceValues('toPHP');
    $o->_isUnsaved = false;
    
    return $o;
  }
}


// super sketchy scary global 'factory' because php is EVIL
class LethargicFactory {
  // all of the object instance's variables are defined at run time as models are created.
}

$orm = new LethargicFactory();
global $orm;

?>