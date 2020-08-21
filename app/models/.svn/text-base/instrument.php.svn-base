<?php

class Instrument extends LethargicRecord {
  function faculty() {
    global $orm;
    return $orm->Person->find($this->get('facultyId'));
  }
  
  function age() {
    return (intval(date('Y')) - $this->yearBuilt);
  }
  
  /* calc the age val for the workload formula */
  function ageForWorkloadForumla() {
    $a = $this->age();
    
    if($a <= 2)
      $aw = 0.9;
    else if($a <= 15)
      $aw = 1.3;
    else if($a <= 30)
      $aw = 1.0;
    else if($a <= 45)
      $aw = 0.7;
    else
      $aw = 0.5;
      
    return $aw;
  }
  
  /* calc the Upright/Grand val for the workload formula */
  function ugForWorkloadFormula() {
    if($this->type == 'Upright')
      $t = 1.1;
    else if($this->type == 'Grand')
      $t = '0.7';
    
    return $t;
  }
}

LethargicRecord::setup('Instrument');

?>