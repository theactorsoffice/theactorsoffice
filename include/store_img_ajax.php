<?php 
$uploadDir = $_COOKIE['uploadDir'];
$data = $_POST['image'];
list($type, $data) = explode(';', $data);
list(, $data)      = explode(',', $data);
$data = base64_decode($data);
$imageName = time().'.png';
file_put_contents($uploadDir, $data);
?>
