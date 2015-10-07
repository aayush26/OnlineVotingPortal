<?php

if(isset($_POST['admin_panel'])){
	
	include('connect.php');
	$AdminID = $_POST['adminId'];
	$password = $_POST['password'];	
	// printf("%d\n", $AdminID);
	// printf("%s\n", $password);
	$result = mysqli_query($dbcon, "SELECT AdminId, password FROM admin_table WHERE AdminId = $AdminID");
	$row = mysqli_fetch_array($result);	
	if($row["AdminId"]==$AdminID && $row["password"]=="$password"){
    	echo "You are a validated user.";
		$result = mysqli_query($dbcon, "SELECT * FROM log_table");
		if (!$result) {
		    die("Query to show fields from table failed");
		}

		$fields_num = mysqli_num_fields($result);

		echo "<h1>Log Table</h1>";
		echo "<table border='1'><tr>";
		// printing table headers
		for($i=0; $i<$fields_num; $i++)
		{
		    $field = mysqli_fetch_field($result);
		    echo "<td>{$field->name}</td>";
		}
		echo "</tr>\n";
		// printing table rows
		while($row = mysqli_fetch_row($result))
		{
		    echo "<tr>";

		    // $row is array... foreach( .. ) puts every element
		    // of $row to $cell variable
		    foreach($row as $cell)
		        echo "<td>$cell</td>";

		    echo "</tr>\n";
		}


		$query = "SELECT party, COUNT(party) FROM who_gave_vote GROUP BY party"; 
		$result = mysqli_query($dbcon, $query) or die(mysql_error());

		// Print out result
		while($row = mysqli_fetch_array($result)){
			echo "There are ". $row['COUNT(party)'] ." ". $row['party'] ." items.";
			echo "<br />";
		}

	}
	else
    	echo "Sorry, your credentials are not valid, Please try again.";
}
?>