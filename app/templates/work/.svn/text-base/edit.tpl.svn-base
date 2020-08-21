{include file='header.tpl'}
{if is_a($ticket, 'WorkTicket')}
  {array var='urlOpts' id=$ticket->id}

  <h2>Edit work ticket #{$ticket->id}</h2>

  {assign var='createdBy' value=$ticket->createdBy()}
  <p>Originally filed by {$createdBy->name()} at {$ticket->createdAt|date_format:"%D %I:%M %p"}.<br/>
  {assign var='updatedBy' value=$c->Person->find($ticket->updatedBy)}
  Last updated by {$updatedBy->name()} at {$ticket->updatedAt|date_format:"%D %I:%M %p"}.
  {if $ticket->status == 'done'}
  <br/>Completed at {$ticket->dateCompleted|date_format:"%D %I:%M %p"}.{/if}</p>
  
  {include file='work/_form.tpl'}
{else}
  {assign var='id' value=$c->getParam('id')}
  {include file='error.tpl' error="<p>No work ticket with id '$id' found.</p>"}
{/if}
{include file='footer.tpl'}