<?php
    session_start();
	$servername = "localhost";
	$username = "root";
	$password = "";
	try {
		$conn = new PDO("mysql:host=$servername;dbname=green_cities_alliance", $username, $password);
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch(PDOException $e) {
		echo "Connection failed : " . $e->getMessage();
	}
	
?>