{if empty($user)}
{array var='urlOpts' controller="acct" action="login"}
      <form method="post" action="{$c->linkTo($urlOpts)}">
        <p>
          <label for="username">login: <input name="person[login]" type="text" id="username" class="textfield" maxlength="40" /></label>
          <label for="password">password: <input name="person[password]" type="password" id="password" class="textfield" maxlength="30" /> <input type="image" name="submit" id="submit" src="images/icons/go_blue-gray.gif" alt="log in" class="imgButton" /></label><!-- <input type="submit" value="login" class="button" /> -->
        </p>
      </form>    
{else}
  <p>
    logged in as: <strong>{$user->name() }</strong> <a href="index.php?controller=acct&amp;action=logout" class="logout">[ logout ]</a>
  </p>
{/if}