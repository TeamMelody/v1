<?php

$servername = "mysql.ktmwebhosting.com";
$username = "u733886938_mel";
$password = "melody123$%^";

$conn = mysql_connect($servername, $username, $password);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}else {
 
$dbname = 'u733886938_mel';

$db_selected = mysql_select_db($dbname, $conn);
if (!$db_selected) {
    die ('<br>Can\'t use $dbname: ' . mysql_error());
}

/*

echo "<h1>Connection to Database $dbname: successful</h1>";


$sql = "SHOW TABLES FROM $dbname";
$result = mysql_query($sql);

if (!$result) {
    echo "DB Error, could not list tables\n";
    echo 'MySQL Error: ' . mysql_error();
    exit;
}

echo "<br><h3>Tables </h3>";
while ($row = mysql_fetch_row($result)) {
    echo "{$row[0]}<br>";
}

mysql_free_result($result);

*/



}