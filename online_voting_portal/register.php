<meta http-equiv="Refresh" content="3; url=<?php echo $_SERVER['HTTP_REFERER'];?>">

<?php

if(isset($_POST['register_input'])){
	
	include('connect.php');
	$name = $_POST['name'];
	$age = $_POST['age'];
	$aadhar = $_POST['aadhar'];
	$dob = $_POST['dob'];
	$password = $_POST['password'];
	echo $name, $age, $aadhar, $dob, $password;
	$sqlinsert = "INSERT INTO register (Name, Age, Aadhar_card_no, DOB, Password) VALUES ('$name',$age, '$aadhar', '$dob', '$password')";
	if(!mysqli_query($dbcon, $sqlinsert)){
		die('Error occured');		
	}
	$result = mysqli_query($dbcon,"SELECT * FROM register"); 
 	$rowcount=mysqli_num_rows($result);
	//$status = "Successfully added";
	echo "Thanks for registering";
	printf("Your VoterID %d.\n",$rowcount);

}
?>