<?php

class TuningType extends LethargicRecord {
  /* return all instances of tunings with this type.
   * $opts can be an array with extra sql options, including a 'where' clause
   */
  function allInstances($opts = array()) {
    if(isset($opts['where'])) {
      $opts['where'] = 'tuningtypeId = ' . $this->id . ' AND ';
    } else {
      $opts['where'] = 'tuningtypeId = ' . $this->id;
    }
    
    global $orm;
    return $orm->Tuning->find($opts);
  }
}

LethargicRecord::setup('TuningType');

?>