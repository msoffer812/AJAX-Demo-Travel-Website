<?php
//Send the session variables in JSON format so the frontend can check for them
//to see if user is logged in
session_start(); // Start the session

// Retrieve the session variable
$id = isset($_SESSION['id']) ? $_SESSION['id'] : '';
$username = isset($_SESSION['user']) ? $_SESSION['user'] : '';
$countryName = isset($_SESSION['countryName']) ? $_SESSION['countryName'] : '';
$name = isset($_SESSION['name']) ? $_SESSION['name'] : '';
$balance = isset($_SESSION['balance']) ? $_SESSION['balance'] : '';
$country = isset($_SESSION['homeCountry']) ? $_SESSION['homeCountry'] : '';
$errLogin = isset($_SESSION["loginMessage"]) ? $_SESSION["loginMessage"] : '';

$balance = (float)$balance;

// Return the session variables in JSON format
echo json_encode(['status' => 'success', 'errLogin' => $errLogin, 'user' => $username, 'name' => $name, 'balance' => $balance, 'countryName' => $countryName, 'country' => $country, 'id' => $id]);
