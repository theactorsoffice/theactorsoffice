<?php

$userID = $_GET['userID'];

if(isset($_POST["siteurl"]))
{
 $connect = new PDO("mysql:host=www.theactorsoffice.com; dbname=actorsbusinessoffice", "kingk436", "Rimshot323!");

 $query = "
SELECT * FROM sitelinks_user WHERE userid = $userID and siteurl = '".trim($_POST["siteurl"])."'
 ";

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
 