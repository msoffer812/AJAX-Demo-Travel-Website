<?php
session_start();
include 'pdo.php';
$sql = "SELECT " .
    "a.cost, " .
    "a.timeMins, " .
    "    a.activity_id AS activity_id, " .
    "    c.description AS country_description, " .
    "    a.country AS country_id, " .
    "    a.name AS activity_name, " .
    "    c.name AS country_name, " .
    "    va.ranking AS ranking, " .
    "    va.review AS review, " .
    "    u.fname AS user_name, " .
    "    avg_ranking.avg_activity_ranking AS average_activity_ranking " .
    "FROM visited_activities va " .
    "LEFT JOIN activities a ON va.activity_id = a.activity_id " .
    "LEFT JOIN countries c ON a.country = c.country_id " .
    "LEFT JOIN users u ON va.user_id = u.user_id " .
    "LEFT JOIN ( " .
    "    SELECT " .
    "        va.activity_id, ".
    "        AVG(va.ranking) AS avg_activity_ranking " .
    "    FROM visited_activities va " .
    "    GROUP BY va.activity_id " .
    ") AS avg_ranking ON va.activity_id = avg_ranking.activity_id;";

$stmt = $pdo->query($sql);

$data = array();
while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    $data[] = $row;
}

// Return JSON-encoded data
header('Content-Type: application/json');
echo json_encode($data);
?>