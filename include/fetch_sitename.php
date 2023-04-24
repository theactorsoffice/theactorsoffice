<?php
$userID = $_GET['userID'];


if(isset($_POST["sitename"]))
{
 $connect = new PDO("mysql:host=www.theactorsoffice.com; dbname=actorsbusinessoffice", "kingk436", "Rimshot323!");

 $query = "
SELECT * FROM sitelinks_user WHERE userid = $userID and sitename = '".trim($_POST["sitename"])."'";

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
 
 
 