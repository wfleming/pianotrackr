{if !empty($user)}
<script type="text/javascript">
var workTypes = {ldelim}{rdelim};
{foreach from=$typesOfWork key=name item=type}
   workTypes.{$name|replace:' ':''} = '{$type}';
{/foreach}
  
addLoadEvent( function() {ldelim}
  var workTypeSlider = new Fx.Slide('selectWorkType', {ldelim}duration:500, mode:'vertical'{rdelim});
  {if $ticket->status != 'done'}workTypeSlider.hide();{/if}
  
  var tuningFormSlider = new Fx.Slide('tuningForm', {ldelim}duration:500, mode:'vertical'{rdelim});
  {if $tuning->_isUnsaved}tuningFormSlider.hide();{/if}
  
  var procedureFormSlider = new Fx.Slide('procedureForm', {ldelim}duration:500, mode:'vertical'{rdelim});
  {if $procedure->_isUnsaved}procedureFormSlider.hide();{/if}
  
  $('ticket_status').addEvent('change', function (){ldelim}
    var val = $('ticket_status').getValue();


    if(val == 'done') {ldelim}
      workTypeSlider.slideIn();
      workTypeFun();
    {rdelim} else {ldelim}
      workTypeSlider.slideOut();
      tuningFormSlider.slideOut();
      procedureFormSlider.slideOut();
    {rdelim}
  {rdelim});
  
  var workTypeFun = function (){ldelim}
    var val = workTypes[$('work_type').getValue().replace(' ','')];

    if(val == 'Tuning') {ldelim}
      tuningFormSlider.slideIn();
      procedureFormSlider.slideOut();
    {rdelim} else if(val == 'Procedure') {ldelim}
      tuningFormSlider.slideOut();
      procedureFormSlider.slideIn();
    {rdelim} else {ldelim}
      tuningFormSlider.slideOut();
      procedureFormSlider.slideOut();
    {rdelim}
  {rdelim}
  
  $('work_type').addEvent('change', workTypeFun);
{rdelim});

</script>
{/if}

