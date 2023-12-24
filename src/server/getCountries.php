<?php
session_start();
include 'pdo.php';
$sql = "SELECT c.country_id, " .
            "c.name, "  .
            "cur.currency_id, " .
            "cur.name AS currName " .
         "FROM countries c " .
         "INNER JOIN currencies cur ON " .
         "cur.currency_id = c.currency;";

$stmt = $pdo->query($sql);

$data = array();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $data[] = $row;
}

// Return JSON-encoded data
header('Content-Type: application/json');
echo json_encode($data);
?>