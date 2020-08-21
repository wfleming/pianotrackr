<?php

class Procedure extends LethargicRecord {
  function procedureType() {
    global $orm;
    return $orm->ProcedureType->find($this->proceduretypeId);
  }

  // returns the name of the ProcedureType
  function typeStr() {
    return $this->procedureType()->name;
  }
  
  function ticket() {
    global $orm;
    return $orm->WorkTicket->find($this->ticketId);
  }
}

LethargicRecord::setup('Procedure');

?>