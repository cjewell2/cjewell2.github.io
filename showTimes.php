#!/usr/local/bin/php5
<?php

// Database connection information
$dbServer = "ix.cs.uoregon.edu";
$dbPort = "3007";
$dbName = "cjewell2";   // TODO: Enter your database name (your Duck ID)
$dbUser = "cjewell2";     // TODO: Enter your database username (your Duck ID)
$dbPass = "duck284";   // TODO: Enter your database password ('duck' plus middle three numbers of your UO ID )

?>

<?php
// Web page title
$webPageTitle = "SHOW TIMES";

// Database
$queryResults = null;
$dbConn = null;
$sql = "SELECT THEATER_NAME, SCREEN_RM_NUM, SCREEN_DATE 
FROM THEATER t, THEATER_INFO i, SCREEN s, MOVIE m
WHERE t.THEATER_ID = i.THEATER_THEATER_ID 
AND i.MOVIE_MOV_ID = s.THEATER_has_MOVIE_MOVIE_MOV_ID
AND m.MOV_ID = i.MOVIE_MOV_ID
AND MOV_TITLE = 'spectre'
AND THEATER_NAME = 'cinemark 17'
ORDER BY SCREEN_DATE DESC";

try {

	// Connect to database
	$dbConn = new PDO("mysql:host=$dbServer;port=$dbPort;dbname=$dbName", $dbUser, $dbPass);

	// Execute query and store results in a variable
	$queryResults = $dbConn->query($sql);

} catch (PDOException $ex) {

	// Handle and print any error
	print "Exception: " . $ex->getMessage() . "\n<br>";
}

?>
<!doctype html>
<html>
<head lang="en">
<title><?=$webPageTitle?></title>
<meta charset="utf-8">
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
th, td {
	padding: 15px;
}
table tr:nth-child(even) {
    background-color: #eee;
}
table tr:nth-child(odd) {
    background-color: #fff;
}
table th {
    color: white;
    background-color: black;
}
</style>
</head>
<body>

<h2><?=$webPageTitle?></h2>

<table>
	<tr>
		<th>THEATER NAME</th>
		<th>SCREEN NUMBER</th>
		<th>SHOW TIME</th>
	</tr>
<?php

// Ensure we have results
if ($queryResults != null && count($queryResults) > 0) {

	// Loop through results
	foreach ($queryResults as $row) {
		print "<tr>";
		print "<td>" . $row['THEATER_NAME'] . "</td>";
		print "<td>" . $row['SCREEN_RM_NUM'] . "</td>";
		print "<td>" . $row['SCREEN_DATE'] . "</td>";
		print "</tr>";
	}

} else  {

	// No results
	echo "<tr><td colspan='2'>No results</td></tr>";
}
?>
</table>

</body>
</html>