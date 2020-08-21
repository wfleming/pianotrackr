<?php 

class ReportController extends LethargicController {
  
  function index() {
    $this->listall();
    $this->render('report/listall.tpl');
  }
  
  function listall() {
    //nothing to do! just a template!
  }
  
  /* not an action, just a helper */
  function _makeModelNameArray($model)
  {
    $types = $model->find('all');
    $typeNames = array();
    foreach ($types as $index => $type) {
      $typeNames[] = $type->name;
    }
    return $typeNames;
  }
  
  /* not an action, just a helper */
  function _report($extraWhereClause=false) {
    $techs = $this->Person->find(array('where' => "login <> ''"));
    $this->smarty->assign('techs', $techs);

    $people = array();
    $scope = $this->getParam('scope');
    if(empty($scope)) {
      $people = $this->Person->find('all');
      $this->smarty->assign('reportFor', 'Everybody');
    } else {
      $people = array($this->Person->find($this->getParam('scope')));
      $this->smarty->assign('reportFor', $people[0]->name());
    }
    
    $peopleIds = array();
    foreach($people as $p) { $peopleIds[] = $p->id; }
    
    $whereClause = 'status = \'done\' AND performedBy IN (' . implode(',', $peopleIds) . ')';
    if ($extraWhereClause) {
      $whereClause .= ' AND ' . $extraWhereClause;
    }
    $tickets = $this->WorkTicket->find(array('where' => $whereClause));
    
    // time to make data! woo!
    $report = array();
    
    // Find all the procedure & tuning types...
    $procedureTypeNames = $this->_makeModelNameArray($this->ProcedureType);
    $tuningTypeNames = $this->_makeModelNameArray($this->TuningType);
    $allTypesTemp = $tuningTypeNames;
    foreach($procedureTypeNames as $pType) {$allTypesTemp[] = $pType;} // this shouldn't be necessary, but array addition just did not want to work the way it should.
    $allTypes = array();
    foreach($allTypesTemp as $wType) {
      $allTypes[str_replace(' ', '', $wType)] = $wType;
      if($wType != 'Miscellaneous')
        $allTypes[str_replace(' ', '', $wType)] .= 's';
    }
    $this->smarty->assign('allTypes', $allTypes);
    
    foreach($allTypes as $key => $wType) {
      $report[$key] = 0;
      $report[$key . 'Time'] = 0;
    }

    $report['TotalTickets'] = count($tickets);
    $report['TotalTime'] = 0;
    
    $allTickets = array();
    foreach($tickets as $t) {
      $w = $t->work();
      if(is_object($w)) {
        $report[str_replace(' ', '', $w->typeStr()) ] += 1;
        $report[str_replace(' ', '', $w->typeStr()) . 'Time'] += $t->timeSpent;
      }
      $allTickets[] = $t;
      
      $report['TotalTime'] += $t->timeSpent;
    }
    
    $this->smarty->assign('reportTickets', $allTickets);
    $this->smarty->assign('report', $report);
  }
  
  function weekly() {
    $startDate = $this->getParam('startDate');
    if (!preg_match("/^\d\d\d\d-\d\d-\d\d$/", $startDate)) {
      $startDate = date("Y-m-d", strtotime("- 6 days"));
    }
    $dateTime = strtotime($startDate);
    $endDate = date("Y-m-d", strtotime("7 days", $dateTime));
    
    $this->smarty->assign('scope', $this->getParam('scope'));
    
    $this->_report("dateCompleted >= '" . $startDate . "' AND dateCompleted < '" . $endDate . "'");
    $this->smarty->assign('startDate', $startDate);
    $this->smarty->assign('endDate', $endDate);
  }
  
  function annual() {
    $year = $this->getParam('year');
    if (!is_numeric($year)) { $year = date("Y"); }
    $this->_report("YEAR(dateCompleted) = " . intval($year));
    $this->smarty->assign('year', $year);
  }
  
  function custom() {
    $startDate = $this->getParam('startDate');
    if (!preg_match("/^\d\d\d\d-\d\d-\d\d$/", $startDate)) {
      $startDate = date("Y-m-d", strtotime("- 6 days"));
    }
    $endDate = $this->getParam('endDate');
    if (!preg_match("/^\d\d\d\d-\d\d-\d\d$/", $endDate)) {
      $endDate = date("Y-m-d", mktime());
    }
    
    $type = $this->getParam('type');
    if(empty($type)) { $type = 'detailed'; }
    $this->smarty->assign('type', $type);
    
    $this->smarty->assign('scope', $this->getParam('scope'));
    
    $this->_report("dateCompleted >= '" . $startDate . "' AND dateCompleted < '" . $endDate . "'");
    $this->smarty->assign('startDate', $startDate);
    $this->smarty->assign('endDate', $endDate);
  }
}

?>