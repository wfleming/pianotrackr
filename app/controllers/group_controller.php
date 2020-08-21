<?php

class GroupController extends LethargicController {
  function index() {
    $this->listall();
    $this->render('group/listall.tpl');
  }
  
  function listall() {
    $groups = $this->Group->find(array('order' => 'name'));
    $this->smarty->assign('groups', $groups);
    
    $newGroup = new Group();
    $this->smarty->assign('newGroup', $newGroup);
  }
  
  function create() {
    $group = new Group();
    $this->smarty->assign('group', $group);
    
    if(isset($_POST['group'])) {
      $vals = $this->getParam('group');
      
      $dupGroup = $this->Group->find(array('return' => 'first', 'where' => "name = '" . $vals['name'] . "'"));
      
      if(is_a($dupGroup, 'Group')) {
        $this->smarty->assign('error', "<p>The group name '" . $vals['name'] . "' is taken. Group names must be unique.</p>");
      } else {      
        $group->updateAttrs($vals);
        $group->save();
        $this->smarty->assign('message', "<p>Group saved successfully.</p>");
      }
    }
    
    $this->listall();
    $this->render('group/listall.tpl');
  }
  
  function edit() {
    $group = $this->Group->find($this->getParam('id'));
    $this->smarty->assign('group', $group);

    if(isset($_POST['group'])) {
      $vals = $this->getParam('group');
      
      $dupGroup = $this->Group->find(array('return' => 'first', 'where' => 'id <> ' . $group->id . " AND name = '" . $vals['name'] . "'"));
      
      
      if(is_a($dupGroup, 'Group')) {
        $this->smarty->assign('error', "<p>The group name '" . $vals['name'] . "' is taken. Group names must be unique.</p>");
      } else {    
        $group->updateAttrs($vals);
        $group->save();
      
        $_SESSION['message'] = "<p>Group saved successfully.</p>";
      
        $this->redirectToNextOrIndex();
      }
    }
  }
  
  function delete() {
    $group = $this->Group->find($this->getParam('id'));
    $group->delete();
    
    $this->redirectToNextOrIndex();
  }
}

?>