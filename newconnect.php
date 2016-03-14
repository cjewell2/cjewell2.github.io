#!/usr/local/bin/php5
<?php

// Database connection information
$dbServer = "ix.cs.uoregon.edu";
$dbPort = "3007";
$dbName = "cjewell2";   // TODO: Enter your database name (your Duck ID)
$dbUser = "cjewell2";     // TODO: Enter your database username (your Duck ID)
$dbPass = "duck284";   // TODO: Enter your database password ('duck' plus middle three numbers of your UO ID )

?>
<!-- movie table -->
<?php
include("settings.php");
$webPageTitle = "MOVIES";
$searchTerm = "";
if ($_POST['searchTerm']) $searchTerm = $_POST['searchTerm'];
$queryResults = null;
$dbConn = null;
$sql = "SELECT * FROM MOVIE ";
if (strlen($searchTerm) > 0) $sql .= " WHERE MOV_TITLE LIKE '%" . $searchTerm . "%' ";
$sql .= "ORDER BY MOV_TITLE";

try {
	$dbConn = new PDO("mysql:host=$dbServer;port=$dbPort;dbname=$dbName", $dbUser, $dbPass);
	$queryResults = $dbConn->query($sql);
} catch (PDOException $ex) {
	print "Exception: " . $ex->getMessage() . "\n<br>";
}

?>
<!-- genre table -->
<?php
include("settings.php");
$searchTerm2 = "";
if ($_POST['searchTerm2']) $searchTerm2 = $_POST['searchTerm2'];
$queryResults2 = null;
$dbConn = null;
$sql = "SELECT * FROM GENRE ";
if (strlen($searchTerm2) > 0) $sql .= " WHERE GENRE_NAME LIKE '%" . $searchTerm2 . "%' ";
$sql .= "ORDER BY GENRE_NAME";

try {
	$dbConn = new PDO("mysql:host=$dbServer;port=$dbPort;dbname=$dbName", $dbUser, $dbPass);
	$queryResults2 = $dbConn->query($sql);
} catch (PDOException $ex) {
	print "Exception: " . $ex->getMessage() . "\n<br>";
}

?>
<!-- actor table -->
<?php
include("settings.php");
$searchTerm3 = "";
if ($_POST['searchTerm3']) $searchTerm3 = $_POST['searchTerm3'];
$queryResults3 = null;
$dbConn = null;
$sql = "SELECT * FROM ACTOR ";
if (strlen($searchTerm3) > 0) $sql .= " WHERE ACTOR_FNAME LIKE '%" . $searchTerm3 . "%' ";
$sql .= "ORDER BY ACTOR_FNAME";

