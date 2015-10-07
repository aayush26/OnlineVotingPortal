<?php
	ini_set('display_errors', 1); 
	error_reporting(E_ALL);
	$user = 'root';
	$pass = 'admin123';
	$db = 'online_voting_portal';
	
	$dbcon = mysqli_connect('localhost',$user,$pass,$db) or die('Error');     

	//echo "Connected successfully";
	// $dbcon = new mysqli('localhost',$user,$pass,$db) or die('Error'); ANOTHER WAY
	
?>
