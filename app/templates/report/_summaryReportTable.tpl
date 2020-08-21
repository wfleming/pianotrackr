
<table summary="{$reportTableSummary}" id="{$reportTableId}">
  <caption>
    {$reportTableSummary}
  </caption>
  
  <thead>
    <tr>
      <th><!-- Procedure name --></th>
      <th>Total number</th>
      <th>Total time spent</th>
    </tr>
  </thead>
  
  <tbody>
    <tr class="odd">
      <td>All tickets</td>
      <td>{$report.TotalTickets}</td>
      <td>{$report.TotalTime}</td>
    </tr>
    
    {foreach from=$allTypes key=key item=wType name=report name=reportloop}
    {if $smarty.foreach.reportloop.index % 2 == 0}
    <tr>
    {else}  
    <tr class="odd">
    {/if}
      <td>{$wType}</td>
      <td>{$report.$key}</td>
      {assign var="timeKey" value="`$key`Time"}
      <td>{$report.$timeKey}</td>
    </tr>
    {/foreach}
  </tbody>
</table>