<?php
session_start();
include 'pdo.php';

$sql = "SELECT cur.name " .
    "FROM countries c " .
    "INNER JOIN currencies cur ON " .
    "cur.currency_id = c.currency " .
    "WHERE c.country_id = :id;";

$stmt = $pdo->prepare($sql);
$stmt->execute(array(
    ':id' => $_SESSION['homeCountry']
));

$row = $stmt->fetch(PDO::FETCH_ASSOC); // Fetch the data

$currency = $row['name'];

// Return JSON-encoded data
header('Content-Type: application/json');
echo json_encode(['status' => 'success', 'currency' => $currency]);
?>
