{include file='header.tpl'}


<div class="reportOptions">
  <form action="index.php" method="get" accept-charset="utf-8">
    <p>
      <input type="hidden" name="controller" value="report" />
      <input type="hidden" name="action" value="weekly" />
    
      <label for="chooseScope">For:</label>
      <select name="scope" id="chooseScope">
        <option value="">everybody</option>
        {foreach from=$techs item=tech}
          {if $tech->name() == $reportFor}
            {assign var='selected' value=' selected="selected"'}
          {else}
            {assign var='selected' value=''}
          {/if}
          <option value="{$tech->id}"{$selected}>{$tech->name()}</option>
        {/foreach}
      </select>
    
      <label for="startDate">Week Starting:</label> 
      
      <input type="text" name="startDate" value="{$startDate}" id="startDate" maxlength="10" size="10" class="textfield" />
      <input type="image" id="startDateButton" value="select date" src="images/icons/calendar_select.gif" class="imgButton" />
      <input type="submit" value="Get report &rarr;" class="button" />
    <div id="chooserSpan" class="dateChooser select-free" style="display: none; visibility: hidden; width: 160px;"></div>
    </p>
  </form>
{literal}
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "startDate",      // id of the input field
        ifFormat       :    "%Y-%m-%d",      // format of the input field
        button         :    "startDateButton",   // trigger for the calendar (button ID)
        step           :    1,               // step every year
	   firstDay       :    0,               // start on Sunday
	   weekNumbers    :    false,           // don't show week numbers
	   electric       :    true             // update field as rolling over
    });
</script>
{/literal}     
</div> <!-- end reportOptions -->

{include file='report/_detailedReportTable.tpl' reportTableId='weeklyReport' reportTableSummary="Reporting on `$reportFor`'s activity from `$startDate` to `$endDate`"}

{include file='footer.tpl'}