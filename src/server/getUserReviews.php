<?php
session_start();
include 'pdo.php';
$sql = "SELECT va.ranking," .
            " va.id, "  .
            " c.name AS country_name, " .
            " a.name AS activity_name,"  .
            " review" .
       " FROM users u" .
        " INNER JOIN visited_activities va" .
    " ON u.user_id = va.user_id" .
    " LEFT JOIN activities a" .
            " ON a.activity_id = va.activity_id" .
    " LEFT JOIN countries c" .
           " ON c.country_id = a.country" .
    " WHERE u.user_id = :id;";

$stmt = $pdo->prepare($sql);
$stmt->execute(array(
    ':id' => $_SESSION['id']
));

$data = array();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $data[] = $row;
}

// Return JSON-encoded data
header('Content-Type: application/json');
echo json_encode($data);
?>