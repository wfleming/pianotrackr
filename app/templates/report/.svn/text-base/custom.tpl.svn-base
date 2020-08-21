{include file='header.tpl'}
<div id="chooserSpan" class="dateChooser select-free" style="display: none; visibility: hidden; width: 160px;"></div>
<div id="chooserSpan" class="dateChooser select-free" style="display: none; visibility: hidden; width: 160px;"></div>
<div class="reportOptions">
  <form action="index.php" method="get" accept-charset="utf-8">
    <p>
      <input type="hidden" name="controller" value="report" />
      <input type="hidden" name="action" value="custom" />
    

    
      <label for="startDate">Pick a date range:</label>
      <input type="text" name="startDate" value="{$startDate}" id="startDate" maxlength="10" size="10" class="textfield" />
      <input type="image" id="startDateButton" value="select date" src="images/icons/calendar_select.gif" class="imgButton" /> 
      
      <label for="endDate">to:</label>
      <input type="text" name="endDate" value="{$endDate}" id="endDate" maxlength="10" size="10" class="textfield" />
      <input type="image" id="endDateButton" value="select date" src="images/icons/calendar_select.gif" class="imgButton" /> 
</p>
<p>
          <label for="chooseScope">For:</label>
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
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "endDate",      // id of the input field
        ifFormat       :    "%Y-%m-%d",      // format of the input field
        button         :    "endDateButton",   // trigger for the calendar (button ID)
        step           :    1,               // step every year
	   firstDay       :    0,               // start on Sunday
	   weekNumbers    :    false,           // don't show week numbers
	   electric       :    true             // update field as rolling over
    });
</script>
{/literal}
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
      Report style:
      <input name="type" id="typeDetailed" type="radio" value="detailed" {if $type == 'detailed'}checked="checked"{/if}/>
      <label for="typeDetailed">Detailed</label>
      <input name="type" id="typeSummary" type="radio" value="summary" {if $type == 'summary'}checked="checked"{/if}/>
      <label for="typeSummary">Summary</label>
    
      <input type="submit" value="Get report &rarr;" class="button" />
    </p>  
  </form>
</div> <!-- end reportOptions -->

{include file="report/_`$type`ReportTable.tpl" reportTableId='customReport' reportTableSummary="Reporting on `$reportFor`'s activity from `$startDate` to `$endDate`"}

{include file='footer.tpl'}