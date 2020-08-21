{if !$group->isMagic()}
  <form method="post" action="{$c->linkTo($urlOpts)}">
    
  {if $c->getParam('action') == 'edit'}
    <p>
      <label for="groupName">Change group name:</label>
  {else}
    <p class="create">
      <label for="groupName">Create new group:</label>
  {/if}
    <input name="group[name]" type="text" maxlength="30" value="{$group->name}" id="groupName" class="textfield" /> <input type="submit" value="Save" class="button" />
      <input type="hidden" value="{php} echo htmlspecialchars($_SERVER['HTTP_REFERER']); {/php}" name="nextUrl"/>
      <input type="hidden" name="group[id]" value="{$group->id}" />
      
      {if $c->getParam('action') == 'edit'}
      <input type="button" onclick="top.location.href='{php} echo htmlspecialchars($_SERVER['HTTP_REFERER']); {/php}'" value="Cancel" class="button" />
      {/if}
    </p>
  </form>
{else}
  {include file='error.tpl' error="<p>This is a special system-defined group, and cannot be edited.</p>"}
{/if}