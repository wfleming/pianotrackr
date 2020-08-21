<?php

class ProcedureType extends LethargicRecord {
  /* return all instances of procedures with this type.
   * $opts can be an array with extra sql options, including a 'where' clause
   */
  function allInstances($opts = array()) {
    if(isset($opts['where'])) {
      $opts['where'] = 'proceduretypeId = ' . $this->id . ' AND ';
    } else {
      $opts['where'] = 'proceduretypeId = ' . $this->id;
    }
    
    global $orm;
    return $orm->Procedure->find($opts);
  }
}

LethargicRecord::setup('ProcedureType');

?>