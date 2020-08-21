
<table summary="{$reportTableSummary}" id="{$reportTableId}">
  <caption>
    {$reportTableSummary}
  </caption>
  
  <thead>
    <tr>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th>Total Hours:</th>
      <th>{$report.TotalTime}</th>
    </tr>
    <tr>
      <th>Date completed</th>
      <th>Location</th>
      <th>Brand</th>
      <th>Ser No</th>
      <th>(#) Description</th>
      <th>Hours</th>
    </tr>
  </thead>
  
  <tbody>
    {foreach from=$reportTickets item=ticket name=reportloop}
    {if $smarty.foreach.reportloop.index % 2 == 0}
    <tr class="odd">
    {else}  
    <tr>
    {/if}
      <td>{$ticket->dateCompleted|date_format:"%D"}
        {if empty($scope)}{assign var='p' value=$ticket->performedBy()}by {$p->name()}{/if}
      </td>
      {assign var='piano' value=$ticket->instrument()}
      {if is_a($piano, 'Instrument')}
      <td>{$piano->location}</td>
      <td>{$piano->brand}</td>
      <td>{$piano->serial}</td>
      {else}
      <td colspan="3">No associated instrument</td>
      {/if}
      {array var='urlOpts' controller='work' action='edit' id=$ticket->id}
      {assign var='work' value=$ticket->work()}
      <td><a href="{$c->linkTo($urlOpts)}">({$ticket->id}) {if is_a($work, 'Tuning')}{$work->typeStr()} {$work->direction} {$work->amount}{/if}{if is_a($work, 'Procedure')}{$work->typeStr()}: {$work->description}{/if}{if !is_object($work)}{$ticket->description}{/if}</a></td>
      <td>{$ticket->timeSpent}</td>
    </tr>
    {/foreach}
  </tbody>
</table>