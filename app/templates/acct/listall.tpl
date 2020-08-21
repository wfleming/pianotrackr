{include file="header.tpl"}

{include file='filterWidget.tpl' table='peopleTable' info="<p>To search for a person, type some information you are looking for into the text box. To show all people, click the 'Clear' button.</p>"}

<table summary="People" id="peopleTable">
  <caption>People</caption>
  
  <thead>
    <th>Name</th>
    <th>Group</th>
    <th>Login</th>
    <th><!--  commands --></th>
  </thead>

  {foreach from=$people item=person}
    <tr>
      <td>{$person->name()} <span class="hidden">{$person->email} {$person->address} {$person->title}</span></td>
      {assign var='g' value=$person->group()}
      <td>{if is_a($g, 'Group')}{$g->name}{/if}</td>
      <td>{if $person->login != ''}{$person->login}{/if} </td>
      <td>{array var=urlOpts action='edit' id="`$person->id`"} 
      <a href="{$c->linkTo($urlOpts)}" class="editSmall">edit</a></td>
    </tr>
  {/foreach}
</table>

{array var='urlOpts' action='create'}
<p><a href="{$c->linkTo($urlOpts)}" class="add">Create a new person</a></p>

{include file="footer.tpl"}