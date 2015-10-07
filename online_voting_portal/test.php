<?php
	include('connect.php');
	$result = mysqli_query($dbcon,"SELECT * FROM register"); 
 	$rowcount=mysqli_num_rows($result);
  	printf("Result set has %d rows.\n",$rowcount);
	mysqli_close($dbcon);
?>

