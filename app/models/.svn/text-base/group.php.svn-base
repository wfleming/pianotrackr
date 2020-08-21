<?php

class Group extends LethargicRecord {
  
  /* This function returns a boolean, telling you whether or not it can be deleted.
   * Magic groups are pre-defined groups used for system functionality, like determining
   * page access.
   * 
   * @return boolean
   */
  function isMagic() {
    $magicNames = array('Administrators', 'Faculty', 'Student', 'Staff');
    return in_array($this->name, $magicNames);
  }
  
  function members() {
    global $orm;
    return $orm->Person->find(array('where' => 'groupId = ' . $this->id, 'order' => 'lastName, firstName'));
  }
  
  function membersSize() {
    return count($this->members());
  }
  
  function delete() {
    if($this->isMagic()) {
      return false;
    } else {
      parent::delete();
    }
  }
}

LethargicRecord::setup('Group');

?>