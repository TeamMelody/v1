<?php

if (isset($_POST['moduleGroup'])) {

    $optionArray = $_POST['moduleGroup'];

	$resultAll = array();
	$j = 0;
	
	for ($i=0; $i<count($optionArray); $i++) {
        
		$queries = "call GetModulePresence('$optionArray[$i]');";
		
		require 'dbConnection.php';
		$result = mysql_query($queries);

		if (!$result) {
			echo 'MySQL Error: ' . mysql_error();
			exit;
		}

		while ($row = mysql_fetch_row($result)) {
			$resultAll[$j] = "{$row[0]}<br>";
			$j += 1;
		}

		mysql_free_result($result);
		
		mysql_close($conn);
	}
	
	$resultFinal = array_unique($resultAll);

	foreach ($resultFinal as &$value) {
		echo $value;
	}
}
?>