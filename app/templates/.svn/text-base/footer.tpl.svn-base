      
      </div> <!-- end contentLeft -->
      
      <div id="sideBar">

        <h3>Quick Tasks</h3>

        <ul>
        {if $c->getParam('controller') == 'instrument'  &&  $c->getParam('action') == 'edit'}{array var=urlOpts action='delete' id="`$piano->id`"}
          <li><a href="{$c->linkTo($urlOpts)}" onclick="return confirm('Are you sure you want to delete? this cannot be undone.');" title="delete this piano" class="delInstrument">delete this piano</a></li>
        {elseif $c->getParam('controller') == 'group'  &&  $c->getParam('action') == 'edit'}{array var=urlOpts action='delete' id="`$group->id`"}
          <li><a href="{$c->linkTo($urlOpts)}" onclick="return confirm('Are you sure you want to delete? this cannot be undone.');" title="delete this group" class="deleteItem">delete this group</a></li>
        {elseif $c->getParam('controller') == 'acct'  &&  $c->getParam('action') == 'edit'}{array var=urlOpts action='delete' id="`$person->id`"}
          <li><a href="{$c->linkTo($urlOpts)}" onclick="return confirm('Are you sure you want to delete? this cannot be undone.');" title="delete this person" class="deleteItem">delete this person</a></li>
        {else}
          <li><a href="index.php?controller=instrument&amp;action=create" title="add instrument" class="addInstrument">add instrument</a></li>
         {/if} 
          <li><a href="index.php?controller=work&amp;action=create" title="new ticket" class="newTicket">new ticket/file work</a></li>

          <li><a href="index.php?controller=report&amp;action=weekly" title="generate report" class="generateReport">generate report</a></li>
        </ul>

      <ul class="quicksearch">
        <li class="viewTicket">
        <form id="quickformTicket" method="get" action="index.php">
          <p>
            <label>view ticket:<br />
              <input type="text" name="id" id="vticket" class="textfield" value="#" onclick="if($('vticket').getValue() == '#') {ldelim} $('vticket').setProperty('value', ''); {rdelim}"/>
            </label>
            <input type="image" name="goVticket" id="goVticket" src="images/icons/go_blue.gif" alt="View!" class="imgButton" />
            <input type="hidden" name="controller" value="work" />
            <input type="hidden" name="action" value="edit" />
          </p>
        </form>
        </li>
        <li class="viewInstrument">
        <form id="quickformInstrument" method="get" action="index.php">
          <p>
            <label>view instrument:<br />
              <input type="text" name="serial" id="vinstrument" class="textfield" value="serial#" onclick="if($('vinstrument').getValue() == 'serial#') {ldelim} $('vinstrument').setProperty('value', ''); {rdelim}"/>
            </label>
            <input type="image" name="goVinstrument" id="goVinstrument" src="images/icons/go_blue.gif" alt="View!" class="imgButton" />
            <input type="hidden" name="controller" value="instrument" />
            <input type="hidden" name="action" value="show" />
          </p>
        </form>
        </li>
      </ul>
      </div> <!-- end sideBar -->

      <div id="foot">
        {if is_a($user, 'Person')}
          {assign var='ugrp' value=$user->group()}
          {if is_a($ugrp, 'Group') && $ugrp->name == 'Administrators'}
          <p>
            {array var='urlOpts' controller='group' action='index'}
            <a href="{$c->linkTo($urlOpts)}" class="active" title="create and edit groups">Manage groups</a> |
            {array var='urlOpts' controller='acct' action='index'}
            <a href="{$c->linkTo($urlOpts)}" title="create and edit people and users">Manage people</a>
          </p>
          {/if}
        {/if}

        <p>165 Olin Hall, Ithaca NY 14850 USA | <a href="mailto:admin@pianotrackr.com" class="email">admin@pianotrackr.com</a><br />
        Content copyright &copy;2007 TEAM, LLC. All rights reserved.</p>
      </div> <!-- end foot -->
    </div> <!-- end mainContent -->
</div> <!-- end mainContainer -->
</body>
</html>
