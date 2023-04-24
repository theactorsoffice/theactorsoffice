<?php
$userID = $_GET['userID'];


if(isset($_POST["email"]))
{
 $connect = new PDO("mysql:host=www.theactorsoffice.com; dbname=actorsbusinessoffice", "kingk436", "Rimshot323!");

 $query = "
SELECT * FROM taousers WHERE userid <> $userID and useremail = '".trim($_POST["email"])."'
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
 