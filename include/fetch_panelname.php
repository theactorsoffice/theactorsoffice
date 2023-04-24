<?php
$userID = $_GET['userID'];

if(isset($_POST["sitetypename"]))
{
 $connect = new PDO("mysql:host=www.theactorsoffice.com; dbname=actorsbusinessoffice", "kingk436", "Rimshot323!");

 $query = "
SELECT sitetypename from sitetypes_user WHERE userid = $userID AND sitetypename = '".trim($_POST["sitetypename"])."'";

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
 
 