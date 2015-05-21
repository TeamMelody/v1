<?php

if (isset($_POST['id'])) {

    $moduleID = $_POST['id'];

	$queries = "call GetModuleUnPresence('$moduleID');";
	
	require 'dbConnection.php';
	$result = mysql_query($queries);

	if (!$result) {
		echo 'MySQL Error: ' . mysql_error();
		exit;
	}

	while ($row = mysql_fetch_row($result)) {
		echo "{$row[0]},";
	}

	mysql_free_result($result);
	
	mysql_close($conn);
}
?>