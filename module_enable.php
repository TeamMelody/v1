<?php

if (isset($_POST['id'])) {

    $optionArray = $_POST['id'];

	
	require 'dbConnection.php';
	
	$queries = "call ModuleDisable('$optionArray');";
		
	$result = mysql_query($queries);

	if (!$result) {
		echo 'MySQL Error: '.mysql_error();
		exit;
	}

	while ($row = mysql_fetch_row($result)) {
		echo "$row[0],";
	}

	mysql_free_result($result);
	
	mysql_close($conn);
}
?>