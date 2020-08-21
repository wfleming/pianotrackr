<?php

class Person extends LethargicRecord {
  function authorize($password) {
    $hash = md5($password);
    
    return ($hash == $this->password);
  }

  function name() {
    return $this->get('firstName') . ' ' . $this->get('lastName');
  }
  
  function group() {
    global $orm;
    return $orm->Group->find($this->groupId);
  }
}


LethargicRecord::setup('Person');

?>