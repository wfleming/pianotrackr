{include file='header.tpl'}

{array var='urlOpts' id="`$person->id`"}
<h2>Edit
  {if !empty($person->firstName)}
    {$person->name()}
  {else}
    person
  {/if}
</h2>

{include file='acct/_form.tpl'}

{include file='footer.tpl'}