try {
	$dbConn = new PDO("mysql:host=$dbServer;port=$dbPort;dbname=$dbName", $dbUser, $dbPass);
	$queryResults3 = $dbConn->query($sql);
} catch (PDOException $ex) {
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
<!-- 
MOVIE TABLE -->
<h2><?=$webPageTitle?></h2>
<p>
<form action="<?=basename(__FILE__)?>" method="POST">
<input type="search" name="searchTerm" value="<?=$searchTerm?>">
<input type="submit" value="Go">
</form>
</p>
<table>
<tr>
<th>MOVIE TITLE</th>
<th>MOVIE ID</th>
<th>MOVIE RELEASE DATE</th>
<th>MOVIE GENRE</th>
<th>MOVIE LOCATION</th>
<th>RATING ID</th>
<th>MOVIE SOUNDTRACK</th>
<th>GENRE ID</th>
<th>STUDIO ID</th>
</tr>
<?php
if ($queryResults != null && count($queryResults) > 0) {
	foreach ($queryResults as $row) {
		print "<tr>";
		print "<td>" . $row['MOV_TITLE'] . "</td>";
		print "<td>" . $row['MOV_ID'] . "</td>";
		print "<td>" . $row['MOV_RELESE_DATE'] . "</td>";
	    print "<td>" . $row['MOV_GENRE'] . "</td>";
	    print "<td>" . $row['MOV_LOCATION'] . "</td>";
	    print "<td>" . $row['RATING_RATING_ID'] . "</td>";
	    print "<td>" . $row['MOV_SOUNDTRACK'] . "</td>";
	    print "<td>" . $row['GENRE_GENRE_ID'] . "</td>";
	    print "<td>" . $row['STUDIO_STUDIO_ID'] . "</td>";
		print "</tr>";
	}
} else  {
	echo "<tr><td colspan='2'>No results</td></tr>";
}
?>
</table>

<!-- GENRE TABLE -->
<h2>GENRE</h2>
<p>
<form action="<?=basename(__FILE__)?>" method="POST">
<input type="search" name="searchTerm2" value="<?=$searchTerm2?>">
<input type="submit" value="Go">
</form>
</p>
<table>
<tr>
<th>GENRE ID</th>
<th>GENRE NAME</th>
<th>GENRE DESCRIPTION</th>
<th>GENRE SUBCLASS</th>
<th>GENRE SUBCLASS DESCRIPTION</th>
</tr>
<?php
if ($queryResults2 != null && count($queryResults2) > 0) {
	foreach ($queryResults2 as $row) {
		print "<tr>";
		print "<td>" . $row['GENRE_ID'] . "</td>";
		print "<td>" . $row['GENRE_NAME'] . "</td>";
		print "<td>" . $row['GENRE_DESC'] . "</td>";
	    print "<td>" . $row['GENRE_SUB'] . "</td>";
	    print "<td>" . $row['GENRE_SUB_DESC'] . "</td>";
		print "</tr>";
	}
} else  {
	echo "<tr><td colspan='2'>No results</td></tr>";
}
?>
</table>

<!-- ACTOR TABLE -->
<h2>ACTOR</h2>
<p>search by first name</p>
<p>
<form action="<?=basename(__FILE__)?>" method="POST">
<input type="search" name="searchTerm3" value="<?=$searchTerm3?>">
<input type="submit" value="Go">
</form>
</p>
<table>
<tr>
<th>ACTOR ID</th>
<th>ACTOR FIRST NAME</th>
<th>ACTOR LAST NAME</th>
<th>ACTOR AGE </th>
<th>NUMBER OF MOVIES</th>
<th>GENDER</th>
</tr>
<?php
if ($queryResults3 != null && count($queryResults3) > 0) {
	foreach ($queryResults3 as $row) {
		print "<tr>";
		print "<td>" . $row['ACTOR_ID'] . "</td>";
		print "<td>" . $row['ACTOR_FNAME'] . "</td>";
		print "<td>" . $row['ACTOR_LNAME'] . "</td>";
	    print "<td>" . $row['ACTOR_AGE'] . "</td>";
	    print "<td>" . $row['ACTOR_MOV_NUM'] . "</td>";
	    print "<td>" . $row['ACTOR_GENDER'] . "</td>";
		print "</tr>";
	}
} else  {
	echo "<tr><td colspan='2'>No results</td></tr>";
}
?>
</table>
<p>
<a href="ratingCount.php">RATING COUNT</a>
</p>

<p>
<a href="runTime.php">RUN TIME</a>
</p>

<p>
<a href="showTimes.php">SHOW TIME</a>
</p>

<!-- Added Actor Data -->

<!-- INSERT INTO ACTOR VALUES (9, 'Christoph', 'Waltz', 56, 65, 'M'),
(10, 'Monica','Eelluci', 49, 17, 'F');
INSERT INTO ACTOR_has_MOVIE VALUES (9, 1), (10, 1); -->

<p>
<a href="showActors.php">SPECTRE ACTORS</a>
</p>

<!-- TO DELETE ACTOR MOVIE RELATIONSHIP -->

<!-- ALTER TABLE ACTOR_has_MOVIE 
ALTER TABLE `morgan4`.`ACTOR_has_MOVIE` 
DROP FOREIGN KEY `ACTOR_ACTOR_ID`;
ALTER TABLE `morgan4`.`ACTOR_has_MOVIE` 
ADD CONSTRAINT `ACTOR_ACTOR_ID`
  FOREIGN KEY (`ACTOR_ACTOR_ID`)
  REFERENCES `morgan4`.`ACTOR` (`ACTOR_ID`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION; -->

<!-- DELETED MONICA FROM ACTOR   -->
<!-- 
DELETE FROM ACTOR
WHERE ACTOR_ID = 10 -->



</body>
</html>