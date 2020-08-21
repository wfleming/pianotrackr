<?php

class InstrumentController extends LethargicController {
  
  function index() {
    $this->listall();
    $this->render('instrument/listall.tpl');
  }
  
  function listall() {
    $pianos = $this->Instrument->find('all');
    $this->smarty->assign('pianos', $pianos);
  }
  
  function create() {
    $types = array('Grand', 'Upright', 'Harpsichord', 'Clavinova');
    $this->smarty->assign('types', $types);
    $fg = $this->Group->find(array('return' => 'first', 'where' => "name = 'Faculty'"));
    $faculty = $this->Person->find(array('where' => 'groupId = ' . $fg->id, 'order' => 'lastName'));
    $this->smarty->assign('faculty', $faculty);
    
    $piano = new Instrument();
    $this->smarty->assign('piano', $piano);
    
    if(isset($_POST['piano'])) {
      $vals = $this->getParam('piano');
      
      $piano->updateAttrs($vals);
      $piano->save();
        
      $_SESSION['message'] = "<p>Instrument saved successfully.</p>";
        
      $this->redirectToNextOrIndex();
    }
  }
  
  function show() {
    if(isset($_GET[id])) {
      $piano = $this->Instrument->find($this->getParam('id'));
      if(!is_a($piano, 'Instrument')) {
        //this should never happen, the id has to exist to call this (usually)
        $this->smarty->assign('error', "<p>No instrument found. You may have followed a bad link.</p>");
      } else {
        $this->smarty->assign('piano', $piano);
      }
    } else if(isset($_GET[serial])) {
      $piano = $this->Instrument->find(array('return' => 'first', 'where' => "serial = '" . $this->getParam('serial') . "'"));
      if(!is_a($piano, 'Instrument')) {
        $this->smarty->assign('error', "<p>Instrument with serial number '" . $this->getParam('serial') . "' not found.</p>");
      } else {
        $this->smarty->assign('piano', $piano);
      }
    } else {
      $this->smarty->assign('error', "<p>Invalid input.</p>");
      return;
    }
   
    if(is_a($piano, 'Instrument')) {
      $finishedTickets=$this->WorkTicket->find(array('where' => 'instrumentId = ' . $piano->id . ' AND status="done"', 'order' => 'dateCompleted DESC'));
      $nfinishedTickets=$this->WorkTicket->find(array('where' => 'instrumentId = ' . $piano->id . ' AND status<>"done"', 'order' => 'updatedAt DESC'));
      $this->smarty->assign('ftickets', $finishedTickets);
      $this->smarty->assign('nftickets', $nfinishedTickets);
    }
  }
  
  function edit() {
    $piano = $this->Instrument->find($this->getParam('id'));
    $this->smarty->assign('piano', $piano);
    
    $fg = $this->Group->find(array('return' => 'first', 'where' => "name = 'Faculty'"));
    $faculty = $this->Person->find(array('where' => 'groupId = ' . $fg->id, 'order' => 'lastName'));
    $this->smarty->assign('faculty', $faculty);
    $types = array('Grand', 'Upright', 'Harpsichord', 'Clavinova');
    $this->smarty->assign('types', $types);
  
    if(isset($_POST['piano'])) {
      $vals = $this->getParam('piano');
      
      $piano->updateAttrs($vals);
      $piano->save();
        
      $_SESSION['message'] = "<p>Instrument saved successfully.</p>";
        
      $this->redirectToNextOrIndex();
    }
  }
  
  function delete() {
    $piano = $this->Instrument->find($this->getParam('id'));
    $piano->delete();
    
    $this->redirectToNextOrIndex();
  }
}

?>