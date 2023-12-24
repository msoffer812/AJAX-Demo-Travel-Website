<?php
session_start();
include 'pdo.php';

//Sanitize the user's input to prevent html injection
$review = htmlentities($_POST['newReview']);
$ranking = htmlentities($_POST['newRanking']);
$activity = $_POST['reviewName'];

//sql to make sure the user hasn't already written a review on this subject
$sql = "SELECT * FROM visited_activities WHERE user_id=:id AND activity_id = :aid";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(
    ':id' => $_SESSION['id'],
    ':aid' => $activity
));
$row = $stmt->fetch(PDO::FETCH_ASSOC);
if(!$row) {
    //Sql for insertion
    $sql = "INSERT INTO visited_activities(activity_id, user_id, ranking, review) VALUES (:act, :id, :rnk, :rvw)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(
        ':act' => $activity,
        ':id' => $_SESSION['id'],
        ':rnk' => $ranking,
        ':rvw' => $review
    ));
    header('location: ../client/html/main.html');
}

