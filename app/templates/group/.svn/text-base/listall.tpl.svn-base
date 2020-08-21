{include file='header.tpl'}

<table summary="Groups" id="groupsTable">
  <caption>
    Groups
  </caption>
  <thead>
  <tr>
    <th>Name</th>
    <th># members</th>
    <th><!-- commands --></th>
  </tr>
  </thead>
  <tbody>
  {foreach from=$groups item=group}
  <tr>
    <td>{$group->name}</td>
    {array var='urlOpts' controller='acct' peopleTableFilterQuery="`$group->name`"}
    <td><a href="{$c->linkTo($urlOpts)}" title="see members">{$group->membersSize()}</a></td>
    <td>
      {if !$group->isMagic()}
        {array var=urlOpts action='edit' id="`$group->id`"}
        <a href="{$c->linkTo($urlOpts)}" class="editSmall">edit</a>
      {else}
        <span class="info">(This is a special system-defined group, and cannot be edited.)</span>
      {/if}
    </td>
  </tr>
  {/foreach}
</table>

{array var='urlOpts' action='create'}
{assign var='group' value=$newGroup}
{include file='group/_form.tpl'}

{include file='footer.tpl'}