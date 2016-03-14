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
$webPageTitle = "List Rating";

// Database
$queryResults = null;
$dbConn = null;
$sql = "SELECT RATING_LETTER, COUNT(M.MOV_ID)  
FROM RATING R
LEFT JOIN MOVIE M on M.RATING_RATING_ID = R.RATING_ID
GROUP BY RATING_LETTER ";

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
		<th>RATING CODE</th>
		<th>MOVIE WITH RATING</th>
	</tr>
<?php

// Ensure we have results
if ($queryResults != null && count($queryResults) > 0) {

	// Loop through results
	foreach ($queryResults as $row) {
		print "<tr>";
		print "<td>" . $row['RATING_LETTER'] . "</td>";
		print "<td>" . $row['COUNT(M.MOV_ID)'] . "</td>";
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