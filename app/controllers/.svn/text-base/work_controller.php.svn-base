<?php

class WorkController extends LethargicController {
  function index() {
    $this->listall();
    $this->render('work/listall.tpl');
  }
  
  function listall() {
    /* an arg allowed is 'show'. default value is 'show=unread'. can be a comma-separate list of statuses. */
    $show = $this->getParam('show');
    if($show == "") {
      if(!empty($_SESSION['ticketShowOpt'])) {
        $show = $_SESSION['ticketShowOpt'];
        $_GET['show'] = $_SESSION['ticketShowOpt'];
      } else {
        $show = "unread";
        $_GET['show'] = "unread";
      }
    } else {
      $_SESSION['ticketShowOpt'] = $show;
    }
    
    $shownStatuses = explode(',', $show);
    $w = "status IN ('" . implode("','", $shownStatuses) . "')";
    $findOpts = array('return' => 'all', 'where' => $w, 'order' => 'updatedAt DESC');
    
    // make an english-language representation of show statuses
    $ticketTypes = '';
    switch(count($shownStatuses)) {
      case 4:
        $ticketTypes = "All";
        break;
      case 3:
        $shownStatuses[0] = ucfirst($shownStatuses[0]);
        $last = array_pop($shownStatuses);
        $ticketTypes = implode(', ', $shownStatuses);
        $ticketTypes .= " & $last";
        break;
      default:
        $shownStatuses[0] = ucfirst($shownStatuses[0]);
        $ticketTypes = implode(' & ', $shownStatuses);
        break;
    }
    $this->smarty->assign('ticketTypes', $ticketTypes);
    
    $tickets = $this->WorkTicket->find($findOpts);
    $this->smarty->assign('tickets', $tickets);
  }
  
  function create() {
    $pianos = $this->Instrument->find('all');
    $this->smarty->assign('pianos', $pianos);
    $groups = $this->Group->find(array('where' => "name IN ('Faculty','Student','Staff')"));
    $this->smarty->assign('groups', $groups);
    $techs = $this->Person->find(array('where' => "login <> ''"));
    $this->smarty->assign('techs', $techs);
    $ticket = new WorkTicket();
    $this->smarty->assign('ticket', $ticket);
    
    // set up things that might be needed if the ticket gets marked 'done'
    $typesOfWork = array('none' => '');
    $procedureTypes = $this->ProcedureType->find('all');
    $tuningTypes = $this->TuningType->find('all');
    foreach($procedureTypes as $t) {
      $typesOfWork[$t->name] = 'Procedure';
    }
    foreach($tuningTypes as $t) {
      $typesOfWork[$t->name] = 'Tuning';
    }
    $this->smarty->assign('typesOfWork', $typesOfWork);
    $procedure = new Procedure();
    $tuning = new Tuning();
    $this->smarty->assign('procedure', $procedure);
    $this->smarty->assign('tuning', $tuning);
    
    // if submitted....
    if(isset($_POST['ticket'])) {
      $ticketVals = $this->getParam('ticket');
      
      // first deal with case of new user
      if(isset($_POST['person']['name'])) {
        $pVals = $this->getParam('person');
        
        global $orm;
        $dupEmail = $orm->Person->find(array('return' => 'first', 'where' => "email = '" . $pVals['email'] . "'"));

        if($pVals['newPassword'] != $pVals['confirmPassword']) {
          $this->smarty->assign('error', "<p>Passwords don't match.</p>");
          return;
        } else if(empty($pVals['email'])) {
          $this->smarty->assign('error', "<p>You need to enter an email address</p>");
          return;
        } else if(!empty($pVals['email']) && is_a($dupEmail, 'Person')) {
          $this->smarty->assign('error', "<p>The email address you entered already belongs to somebody in this system. Are you sure you don't have an account?</p>");
          return;
        } else {
          $pVals['password'] = md5($pVals['newPassword']);
          unset($pVals['confirmPassword']); unset($pVals['newPassword']);
          
          $nameParts = explode(' ', $pVals['name']);
          unset($pVals['name']);
          $pVals['firstName'] = $nameParts[0];
          $pVals['lastName'] = $nameParts[1];

          $person = new Person();
          $person->updateAttrs($pVals);
          $person->save();

          $ticketVals['createdBy'] = $person->id;
        }
      } else if(isset($_POST['person']['login'])) {
        // now deal with case of returning user
        $pVals = $this->getParam('person');
        $person = $this->Person->find(array('where' => "email = '" . $pVals['login'] . "'"));
        if(!$person->authorize($pVals['password'])) {
          $this->smarty->assign('error', '<p>Email address and password did not match any users in this system.</p>');
          return;
        }
        
        $ticketVals['createdBy'] = $person->id;
      }
      
      // now deal with actual ticket data
      $ticketVals['updatedBy'] = $ticketVals['createdBy'];
      $ticket->updateAttrs($ticketVals);
      $ticket->save();
      
      if($ticket->status == "done") {
        $ticket->dateCompleted = time();
        
        $wType = $this->getParam('work_type');
        
        switch($typesOfWork[$wType]) {
          case 'Tuning':
            $type = $this->TuningType->find(array('return' => 'first', 'where' => "name = '" . $wType . "'"));
            $tuning->tuningtypeId = $type->id;
            $tuningAttrs = $this->getParam('tuning');
            $tuning->updateAttrs($tuningAttrs);
            $tuning->ticketId = $ticket->id;
            $tuning->save();
            break;
            
          case 'Procedure':
            $type = $this->ProcedureType->find(array('return' => 'first', 'where' => "name = '" . $wType . "'"));
            $procedure->proceduretypeId = $type->id;
            $procedureAttrs = $this->getParam('procedure');
            $dateParts = explode('/', $procedureAttrs['startDate']);
            //NOTE: this date parsing is really fragile and prone to breaking if user doesn't enter date precisely in m/d/yyyy format.
            $procedureAttrs['startDate'] = mktime(0,0,0,$dateParts[0],$dateParts[1],$dateParts[2]);
            $procedure->updateAttrs($procedureAttrs);
            $procedure->ticketId = $ticket->id;
            $procedure->save();
            break;
        }
        
        $_SESSION['message'] = "<p>Ticket #{$ticket->id} successfully completed.</p>";
        $this->redirectToNextOrIndex();
      } else {
        
        $_SESSION['message'] = "<p>Ticket #{$ticket->id} successfully filed.</p>";
        
        if(isset($_POST['person'])) {
          $this->render('work/thanks.tpl');
        } else {
          $this->redirectToNextOrIndex();
        }
      }
    }
  }
  
