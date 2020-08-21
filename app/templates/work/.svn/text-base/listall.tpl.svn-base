{include file='header.tpl'}

{include file='filterWidget.tpl' table='ticketsTable' info="<p>To search for tickets, type some information you are looking for into the text box. Note that you can search on data not visible in this table, such as piano models and procedure information. To show all tickets, click the 'Clear' button.</p>"}

<table summary="{$ticketTypes} work tickets" id="ticketsTable">
  <caption>
    {$ticketTypes} work tickets
  </caption>
  
  <thead>
    <tr>
      <th>#</th>
      <th>Description</th>
      {if stripos($c->getParam('show'),',') !== false}<th>Status</th>{/if}
      <th>Filed by</th>
      <th>Updated</th>
    </tr>
  </thead>

  <tbody>
    {foreach from=$tickets item=ticket name=ticketloop}
      {if $smarty.foreach.ticketloop.index % 2 == 0}
      <tr class="odd">
      {else}  
      <tr>
      {/if}
        {assign var='createdBy' value=$ticket->createdBy()}
        {array var='urlOpts' controller='work' action='edit' id=$ticket->id}
        <td><a href="{$c->linkTo($urlOpts)}">{$ticket->id}</a></td>
        <td><a href="{$c->linkTo($urlOpts)}">{$ticket->description|summarize:15}</a>
          {if is_object($ticket->work())}
            {assign var='work' value=$ticket->work()}      
            {if is_a($work, 'Tuning')}
              ({$work->typeStr()}: {$work->direction} {$work->amount})
            {else}
              ({$work->typeStr()}: {$work->description}, amount {$work->amount})
            {/if}
          {/if}
          <span class="hidden">
			{$ticket->description}
            {if is_object($ticket->performedBy())}
              {assign var='p' value=$ticket->performedBy()}
              {$p->name()}
            {/if}
            {assign var='piano' value=$ticket->instrument()}
            {if is_a($piano, 'Instrument')}
            {$piano->serial} {$piano->brand} {$piano->model} {$piano->location} {$piano->yearBuilt} {$piano->type} {if $piano->jjwcm}jjwcm{/if} {if is_object($piano->faculty())}{assign var='p' value=$piano->faculty()}{$p->name()}{/if}
            {/if}
          </span>
        </td>
        {if stripos($c->getParam('show'),',') !== false}<td>{$ticket->status}</td>{/if}
        <td>{$createdBy->name()}</td>
        <td>{$ticket->updatedAt|date_format:"%D"}</td>
      </tr>
    {foreachelse}
      <tr>
        <td colspan="5"><span class="info">There are no work tickets to display.</span></td>
      </tr>
    {/foreach}  </tbody>
</table>

<h3>View work tickets with the following status:</h3>
{array var='urlOpts' controller='work' action='listall'}
<script type="text/javascript">
<!--//--><![CDATA[//><!--
  var idStatusMap = {ldelim}showUnread:'unread', showInProgress:'in%20progress',
                     showWaiting:'waiting', showDone:'done'{rdelim};
  var ids = new Array(4);
  ids[0] = 'showUnread';
  ids[1] = 'showInProgress';
  ids[2] = 'showWaiting';
  ids[3] = 'showDone';
  
  function changeShow() {ldelim}
    show = '';
    for(i = 0; i<ids.length; i++) {ldelim}
      if($(ids[i]).getValue() == 'on') {ldelim}
        if(show == '')
          show = idStatusMap[ids[i]];
        else
          show = show + ',' + idStatusMap[ids[i]];
      {rdelim}
    {rdelim}
    
    $('ticketsShow').setProperty('value', show);
  {rdelim}
//--><!]]>
</script>
<form method="get" action="{$c->linkTo($urlOpts)}" onsubmit="changeShow();">
  <p class="formCheckboxRow">
    <input id="showUnread" type="checkbox" {if stripos($c->getParam('show'),'unread') !== false}checked="checked"{/if}/>
    <label for="showUnread">Unread</label>
    
    <input id="showInProgress" type="checkbox" {if stripos($c->getParam('show'),'progress') !== false}checked="checked"{/if}/>
    <label for="showInProgress">In progress</label>
    
    <input id="showWaiting" type="checkbox" {if stripos($c->getParam('show'),'waiting') !== false}checked="checked"{/if}/>
    <label for="showWaiting">Waiting</label>
    
    <input id="showDone" type="checkbox" {if stripos($c->getParam('show'),'done') !== false}checked="checked"{/if}/>
    <label for="showDone">Done</label>
    
    <input name="controller" type="hidden" value="work" />
    <input name="action" type="hidden" value="listall" />
    <input name="show" id="ticketsShow" type="hidden" value="{$c->getParam('show')}" />
    
    <input type="submit" value="Show" class="button"/>
  </p>
</form>
{include file='footer.tpl'}