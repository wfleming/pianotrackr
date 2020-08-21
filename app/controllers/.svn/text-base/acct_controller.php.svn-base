<?php

class AcctController extends LethargicController {
  
  function index() {
    $this->listall();
    $this->render('acct/listall.tpl');
  }
  
  function listall() {
    $people = $this->Person->find(array('order' => 'lastName, firstName'));
    $this->smarty->assign('people', $people);
  }
  
  function create() {
    $person = new Person();
    $this->smarty->assign('person', $person);
    
    $groups = $this->Group->find('all');
    $this->smarty->assign('groups', $groups);
    
    if(isset($_POST['person'])) {
      $vals = $this->getParam('person');

      global $orm;
      $dupEmail = $orm->Person->find(array('return' => 'first', 'where' => "email = '" . $vals['email'] . "'"));
      $dupLogin = $orm->Person->find(array('return' => 'first', 'where' => "login = '" . $vals['newLogin'] . "'"));
      
      //first check password entry
      if($vals['newPassword'] != $vals['confirmPassword']) {
        $this->smarty->assign('error', "<p>Passwords don't match.</p>");
      } else if(is_a($dupEmail, 'Person')) {
        $this->smarty->assign('error', "<p>Somebody else has this email address.</p>");
      } else if(is_a($dupLogin, 'Person')) {
        $this->smarty->assign('error', "<p>Somebody else has this login.</p>");
      } else {
        $vals['password'] = md5($vals['newPassword']);
        unset($vals['confirmPassword']);  unset($vals['newPassword']);

        $vals['login'] = $vals['newLogin']; unset($vals['newLogin']);
        
        $person->updateAttrs($vals);
        $person->save();
        
        $_SESSION['message'] = "<p>Person saved successfully.</p>";
        
        $this->redirectToNextOrIndex();
      }
    }
  }
  
  function edit() {
    $person = $this->Person->find($this->getParam('id'));
    $this->smarty->assign('person', $person);
    
    $groups = $this->Group->find('all');
    $this->smarty->assign('groups', $groups);
    
    if(isset($_POST['person'])) {
      $vals = $this->getParam('person');

      global $orm;
      $dupEmail = $orm->Person->find(array('return' => 'first', 'where' => 'id <> ' . $person->id . " AND email = '" . $vals['email'] . "'"));
      $dupLogin = $orm->Person->find(array('return' => 'first', 'where' => 'id <> ' . $person->id . " AND login = '" . $vals['newLogin'] . "'"));
      
      //first check password entry
      if($vals['newPassword'] != $vals['confirmPassword']) {
        $this->smarty->assign('error', "<p>Passwords don't match.</p>");
      } else if(!empty($vals['email']) && is_a($dupEmail, 'Person')) {
        $this->smarty->assign('error', "<p>Somebody else has this email address.</p>");
      } else if(!empty($vals['newLogin']) && is_a($dupLogin, 'Person')) {
        $this->smarty->assign('error', "<p>Somebody else has this login.</p>");
      } else {
        if($vals['password'] == "") {
          $vals['password'] =  $person->password;
        } else {
          $vals['password'] = md5($vals['password']);
        }

        $vals['login'] = $vals['newLogin']; unset($vals['newLogin']);
        
        $person->updateAttrs($vals);
        $person->save();
        
        $_SESSION['message'] = "<p>Person saved successfully.</p>";
        
        $this->redirectToNextOrIndex();
      }
    }
  }
  
  function delete() {
    $person = $this->Person->find($this->getParam('id'));
    $person->delete();
    
    $this->redirectToNextOrIndex();
  }
  
  // these are the actions for actually authenticating and logging out of the system
  function login() {  
    if(isset($_POST['person']['login'])) {
      $vals = $this->getParam('person');
      $user = $this->Person->find(array('return' => 'first', 'where' => "login = '" . $vals['login'] . "'"));
      if((is_a($user, 'Person')) && ($user->authorize($vals['password']))) {
        $user->lastLogin = mktime(); $user->save();
        $_SESSION['user'] = $user;
          
        LethargicController::redirectTo('./index.php');
      } else {
        $this->smarty->assign('error', '<p>Username and password did not match any users in this system.</p>');
      }
    }
  }
  
  function logout() {
    session_unset();
    session_destroy();
    // need to redirect in order to get browsers to get new headers
    LethargicController::redirectTo('./index.php');
  }
}

?>