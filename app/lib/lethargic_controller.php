<?php
/* This is going to be a super-neato super-lightweight web app framework for us to use. It'll be cool.
 *
 * @author Will Fleming wmf22@cornell.edu
 * @created 14April2007
 */
 
require_once 'smarty/Smarty.class.php';
require_once 'smarty_additions.php';
 
class LethargicController {
  var $smarty = NULL;  // smarty instance used for templating
  var $rendered = false;  // var to track rendered status
  var $orm = NULL;  // this will be the global orm var.
  
  function LethargicController() {
    global $orm;
    $models = get_object_vars($orm);
    foreach($models as $class => $instance) {
      $this->$class = $instance;
    }
  }
  
  /* costruct a link url from a set of options
   *
   * $options is a hash of variable names as keys and values as values.
   * if controller and action are not specified, they are assumed to be the same as the
   * current controller and action.
   *
   * @return url
   */
  /* static */ function linkTo($options = array(), $xhtml = true) {
    if(!is_array($options)) { $options = array(); }
    $defaults = array('controller' => LethargicController::getCurrentController(),
                      'action' => LethargicController::getCurrentAction());
    
    $params = array_merge($defaults, $options);
    
    $amp = ($xhtml ? "&amp;" : "&");
    
    $url = 'index.php?';
    
    foreach($params as $key => $value) {
      $url .= $key . '=' . urlencode($value) . $amp;
    }
    
    return $url;
  }
  
  // fetch the value of a url-passed parameter, i.e. 'id' or 'controller'
  function getParam($var) {
    $defaults = array('controller' => $GLOBALS['LethargicRecord']['defaultController'],
                      'action' => $GLOBALS['LethargicRecord']['defaultAction']);
    $params = array_merge(array_merge($defaults, $_GET), $_POST);
    
    return LethargicController::_urldecode($params[$var]);
  }
  
  /* private */ function _urldecode($var) {
    if(is_string($var)) {
      return urldecode($var);
    } else if(is_array($var)) {
      foreach($var as $key=>$val) {
        $var[$key] = LethargicController::_urldecode($val);
      }
      
      return $var;
    } else {
      return $var;
    }
  }
  
  function getCurrentController() {
    return LethargicController::getParam('controller');
  }
  
  function getCurrentAction() {
    return LethargicController::getParam('action');
  }
  
  /* render a template. If template is not specified, the template with the same name
   * as the current controller/action will be rendered */
  function render($template = NULL) {
    if($this->rendered) { return; }
    if($template == NULL) {
      $template = LethargicController::getParam('controller') . '/' . LethargicController::getParam('action') . '.tpl';
    }
    
    $this->rendered = true;
    $this->smarty->display($template);
  }
  
  function setupSmarty() {
    foreach($GLOBALS['LethargicController']['smartyAdditions'] as $sn => $fn) {
      $this->smarty->register_function($sn, $fn);
    }
    
    $this->smarty->assign('c', $this);
    
    // allow messages and errors to be put in the session to persist across redirects
    if(!empty($_SESSION['message'])) {
      $this->smarty->assign('message', $_SESSION['message']);
      unset($_SESSION['message']);
    }
    if(!empty($_SESSION['error'])) {
      $this->smarty->assign('error', $_SESSION['error']);
      unset($_SESSION['error']);
    }
    
    // allow table-filtering by url
    $queries = array();
    $gKeys = array_keys($_GET);
    $pKeys = array_keys($_POST);
    foreach($pKeys as $pk) {
      if(strstr($pk, 'FilterQuery') !== false)
        $queries[str_replace('FilterQuery', '', $pk)] = $_POST[$pk];
    }
    foreach($gKeys as $gk) {
      if(strstr($gk, 'FilterQuery') !== false)
        $queries[str_replace('FilterQuery', '', $gk)] = $_GET[$gk];
    }
    $this->smarty->assign('filterQueries', $queries);    
  }
  
  /* This is where the magic happens. route() figures out the current controller,
   * instantiates it, and then calls the appropriate action. The rest is up to you. */
  /* static */ function route() {
    $cType = LethargicController::getParam('controller') . 'controller';
    $a = LethargicController::getParam('action');
    
    $c = new $cType;
    $c->smarty = new Smarty;
    
    if(function_exists($GLOBALS['LethargicController']['prefilter'])) {
      call_user_func($GLOBALS['LethargicController']['prefilter'], $c);
    }
    
    $c->setupSmarty();
    
    $c->$a();    
    $c->render();
  }
  
  /* This allows you to register a pre-filter function that get's called immediately
   * before a controller's action. It should take a controller object as an argument.
   */
  /* static */ function registerPrefilter($function_name) {
    $GLOBALS['LethargicController']['prefilter'] = $function_name;
  }
  
  
  /* redirect to another URL immediately.
   * @arg $url can either be a string URL or an array of options for linkTo
   */
  /* static */ function redirectTo($url) {
    if(!is_string($url)) {
      $url = LethargicController::linkTo($url, false);
    }
    
    Header("HTTP/1.1 302 Found");
    Header("Location: " . $url);
    exit;
  }
  
  // If nextUrl param is available, redirect to that. Otherwise, render the index.
  function redirectToNextOrIndex() {
    $nextUrl = $this->getParam('nextUrl');
    if($nextUrl) {
      LethargicController::redirectTo($nextUrl);
    } else {
      $this->index();
    }
  }
}
?>