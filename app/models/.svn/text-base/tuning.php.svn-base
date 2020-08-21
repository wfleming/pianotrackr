<?php

class Tuning extends LethargicRecord {
  function tuningType() {
    global $orm;
    return $orm->TuningType->find($this->tuningtypeId);
  }

  // returns the name of the TuningType
  function typeStr() {
    return $this->tuningType()->name;
  }
  
  function ticket() {
    global $orm;
    return $orm->WorkTicket->find($this->ticketId);
  }
}

LethargicRecord::setup('Tuning');

?>