  function edit() {
    $pianos = $this->Instrument->find('all');
    $this->smarty->assign('pianos', $pianos);
    $techs = $this->Person->find(array('where' => "login <> ''"));
    $this->smarty->assign('techs', $techs);
    $ticket = $this->WorkTicket->find($this->getParam('id'));
    $this->smarty->assign('ticket', $ticket);

    // if invalid ticket, premature return and display error.
    if(!is_a($ticket, 'WorkTicket')) {
      return;
    }
    
    // set up things that might be needed if the ticket gets marked 'done'
    $typesOfWork = array('none' => '');
    $procedureTypes = $this->ProcedureType->find('all');
    $tuningTypes = $this->TuningType->find('all');
    foreach($procedureTypes as $t) {
      $typesOfWork[$t->name] = 'Procedure';
    }
    foreach($tuningTypes as $t) {
      $typesOfWork[$t->name] = 'Tuning';
    }
    $this->smarty->assign('typesOfWork', $typesOfWork);
    
    $procedure = new Procedure();
    $tuning = new Tuning();
    $work = $ticket->work();
    if(is_a($work, 'Tuning')) {
      $tuning = $work;
    } else if(is_a($work, 'Procedure')) {
      $procedure = $work;
    }
    $this->smarty->assign('procedure', $procedure);
    $this->smarty->assign('tuning', $tuning);
    
    // if submitted...
    if(isset($_POST['ticket'])) {
      $vals = $this->getParam('ticket');
      
      $oldStatus = $ticket->status;
      $ticket->updateAttrs($vals);
      $ticket->save();
      
      $wType = $this->getParam('work_type');

      // deal with the possibility that the class of work was changed. delete old work.
      if(is_object($work) && get_class($work) != $typesOfWork[$wType]) {
        $work->delete();
      }
      
      if($ticket->status == "done") {
        if($oldStatus != $ticket->status)
          $ticket->dateCompleted = time();
        
        switch($typesOfWork[$wType]) {
          case 'Tuning':
            $type = $this->TuningType->find(array('return' => 'first', 'where' => "name = '" . $wType . "'"));
            $tuning->tuningtypeId = $type->id;
            $tuningAttrs = $this->getParam('tuning');
            $tuning->updateAttrs($tuningAttrs);
            $tuning->ticketId = $ticket->id;
            $tuning->save();
            break;
            
          case 'Procedure':
            $type = $this->ProcedureType->find(array('return' => 'first', 'where' => "name = '" . $wType . "'"));
            $procedure->proceduretypeId = $type->id;
            $procedureAttrs = $this->getParam('procedure');
            $dateParts = explode('/', $procedureAttrs['startDate']);
            //NOTE: this date parsing is really fragile and prone to breaking if user doesn't enter date precisely in m/d/yyyy format.
            $procedureAttrs['startDate'] = mktime(0,0,0,$dateParts[0],$dateParts[1],$dateParts[2]);
            $procedure->updateAttrs($procedureAttrs);
            $procedure->ticketId = $ticket->id;
            $procedure->save();
            break;
        }
        
        $_SESSION['message'] = "<p>Ticket #{$ticket->id} successfully completed.</p>";
        $this->redirectToNextOrIndex();
      } else {
        
        $_SESSION['message'] = "<p>Ticket #{$ticket->id} successfully saved.</p>";
        
        $this->redirectToNextOrIndex();
      }
    }
  }
}

?>