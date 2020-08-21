<?php

// includes and basic application setup/configuration
$GLOBALS['LethargicRecord']['dbOpts'] = array('username' => 'team',
                                              'password' => 'Pian0',
                                              'database' => 'pianotrackr');
require_once 'lib/lethargic_record.php';
require_once 'models/models.php';

$GLOBALS['LethargicRecord']['defaultController'] = 'dashboard';
$GLOBALS['LethargicRecord']['defaultAction'] = 'index';
require_once 'lib/lethargic_controller.php';
require_once 'controllers/controllers.php';


// This is a prefilter function that takes care of making sure users are authorized to do things
function checkAuth($c) {
  session_start();
  
  if(!isset($_SESSION['user']) &&
    !($c->getParam('controller') == 'work' && $c->getParam('action') == 'create') &&
    !($c->getParam('controller') == 'acct' && $c->getParam('action') == 'login') ) {
    LethargicController::redirectTo(array('controller' => 'acct', 'action' => 'login'));
  } else {
    $c->smarty->assign('user', $_SESSION['user']);
    if((($c->getParam('controller') == 'acct' && $c->getParam('action') != 'logout'
    && $c->getParam('action') != 'login') || $c->getParam('controller') == 'group') &&
      $_SESSION['user']->group()->name != 'Administrators') {
      
      $c->smarty->assign('error', "<p>This page requires administrative access. You need to sign in with an administrative account to access this page.</p>");
      $c->smarty->display('acct/login.tpl');
      exit();
    }
  }
}

LethargicController::registerPrefilter('checkAuth');

// magic!
LethargicController::route();

// for now, code to test my libraries
// $t = $orm->Instrument->find(1); 
// echo $t->age();
// echo "<pre>" . print_r($t->work(), true) . "</pre>";
// echo "<pre>created at: " . gettype($t->createdAt) . "</pre>";
// echo date ("m/d/Y", $t->createdAt);
?>