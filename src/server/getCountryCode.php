<?php
//Get the coordinates for the selected country:
session_start();
include 'pdo.php';
//only do if the country is selected
if (isset($_GET['country'])) {
    $selectedCountry = $_GET['country'];

    //Select the coordinates from the database
    $sql = "SELECT c.coord_long, coord_lat " .
        "FROM countries c " .
        "WHERE c.country_id = $selectedCountry";
    $stmt = $pdo->query($sql);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    //Declare the variables
    $coord_lat = $row['coord_lat'];
    $coord_long = $row['coord_long'];

    // Send over json
    header('Content-Type: application/json');
    echo json_encode(['status' => 'success', 'coord_lat' => $coord_lat, 'coord_long' => $coord_long]);
} else {
    // Send an error response if the 'country' parameter is not set
    header('Content-Type: application/json');
    echo json_encode(['status' => 'error', 'message' => 'Country parameter not set']);
}