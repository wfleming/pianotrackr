<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <title>PianoTrackr</title>
  <link href="css/global.css" rel="stylesheet" type="text/css" />
  <link href="css/sidebar.css" rel="stylesheet" type="text/css" />
  <link href="css/{if $c->getParam('controller') == 'dashboard' || $c->getParam('controller') == 'acct' || $c->getParam('controller') == 'group'}home{else}{$c->getParam('controller')}{/if}.css" rel="stylesheet" type="text/css" />
  <link href="css/printable.css" rel="stylesheet" type="text/css" media="print" />

  <script type="text/javascript" src="js/addloadevent.js"></script>
  <script type="text/javascript" src="js/mootools.v1.1.js"></script>
  <script type="text/javascript" src="js/cssbrowser.js"></script>
{if $c->getParam('controller') == 'report'}
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calendar-setup.js"></script>
  <script type="text/javascript" src="js/calendar-en.js"></script>
{/if}
</head>
<body>
  
<div id="headContainer">
  <div id="branding">
    <h1><a href="index.php" title="PianoTrackr">PianoTrackr</a></h1>
  </div><!-- end branding -->

  <div id="user">
    {include file='acct/loginform.tpl'}
  </div><!-- end user -->

  <div id="tabs">
    <ul>
      <li {if $c->getParam('controller') == 'dashboard'}class="active"{/if}><a href="index.php" title="Home">Home</a></li>

      <li {if $c->getParam('controller') == 'instrument'}class="active"{/if}><a href="index.php?controller=instrument&amp;action=index" title="Instruments">Instruments</a></li>

      <li {if $c->getParam('controller') == 'work'}class="active"{/if}><a href="index.php?controller=work&amp;action=index" title="Tickets">Tickets</a></li>

      <li {if $c->getParam('controller') == 'report'}class="active"{/if}><a href="index.php?controller=report" title="Reports">Reports</a></li>
    </ul>
  </div><!-- end tabs -->
  
</div>
<!-- end headContainer -->
<div class="bar">
  <p>&nbsp;</p>
</div> 
<!-- end bar -->
    
<div id="mainContainer">
  <div id="mainContent">
    <div id="contentLeft">
      
      <div id="printableLogo">
        <img src="images/head/head_logo.png" alt="PianoTrackr"/>
      </div>
      
      {* automatically include messages and errors if they exist *}
      {if isset($message)}
        {include file='message.tpl' message=$message}
      {/if}
      {if isset($error)}
        {include file='error.tpl' message=$error}
      {/if}