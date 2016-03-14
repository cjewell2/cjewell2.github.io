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
$webPageTitle = "SHOW SPECTRE ACTORS";

// Database
$queryResults = null;
$dbConn = null;
$sql = "SELECT MOV_TITLE as 'Movie Name', GENRE_NAME as Genre, MOV_RELEASE_DATE as Released, RATING_LETTER as Rating, 
CONCAT((hour(MOV_RUNTIME) * 60 + minute(MOV_RUNTIME)), ' ','min')as Runtime, 
GROUP_CONCAT(CONCAT(ACTOR_FNAME,' ', ACTOR_LNAME)separator ', ') as Actors
FROM MOVIE m, ACTOR_has_MOVIE am, ACTOR a, GENRE g, RATING r
WHERE r.RATING_ID = m.RATING_RATING_ID
AND g.GENRE_ID = m.GENRE_GENRE_ID
AND m.MOV_ID = am.MOVIE_MOV_ID
AND a.ACTOR_ID = am.ACTOR_ACTOR_ID
GROUP BY MOV_ID
ORDER BY MOV_TITLE;";

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
		<th>MOVIE NAME</th>
		<th>GENRE</th>
		<th>RELEASED</th>
		<th>RATING</th>
		<th>RUNTIME</th>
		<th>ACTORS</th>
	</tr>
<?php

// Ensure we have results
if ($queryResults != null && count($queryResults) > 0) {

	// Loop through results
	foreach ($queryResults as $row) {
		print "<tr>";
		print "<td>" . $row['Movie Name'] . "</td>";
		print "<td>" . $row['Genre'] . "</td>";
		print "<td>" . $row['Released'] . "</td>";
		print "<td>" . $row['Rating'] . "</td>";
		print "<td>" . $row['Runtime'] . "</td>";
		print "<td>" . $row['Actors'] . "</td>";
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