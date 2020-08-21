{include file='header.tpl'}

{include file='filterWidget.tpl' table='instrumentsTable' info="<p>To search for instruments, type some information you are looking for into the text box. Note that you can search on data not visible in this table, such as the year an instrument was made. To show all instruments, click the 'Clear' button.</p>"}

<table summary="All Instruments" id="instrumentsTable">
  <caption>
    All Instruments
  </caption>
  <thead>
  <tr>
    <th>Serial</th>
    <th>Description</th>
    <th>Location</th>
    <th>Last Update</th>
    <th><!-- other options --></th>
  </tr>
  </thead>
  <tbody>
{foreach from=$pianos item=piano name=pianoloop}
    {if $smarty.foreach.pianoloop.index % 2 == 0}
  <tr class="odd">
    {else}  
  <tr>
    {/if}
    {array var=urlOpts action='show' id="`$piano->id`"}
    <td><a href="{$c->linkTo($urlOpts)}">{$piano->serial}</a>
      <span class="hidden">{$piano->yearMade} {if $piano->jjwcm}jjwcm{/if} {if is_object($piano->faculty())}{assign var='p' value=$piano->faculty()}{$p->name()}{/if}</span>
    </td>
    <td><a href="{$c->linkTo($urlOpts)}">{$piano->brand} {$piano->model}, {$piano->type}</a></td>
    <td>{$piano->location}</td>
    {array var=urlOpts action='edit' id="`$piano->id`"}
    <td>{$piano->updatedAt|date_format:"%D"}</td>
    <td><a href="{$c->linkTo($urlOpts)}" class="editSmall" >edit</a></td>
  </tr>
{/foreach}
  </tbody>
</table>

{array var='urlOpts' action='create'}
<p><a href="{$c->linkTo($urlOpts)}" class="add">Create a new instrument</a></p>

{include file='footer.tpl'}