<meta http-equiv="Refresh" content="3; url=<?php echo $_SERVER['HTTP_REFERER'];?>">


<?php

if(isset($_POST['vote_cast'])){
	
	include('connect.php');
	$VoterID = $_POST['VoterID'];
	$password = $_POST['password'];
	$party = $_POST['party'];
	//printf("%s\n", $party);
	$result = mysqli_query($dbcon, "SELECT VoterId, Password FROM yet_to_vote WHERE VoterId = $VoterID");
	$row = mysqli_fetch_array($result);	
	if($row["VoterId"]==$VoterID && $row["Password"]==$password){
    	echo "You are a validated user.";
    	$sqlinsert = "INSERT INTO who_gave_vote (VoterId, Party) VALUES ($VoterID, '$party')";
		if(!mysqli_query($dbcon, $sqlinsert)){
			die('Error occured during insert');		
		}
		$sqldelete = "DELETE FROM yet_to_vote WHERE VoterId=$VoterID";
		if(!mysqli_query($dbcon, $sqldelete)){
			die('Error occured during deletion');		
		}
	}
	else
    	echo "Sorry, your credentials are not valid, Please try again.";

}
?>