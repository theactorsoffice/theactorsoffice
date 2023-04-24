<?php
$userID = $_GET['userID'];


if(isset($_POST["sitetypename"]))
{
 $connect = new PDO("mysql:host=www.theactorsoffice.com; dbname=actorsbusinessoffice", "kingk436", "Rimshot323!");

 $query = "
 SELECT * FROM sitetypes_user WHERE userid = $userID and sitetypename = '".trim($_POST["sitetypename"])."'";

 $statement = $connect->prepare($query);

 $statement->execute();

 $total_row = $statement->rowCount();

 if($total_row == 0)
 {
  $output = array(
   'success' => true
  );

  echo json_encode($output);
 }
}

?>
 
 
 