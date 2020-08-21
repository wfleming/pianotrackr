{include file='header.tpl'}

<div class="reportOptions">
  <form action="index.php" method="get" accept-charset="utf-8">
    <p>
      <input type="hidden" name="controller" value="report" />
      <input type="hidden" name="action" value="annual" />
      
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
      
      <label for="reportYear">Limit report to year: <input type="text" name="year" value="{$year}" id="reportYear" maxlength="4" size="5" class="textfield" /></label>
      <input type="submit" value="Get report &rarr;" class="button" />
    </p>
  </form>
</div> <!-- end reportOptions -->

{include file='report/_summaryReportTable.tpl' reportTableId='annualReport' reportTableSummary="Reporting on `$reportFor`'s activity in `$year`"}

{include file='footer.tpl'}