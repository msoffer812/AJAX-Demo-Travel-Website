<?php
session_start();
include 'pdo.php';

//Get value of which eview to edit
$reviewToChange = $_POST['review_id'];
//Sanitize the user input to prevent html injection
$newReview = htmlentities($_POST['newReview']);
$newRanking = htmlentities($_POST['newRanking']);

//update info in the database
$sql = "UPDATE visited_activities SET ranking = :rnk, review = :rvw WHERE id = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(
    ':rnk' => $newRanking,
    ':rvw' => $newReview,
    ':id' => $reviewToChange
));

//Redirect back to account page
header('location: ../client/html/account.html');
?>