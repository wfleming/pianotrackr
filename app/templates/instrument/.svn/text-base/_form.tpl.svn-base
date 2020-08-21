<form method="post" action="{$c->linkTo($urlOpts)}">
  
  <h3>General information</h3>
  <dl>
    <dt><label for="pianoBrand">Brand:</label></dt>
    <dd><input name="piano[brand]" type="text" maxlength="100" value="{$piano->brand}" id="pianoBrand" class="textfield" /></dd>
    
    <dt><label for="pianoModel">Model:</label></dt>
    <dd><input name="piano[model]" type="text" maxlength="100" value="{$piano->model}" id="pianoModel" class="textfield" /></dd>
    
    <dt><label for="pianoSerial">Serial:</label></dt>
    <dd><input name="piano[serial]" type="text" maxlength="30" value="{$piano->serial}" id="pianoSerial" class="textfield" /></dd>
    
    <dt><label for="pianoYearBuilt">Year built:</label></dt>
    <dd><input name="piano[yearBuilt]" type="text" maxlength="4" value="{$piano->yearBuilt}" id="pianoYearBuilt" class="textfield" /></dd>
    
    <dt><label for="pianoType">Type:</label></dt>
    <dd>
      <select name="piano[type]" id="pianoType">
        {foreach from=$types item=type}
          {if $type == $piano->type}
            {assign var='selected' value=' selected="selected"'}
          {else}
            {assign var='selected' value=''}
          {/if}
          <option value="{$type}"{$selected}>{$type}</option>
        {/foreach}
      </select>
    </dd>
  </dl>
  
  <h3>Location</h3>
  <dl>
    <dt><label for="pianoLocation">Location:</label></dt>
    <dd><input name="piano[location]" type="text" maxlength="100" value="{$piano->location}" id="pianoLocation" class="textfield" /></dd>
    <dt><input type="hidden" name="pianoJjwcm" value="0" /></dt>  
    <dd><input name="piano[jjwcm]" type="checkbox" value="1" {if $piano->jjwcm == 1}checked="checked"{/if} id="pianoJjwcm" /><label for="pianoJjwcm">JJWCM</label></dd>
  </dl>
  
  <h3>Faculty member</h3>
  <dl>
    <dt></dt>
    <dd>
      <select name="piano[faculty]">
        <option value=""></option>
        {foreach from=$faculty item=person}
          {if $person->id == $piano->facultyId}
            {assign var='selected' value=' selected="selected"'}
          {else}
            {assign var='selected' value=''}
          {/if}
          <option value="{$person->id}"{$selected}>{$person->name()}</option>
        {/foreach}
      </select>
    </dd>
  </dl>
  
  <h3>Value</h3>
  <dl>
    <dt><label for="pianoRetailValue">Retail value:</label></dt>
    <dd><input name="piano[retailValue]" type="text" value="{$piano->retailValue}" id="pianoRetailValue" class="textfield"  /></dd>
  
    <dt><label for="pianoReplaceValue">Replacement value:</label></dt>
    <dd><input name="piano[replaceValue]" type="text" value="{$piano->replaceValue}" id="pianoReplaceValue" class="textfield"  /></dd>
  </dl>
  
  <h3>Comments</h3>
  <p>
    <textarea name="piano[comments]" cols="50" rows="8">{$piano->comments}</textarea>
  </p>
  
  <h3>Workload information</h3>
  <script type="text/javascript" charset="utf-8"> 
    addLoadEvent(function(){ldelim}
      docSlide = new Fx.Slide('workloadDoc', {ldelim}duration:500, mode:'vertical'{rdelim});
      docSlide.hide();
    {rdelim});
  </script>
  <p class="info">These fields come directly from the Workload formula.<br />To see explanations of the various fields <input type="button" onclick="docSlide.slideIn();" value="click here" class="button" /></p>
  <div id="workloadDoc">
    <h4>Base workload</h4>
    <p><strong>40</strong> &mdash; conservatories and top performance situations with national recognition.</p>
    <p><strong>60</strong> &mdash; schools with a performance and education emphasis; schools that are a part of a larger educational/research institution that ranks nationally (well-known land grant universities, liberal arts colleges with strong music programs).</p>
    <p><strong>80</strong> &mdash; schools with an education emphasis but with strong performance areas (general land grant institutions, broad based liberal arts colleges).</p>
    <p><strong>100</strong> &mdash; general education music departments in institutions where music is not particularly emphasized or where music does not play a significant role in campus life.</p>
    <h4>Condition</h4>
    <p><strong>1.3</strong> &mdash; Excellent: Piano needs regular maintenance - regulation, tuning and voicing.</p>
    <p><strong>1.0</strong> &mdash; Good: Piano needs some minor reconditioning - hammer filing, key bushing, minor action   pinning, regulation, tuning, voicing.</p>
    <p><strong>0.8</strong> &mdash; Good/Fair: Piano needs major reconditioning – hammer replacement, major action repining,   key re-bushing, regulation, tuning, voicing.</p>
    <p><strong>0.6</strong> &mdash; Fair: Piano needs partial rebuilding - new hammers and other action parts, restringing with   existing pinblock, regulation, tuning and voicing.</p>
    <p><strong>0.4</strong> &mdash; Fair/Poor: Piano needs major rebuilding - new pin block, soundboard repair, new strings tuning pins, action parts, regulation, tuning and voicing.</p>
    <p><strong>0.2</strong> &mdash; Poor: Piano needs complete rebuild/remanufacture – new soundboard and bridges, pin block, new strings, tuning pins, action parts, regulation, tuning and voicing.</p>
    <h4>Rebuilding parameters</h4>
    <p><strong>0.4</strong> &mdash; Piano will receive complete rebuilding/remanufacturing, including new soundboard and bridges, and possibly new keyboard.</p>
    <p><strong>0.6</strong> &mdash; Piano will receive major rebuilding, including soundboard repair and new pinblock.</p>
    <p><strong>0.8</strong> &mdash; Piano will receive minor rebuilding, including restring with original pinblock, complete action parts replacement.</p>
    <p><strong>1.0</strong> &mdash; Piano will receive major reconditioning, including new hammers and possibly shanks/butts,   major repining.</p>
    <p><strong>1.2</strong> &mdash; Piano will receive minor reconditioning, filing hammers, rebushing keys, regulation.    </p>
    <h4>Climate control</h4>
    <p><strong>1.4</strong> &mdash; Excellent: 5% maximum variance in relative humidity (generally achievable only with complete humidity control unit installed and well-maintained, with back covers on uprights, string and bottom covers on grands; and with ambient humidity within 20%).</p>
    <p><strong>1.2</strong> &mdash; Very good: 10% maximum variance in relative humidity (or has complete humidity control.unit installed and well-maintained, with back covers on uprights, string and bottom covers on grands).</p>
    <p><strong>1.0</strong> &mdash; Good: 25% maximum variance in relative humidity (or has complete humidity control unit installed and well-maintained).</p>
    <p><strong>0.8</strong> &mdash; Fair: 40% maximum variance in relative humidity.</p>
    <p><strong>0.6</strong> &mdash; Poor: 60% maximum variance in relative humidity.</p>
    <p><strong>0.4</strong> &mdash; Very Poor: variance in excess of 60%.</p>
    <h4>Usage</h4>
    <p><strong>2.0</strong> &mdash; 0 to 4 hours - light usage.</p>
    <p><strong>1.7</strong> &mdash; 4 to 8 hours - light usage.</p>
    <p><strong>1.3</strong> &mdash; 8 or more hours - light usage.</p>
    <p><strong>1.3</strong> &mdash; 0 to 4 hours - medium usage.</p>
    <p><strong>1.0</strong> &mdash; 4 to 8 hours - medium usage.</p>
    <p><strong>0.7</strong> &mdash; 8 or more hours - medium usage.</p>
    <p><strong>0.8</strong> &mdash; 0 to 4 hours - heavy usage.</p>
    <p><strong>0.6</strong> &mdash; 4 to 8 hours - heavy usage.</p>
    <p><strong>0.4</strong> &mdash; 8 to 12 hours - heavy usage.</p>
    <p><strong>0.3</strong> &mdash; more than 12 hours heavy usage.</p>
    <h4>Standard of maintenance</h4>
    <p><strong>0.1</strong> &mdash; Top performance: Piano is maintained in meticulous condition at all times: tuning, voicing,   and regulation at highest possible standard, with daily or near daily attention; rebuilding and   reconditioning on an accelerated schedule so that piano is kept virtually "like new." (Generally concert instruments in recital hall.)</p>
    <p><strong>0.4</strong> &mdash; Near top performance: Piano maintained as above, but with weekly to twice-weekly 
     attention, and somewhat slacker rebuilding schedule. (Generally piano teaching studios and    the like. In some situations may apply to concert instruments).</p>
    <p><strong>0.7</strong> &mdash; Excellent: Piano kept near performance level - well tuned, voiced, and regulated. Weekly to   bi-weekly attention. Rebuilding and reconditioning on a regular basis.</p>
    <p><strong>1.0</strong> &mdash; Very good: Piano kept at an acceptable musical level - tuned, voiced and regulated on a regular basis. Bi-weekly to monthly attention. Reconditioned on a regular basis.</p>
    <p><strong>1.3</strong> &mdash; Good: Piano kept at an acceptable musical level - tuned, voiced and regulated on a regular   basis. Monthly to bi-monthly attention. Reconditioned on a regular basis.</p>
    <p><strong>1.8</strong> &mdash; Fair: Piano kept at an acceptable musical level - tuning allowed to deteriorate before retuning,   voicing and regulation kept at acceptable levels. Once to twice a semester attention.</p>
    <p><strong>2.5</strong> &mdash; Minimum: piano tuned twice a year; all keys "working."</p>
    <input type="button" onclick="docSlide.slideOut();" value="Close documentation" class="button" />
  </div>
  
  <dl>
    <dt><label for="pianoBaseWorkload">Base workload:</label></dt>
    <dd><input name="piano[baseWorkload]" type="text" value="{$piano->baseWorkload}" id="pianoBaseWorkload" class="textfield" /></dd>
    
    <dt><label for="pianoCondition">Condition:</label></dt>
    <dd><input name="piano[condition]" type="text" value="{$piano->condition}" id="pianoCondition" class="textfield" /></dd>
    
    <dt><label for="pianoRebuildingParameters">Rebuilding parameters:</label></dt>
    <dd><input name="piano[rebuildingParameters]" type="text" value="{$piano->rebuildingParameters}" id="pianoRebuildingParameters" class="textfield" /></dd>
    
    <dt><label for="pianoClimateControl">Climate control:</label></dt>
    <dd><input name="piano[climateControl]" type="text" value="{$piano->climateControl}" id="pianoClimateControl" class="textfield" /></dd>
    
    <dt><label for="pianoUsage">Usage:</label></dt>
    <dd><input name="piano[usage]" type="text" value="{$piano->usage}" id="pianoUsage" class="textfield" /></dd>
    
    <dt><label for="pianoStandardOfMaintenance">Standard of maintenance:</label></dt>
    <dd><input name="piano[standardOfMaintenance]" type="text" value="{$piano->standardOfMaintenance}" id="pianoStandardOfMaintenance" class="textfield" /></dd>
  </dl>
  
  <p class="buttonRow">
    <input type="hidden" value="{php} echo htmlspecialchars($_SERVER['HTTP_REFERER']); {/php}" name="nextUrl"/>
    <input type="hidden" name="piano[id]" value="{$piano->id}" />
    <input type="submit" value="Save" class="button"/>
    <input type="button" onclick="top.location.href='{php} echo htmlspecialchars($_SERVER['HTTP_REFERER']); {/php}'" value="Cancel" class="button" />
  </p>
</form>
