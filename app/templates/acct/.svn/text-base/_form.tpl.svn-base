<form method="post" action="{$c->linkTo($urlOpts)}">
  
  <dt><label for="personFirstName">First name:</label></dt>
  <dd><input name="person[firstName]" type="text" maxlength="100" value="{$person->firstName}" id="personFirstName" class="textfield" /></dd>
  
  <dt><label for="personMiddleName">Middle name:</label></dt>
  <dd><input name="person[middleName]" type="text" maxlength="100" value="{$person->middleName}" id="personMiddleName" class="textfield" /></dd>
  
  <dt><label for="personLastName">Last name:</label></dt>
  <dd><input name="person[lastName]" type="text" maxlength="100" value="{$person->lastName}" id="personLastName" class="textfield" /></dd>
  
  <dt><label for="personTitle">Title:</label></dt>
  <dd><input name="person[title]" type="text" maxlength="20" value="{$person->title}" id="personTitle" class="textfield" /></dd>
  
  <dt><label for="personGroupId">Group:</label></dt>
  <dd><select name="person[groupId]" id="personGroupId">
    <option value=""></option>
    {foreach from=$groups item=group}
      {if $group->id == $person->groupId}
        {assign var='selected' value=' selected="selected"'}
      {else}
        {assign var='selected' value=''}
      {/if}
      <option value="{$group->id}"{$selected}>{$group->name}</option>
    {/foreach}
  </select></dd>
  
  <h3>Contact information</h3>
  <dt><label for="personPhone">Phone:</label></dt>
  <dd><input name="person[phone]" type="text" maxlength="20" value="{$person->phone}" id="personPhone" class="textfield" /></dd>
  
  <dt><label for="personEmail">Email:</label></dt>
  <dd><input name="person[email]" type="text" maxlength="100" value="{$person->email}" id="personEmail" class="textfield" /></dd>
  
  <dt><label for="personAddress">Address:</label></dt>
  <dd><input name="person[address]" type="text" maxlength="100" value="{$person->address}" id="personAddress" class="textfield" /></dd>
  
  <h3>Login information</h3>
  <p class="info">Only fill out 'Login' for people who should be able to log in to the system (technicians, for example). Just leave it blank for people (customers, for example) who shouldn't be able to log in to the system. For people who have logins, leaving their password blank when editing them will not change their password.</p>
  <dt><label for="personLogin">Login:</label></dt>
  <dd><input name="person[newLogin]" type="text" maxlength="40" value="{$person->login}" id="personLogin" class="textfield" /></dd>
  
  <dt><label for="personPassword">Password:</label></dt>
  <dd><input name="person[newPassword]" type="password" maxlength="30" id="personPassword" class="textfield" /></dd>
  
  <dt><label for="personConfirmPassword">Confirm password:</label></dt>
  <dd><input name="person[confirmPassword]" type="password" maxlength="30" id="personConfirmPassword" class="textfield" /></dd>
  
  <p class="buttonRow">
    <input type="hidden" value="{php} echo htmlspecialchars($_SERVER['HTTP_REFERER']); {/php}" name="nextUrl"/>
    <input type="hidden" name="person[id]" value="{$person->id}" />
    <input type="submit" value="Save" class="button" /> <input type="button" onclick="top.location.href='{php} echo htmlspecialchars($_SERVER['HTTP_REFERER']); {/php}'" value="Cancel" class="button" />
  </p>
</form>