<form method="post" action="{$c->linkTo($urlOpts)}">
  {if empty($user)}
    <h3>Returning customers</h3>
  <p class="info">Please log in using your email address and password.</p>
    <dl>
      <dt><label for="person_login">Email address:</label></dt>
      <dd><input name="person[login]" id="person_login" type="text" class="textfield" maxlength="100" /></dd>
      <dt><label for="personPassword">Password:</label></dt>
      <dd><input name="person[password]" type="password" maxlength="30" class="textfield" id="personPassword" /></dd>
  </dl>
    {* even though I call it a login, it's really an email address. the name is to avoid an &lt;input&gt; name collision *}
  <h3>New customers</h3>
  <p class="info">Please fill out the form below to register. Remember your password for the future!</p>
    <dl>
      <dt>
        <label for="person_name">Name:</label>
      </dt>
      <dd><input name="person[name]" id="person_name" type="text" class="textfield" /></dd>
      <dt>
        <label for="person_group">Member of:</label>
      </dt>
      <dd>
        <select name="person[groupId]" id="person_group">
        {foreach from=$groups item=group}
          <option value="{$group->id}">{$group->name}</option>
        {/foreach}
        <option value="0">Other</option>
        </select>
      </dd>
      <dt><label for="person_email">Email address:</label></dt>
      <dd><input name="person[email]" id="person_email" type="text" class="textfield" maxlength="100" /></dd>
      <dt><label for="person_phone">Phone number:</label></dt>
      <dd><input name="person[phone]" id="person_phone" type="text" class="textfield" maxlength="20" /></dd>
      <dt><label for="person_address">Office/address:</label></dt>
      <dd class="separate"><input name="person[address]" id="person_address" type="text" class="textfield" maxlength="100" /></dd>
      <dt><label for="personPassword">Password:</label></dt>
      <dd><input name="person[newPassword]" type="password" maxlength="30" id="personPassword" class="textfield" /></dd>
      <dt><label for="personConfirmPassword">Confirm password:</label></dt>
      <dd><input name="person[confirmPassword]" type="password" maxlength="30" id="personConfirmPassword" class="textfield" /></dd>
    
    </dl>
  {else}
    {if $c->getParam('action') == 'create'}
    <p>
      <input name="ticket[createdBy]" type="hidden" value="{$user->id}" />
    </p>
    {/if}
  {/if}
  
  
  <h3>What needs to be done?</h3>
  <p>
    <textarea name="ticket[description]" id="ticket_description" cols="50"  rows="10">{$ticket->description}</textarea>
  </p>
  
  <p>
      <label for="ticket_instrument">Assign to instrument? </label>
  
      <select name="ticket[instrumentId]" id="ticket_instrument">
        <option value="0">No </option>
        {foreach from=$pianos item=piano}
          {if $piano->id == $ticket->instrumentId}
            {assign var='selected' value=' selected="selected"'}
          {else}
            {assign var='selected' value=''}
          {/if}
          <option value="{$piano->id}"{$selected}>{$piano->brand} {$piano->model} {if !empty($piano->location)}in {$piano->location}{/if}{if !empty($piano->serial)}, #{$piano->serial}{/if}</option>
        {/foreach}
      </select>
  </p>
  {if empty($user)}
    <input name="ticket[status]" type="hidden" value="unread" />
  {else}
  <dl>
    <dt><label for="ticket_status">Status:</label></dt>
    <dd>
    <select name="ticket[status]" id="ticket_status">
      {array var='stati' 0='unread' 1='in progress' 2='waiting' 3='done'}
      {foreach from=$stati item=status}
        {if $status == $ticket->status}
          {assign var='selected' value=' selected="selected"'}
        {else}
          {assign var='selected' value=''}
        {/if}
        <option value="{$status}"{$selected}>{$status}</option>
      {/foreach}
    </select>
    </dd>
    <dt><label for="ticket_timeSpent">Time spent:</label></dt>
    <dd><input name="ticket[timeSpent]" id="ticket_timeSpent" type="text" size="5" class="textfield" value="{$ticket->timeSpent}"/></dd>
    <dt><label for="ticket_performedBy">Assigned to:</label></dt>
    <dd>
    <select name="ticket[performedBy]" id="ticket_performedBy">
      <option value="0"></option>
      {foreach from=$techs item=tech}
        {if $tech->id == $ticket->performedBy}
          {assign var='selected' value=' selected="selected"'}
        {else}
          {assign var='selected' value=''}
        {/if}
        <option value="{$tech->id}"{$selected}>{$tech->name()}</option>
      {/foreach}
    </select>    
    </dd>
  </dl>
    <div id="selectWorkType">
      <p>Was additional work done to complete this ticket? 
      {*<p>If some other work (a tuning or a procedure of some kind) was done in order to complete this ticket, please select it below. Otherwise you may save this work ticket as is.<br />*}
      <select name="work_type" id="work_type">
        {foreach from=$typesOfWork key=name item=type}
          {if is_object($ticket->work())}
            {assign var='work' value=$ticket->work()}
                  
      {if $work->typeStr() == $name}
              {assign var='selected' value='selected="selected"'}
      {else}
        {assign var='selected' value=''}
            {/if}
          {else}
            {assign var='selected' value=''}
          {/if}
          <option value="{$name}"{$selected}>{$name}</option>
        {/foreach}
      </select>
      </p>
    </div> <!-- end selectWorkType -->
    <div id="tuningForm">
      {include file='work/_formTuning.tpl'}
    </div> <!-- end tuningForm -->
    <div id="procedureForm">
      {include file='work/_formProcedure.tpl'}
    </div> <!-- end procedureForm -->
  {/if}
  <p class="buttonRow">
    <input type="hidden" value="{php} echo htmlspecialchars($_SERVER['HTTP_REFERER']); {/php}" name="nextUrl"/>
    <input name="ticket[id]" type="hidden" value="{$ticket->id}" />
    <input name="ticket[updatedBy]" type="hidden" value="{$user->id}" />
    <input type="submit" value="Save" class="button" />
    <input type="button" onclick="top.location.href='{php} echo htmlspecialchars($_SERVER['HTTP_REFERER']); {/php}'" value="Cancel" class="button" />
  </p>
</form>

