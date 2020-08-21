/**
 * this file defines a single function which is used to filter table rows
 * as an interface, it works much like iTunes filtering.
 *
 * the compilation of the row content into an easily searched form is done once and stored in
 * a global variable. Make sure you call prepareTableForFiltering before you actually filter!
 *
 * EXAMPLE USE:
 *   <script type="text/javascript">prepareTableForFiltering("some_table_id")</script>
 *   <form onsubmit="filterTable(document.getElementById('query_box').value, 'some_table_id'); return false;">
 *     <label for="query_box">Query:</label
 *     <input type="text" id="query_box" />
 *     <input type="submit" value="filter" />
 *   </form>
 */

var tablesData = new Array();
var tablesLaterQueries = new Array();
var tablesFilterCallCount = new Array();

function filterTableIfNew(table_id, counter) {
  if (counter < tablesFilterCallCount[table_id]) 
    return;
    
  var rows = document.getElementById(table_id).rows;
  
  var color_i = 0; // when 0, odd row, when 1, even
  
  var query = tablesLaterQueries[table_id];
  
  // If the query is empty, just show all rows
  if(query == '') {
    for(var i=0; i < rows.length; i++)
      if(color_i == 0) {
        rows[i].className = "odd";
        color_i = 1;
      } else {
        rows[i].className = "";
        color_i = 0;
      }
  } 
  
  // regexify the query string
  var regexpquery = new RegExp(query.replace(/ /, ".*"), "i");
  
  for(var i=0; i < rows.length; i++) {
    row_content = tablesData[table_id][i];

    if (counter < tablesFilterCallCount[table_id]) 
      return;
      
    if(row_content != "HEADERROW") {
      if( row_content.match(regexpquery) ) {
        if(color_i == 0) {
          rows[i].className = "odd";
          color_i = 1;
        } else {
          rows[i].className = "";
          color_i = 0;
        }
      } else {
        rows[i].className = "hidden";
      }
    }
  }
}

function filterTable(query, table_id) {
  if(tablesData[table_id] == null) {
    prepareTableForFiltering(table_id);
  }
  
  tablesFilterCallCount[table_id] += 1;
  tablesLaterQueries[table_id] = query;
  
  var callbackExpression = "filterTableIfNew(\'" + table_id + "\', " + tablesFilterCallCount[table_id] + ")";
  
  setTimeout(callbackExpression, 0);
}

function prepareTableForFiltering(table_id) {
  tablesData[table_id] = new Array();
  tablesFilterCallCount[table_id] = 0;

  var rows = document.getElementById(table_id).rows;
  
  for(var i=0; i < rows.length; i++) {
    var isHeader = false;
    
    var row_content = "";
    for(var j=0; j < rows[i].cells.length; j++) {
      if(rows[i].cells[j].nodeName == "TH") {
        row_content = "HEADERROW";
        break;
      } else {
        row_content += (rows[i].cells[j].innerHTML + " ");
      }
    }
          
    tablesData[table_id][i] = row_content;
  }
}