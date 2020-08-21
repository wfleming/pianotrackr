{include file='header.tpl'}

<table summary="New work tickets" id="newTicketsTable" class="orange">
  <caption>
    New work tickets
  </caption>
  
  <thead>
    <tr>
      <th>#</th>
      <th>Description</th>
      <th>Created</th>
      <th>Filed by</th>
      <th>Updated</th>
    </tr>
  </thead>

  <tbody>
    {foreach from=$newTickets item=ticket name=newTicketloop}
      {if $smarty.foreach.newTicketloop.index % 2 == 0}
      <tr class="odd">
      {else}  
      <tr>
      {/if}
        {assign var='createdBy' value=$ticket->createdBy()}
        {array var='urlOpts' controller='work' action='edit' id=$ticket->id}
        <td><a href="{$c->linkTo($urlOpts)}">{$ticket->id}</a></td>
        <td><a href="{$c->linkTo($urlOpts)}">{$ticket->description|summarize:15}</a></td>
        <td>{$ticket->createdAt|date_format:"%D"}</td>
        <td>{$createdBy->name()}</td>
        <td>{$ticket->updatedAt|date_format:"%D"}</td>
      </tr>
    {foreachelse}
      <tr>
        <td colspan="5"><span class="info">There are no unread work tickets.</span></td>
      </tr>
    {/foreach}
  </tbody>
</table>

<table summary="Your unfinished work tickets" id="assignedTicketsTable" class="red">
  <caption>
    Your unfinished work tickets
  </caption>
  
  <thead>
    <tr>
      <th>#</th>
      <th>Description</th>
      <th>Status</th>
      <th>Created</th>
      <th>Filed by</th>
      <th>Updated</th>
    </tr>
  </thead>

  <tbody>
    {foreach from=$assignedTickets item=ticket name=assignedTicketloop}
      {if $smarty.foreach.assignedTicketloop.index % 2 == 0}
      <tr class="odd">
      {else}  
      <tr>
      {/if}
        {assign var='createdBy' value=$ticket->createdBy()}
        {array var='urlOpts' controller='work' action='edit' id=$ticket->id}
        <td><a href="{$c->linkTo($urlOpts)}">{$ticket->id}</a></td>
        <td><a href="{$c->linkTo($urlOpts)}">{$ticket->description|summarize:15}</a></td>
        <td>{$ticket->status}</td>
        <td>{$ticket->createdAt|date_format:"%D"}</td>
        <td>{$createdBy->name()}</td>
        <td>{$ticket->updatedAt|date_format:"%D"}</td>
      </tr>
    {foreachelse}
      <tr>
        <td colspan="6"><span class="info">There are no unread work tickets.</span></td>
      </tr>
    {/foreach}
  </tbody>
</table>


{include file='footer.tpl'}