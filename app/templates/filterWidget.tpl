<script type="text/javascript" src="js/filter.js"></script>
<script type="text/javascript">
<!--//--><![CDATA[//><!--
addLoadEvent( function() {ldelim}
  prepareTableForFiltering('{$table}');
  {if !empty($filterQueries.$table)}
  filterTable('{$filterQueries.$table}', '{$table}');
  {/if}
{rdelim});
//--><!]]>
</script>

<div class="filterWidget">
  {$info}
  <form id="{$table}FilterWidget" onsubmit="return false;">
    <p class="queryLine">
      <label for="{$table}FilterQuery">Find:</label>
      <input type="text" name="{$table}FilterQuery" id="{$table}FilterQuery" class="textfieldWide" value="{$filterQueries.$table}" onkeyup="filterTable($('{$table}FilterQuery').getValue(), '{$table}');" />
      <input type="button" name="Reset" id="button" class="button" value="Clear" onclick="$('{$table}FilterQuery').setProperty('value', ''); filterTable($('{$table}FilterQuery').getValue(), '{$table}');"/>
    </p>
  </form>
</div> <!-- end filterWidget -->