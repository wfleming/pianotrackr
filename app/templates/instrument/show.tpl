{include file='header.tpl'}

{if is_a($piano, 'Instrument')}

<div id="instrumentInfo">
  <h1>{$piano->brand} {$piano->model}</h1>
  <table summary="Workload Formula Values for {$piano->serial}">
  <caption>Workload Formula Values</caption>
    <tbody>
      <tr>
        <td>Base Workload:</td>
        <td><strong>{$piano->baseWorkload}</strong></td>
      </tr>
      <tr>
        <td>Condition:</td>
        <td><strong>{$piano->condition}</strong></td>
      </tr>
      <tr>
        <td>Rebuilding Parameters:</td>
        <td><strong>{$piano->rebuildingParameters}</strong></td>
      </tr>
      <tr>
        <td>Climate Control:</td>
        <td><strong>{$piano->climateControl}</strong></td>
      </tr>
      <tr>
        <td>Age:</td>
        <td><strong>{$piano->ageForWorkloadForumla()}</strong></td>
      </tr>
      <tr>
        <td>Usage:</td>
        <td><strong>{$piano->usage}</strong></td>
      </tr>
      <tr>
        <td>Upright/Grand:</td>
        <td><strong>{$piano->ugForWorkloadFormula()}</strong></td>
      </tr>
      <tr>
        <td>Standard of Maintenance:</td>
        <td><strong>{$piano->standardOfMaintenance}</strong></td>
      </tr>
    </tbody>
  </table>
  <p class="details">Serial: {$piano->serial}</p>
  <p class="details">Location: {$piano->location}</p>
  <p class="details">Type: {$piano->type}</p>
  <p class="details">Year Built: {$piano->yearBuilt}</p>
  <p class="details">Age: {$piano->age()}</p>
  {array var=urlOpts action='edit' id="`$piano->id`"}
  <p class="editLink"><a href="{$c->linkTo($urlOpts)}" class="edit">edit this instrument</a></p>
{if !empty($piano->comments)}
  <div id="infoNotes">
    <p><strong>Notes:</strong></p>
    <p>{$piano->comments}</p>
  </div> <!-- end infoNotes -->
{/if}

</div> <!-- end instrumentInfo -->

<table summary="Unfinished work tickets" class="orange">
  <caption>
    Unfinished work tickets
  </caption>
  
  <thead>
    <tr>
      <th>#</th>
      <th>Updated</th>
      <th>Status</th>
      <th>Description</th>
    </tr>
  </thead>

  <tbody>
    {foreach from=$nftickets item=nfticket name=ticketloop1}
      {if $smarty.foreach.ticketloop1.index % 2 == 0}
      <tr class="odd">
      {else}  
      <tr>
      {/if}
        {assign var='createdBy' value=$nfticket->createdBy()}
        {array var='urlOpts' controller='work' action='edit' id=$nfticket->id}
        <td><a href="{$c->linkTo($urlOpts)}">{$nfticket->id}</a></a></td>
        <td><a href="{$c->linkTo($urlOpts)}">{$nfticket->updatedAt|date_format:"%D"}</a></td>
        <td><a href="{$c->linkTo($urlOpts)}">{$nfticket->status}</a></td>
        <td>{$nfticket->description|summarize:15}
          <span class="hidden">
			{$nfticket->description}
            {if is_object($nfticket->performedBy())}
              {assign var='p' value=$nfticket->performedBy()}
              {$p->name()}
            {/if}
            {if !is_null($nfticket->work())}
              {assign var='work' value=$nfticket->work()}
              {$work->typeStr()}
              {if is_a($work, 'Tuning')}
                {$work->direction}
              {else}
                {$work->description}
              {/if}
            {/if}
          </span>
        </td>
      </tr>
    {foreachelse}
      <tr>
        <td colspan="3"><span class="info">This instrument has no pending work tickets.</span></td>
      </tr>
    {/foreach}
  </tbody>
</table>

{include file='filterWidget.tpl' table='finishedTickets' info="<p>To search for tickets, type some information you are looking for into the text box. To show all tickets, click the 'Clear' button.</p>"}

<table summary="Finished work tickets" class="green" id="finishedTickets">
  <caption>
    Finished work tickets
  </caption>
  
  <thead>
    <tr>
      <th>#</th>
      <th>Completed</th>
		<th>Work Done</th>
    </tr>
  </thead>

  <tbody>
    {foreach from=$ftickets item=fticket name=ticketloop}
      {if $smarty.foreach.ticketloop.index % 2 == 0}
      <tr class="odd">
      {else}  
      <tr>
      {/if}
        {assign var='createdBy' value=$fticket->createdBy()}
        {array var='urlOpts' controller='work' action='edit' id=$fticket->id}
        <td><a href="{$c->linkTo($urlOpts)}">{$fticket->id}</a></td>
        <td><a href="{$c->linkTo($urlOpts)}">{$fticket->updatedAt|date_format:"%D"}
            {if is_object($fticket->performedBy())}
              {assign var='p' value=$fticket->performedBy()}
              by {$p->name()}
            {/if}</a>
        </td>
        <td>
          {if is_object($fticket->work())}
            {assign var='work' value=$fticket->work()}      
            {if is_a($work, 'Tuning')}
              {$work->typeStr()}: {$work->direction} {$work->amount}
            {else}
              {$work->typeStr()}: {$work->description}, amount {$work->amount}
            {/if}
          {/if}
        </td>
      </tr>
    {foreachelse}
      <tr>
        <td colspan="3"><span class="info">This instrument has no finished work tickets.</span></td>
      </tr>
    {/foreach}
  </tbody>
</table>
{/if}

{include file='footer.tpl'}
