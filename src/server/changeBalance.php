<?php
session_start();
include 'pdo.php';

//Sanitize the user input to prevent html injection
$newAmnt = htmlentities($_POST['money']);

//update info in the database
$sql = "UPDATE users SET balance= :bl WHERE email= :id";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(
    ':bl' => $newAmnt,
    ':id' => $_SESSION['user']
));
//Reset the session variable that stores the user's balance to the new amount so it is reflected correctly
$_SESSION['balance'] = $newAmnt;

//Redirect back to acctoun page
header('location: ../client/html/account.html');
?>
