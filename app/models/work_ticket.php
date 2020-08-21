<?php

class WorkTicket extends LethargicRecord {
  function createdBy() {
    global $orm;
    return $orm->Person->find($this->createdBy);
  }
  
  function updatedBy() {
    global $orm;
    return $orm->Person->find($this->updatedBy);
  }
  
  function instrument() {
    global $orm;
    return $orm->Instrument->find($this->instrumentId);
  }
  
  function performedBy() {
    global $orm;
    return $orm->Person->find($this->performedBy);
  }
  
  /* if this ticket is completed, this returns the attached Tuning or Procedure (if any)
   * in all other cases, returns NULL
   */
  function work() {
    if($this->status == 'done') {
      global $orm;
      $tuning = $orm->Tuning->find(array('return' => 'first', 'where' => 'ticketId = ' . $this->id));
      
      if(!is_null($tuning))
        return $tuning;
        
      $procedure = $orm->Procedure->find(array('return' => 'first', 'where' => 'ticketId = ' . $this->id));
      return $procedure;
    }
    
    return NULL;
  }
}

LethargicRecord::setup('WorkTicket');

?>