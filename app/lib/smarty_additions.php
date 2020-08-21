<?php
/* This file is for defining extra smarty functionality used by LethargicFramework */

/* allows you to declare an associative array literal from within a Smarty template
 * all arguments become elements in the array, except for the special arg var, which is
 * the variable to assign the array to. Obviously, this means you can't have an element
 * in the array with the key 'var'.
 *
 * Example: {array var='urlOpts' action='edit' id=1}
 */
function smarty_function_array($params, &$smarty) {
  if(!isset($params['var'])) {
    trigger_error("ArgumentError: no var name specified", E_USER_ERROR);
  }
   
  $var = $params['var'];
  unset($params['var']);
  
  $smarty->assign($var, $params);
}

// each added function needs a global entry like this. smarty fun name => real fun name.
$GLOBALS['LethargicController']['smartyAdditions']['array'] = 'smarty_function_array';

?>