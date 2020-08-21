{include file='header.tpl'}

<h1>Welcome to PianoTrackr.</h1>
{array var='urlOpts' controller='work' action='create'}
<p class="welcome">Please <a href="{$c->linkTo($urlOpts)}">file a work ticket</a> to notify us of any problems or requests.</h2>
<p>If you are a technician, please log in.</p>
{array var='urlOpts' controller='work' action='create'}

{include file='footer.tpl'}