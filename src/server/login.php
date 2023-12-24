<?php
//logs users on
session_start();
require 'pdo.php';
if(isset($_SESSION['loginMessage']))
{
    unset($_SESSION['loginMessage']);
}
//Convert to session variables to prevent html injection
$_SESSION['email'] = htmlentities($_POST['email']);
$_SESSION['password'] = htmlentities($_POST['password']);

//set up entered password to see if it matches
$salt = "jvgnirvw853485028345854yvu^%&(%^(&ERWrrefjec";
$string = $salt . $_SESSION['password'];
$password = hash('sha256', $string);

//sql selection of email and password. If it exists, the user is logged on and redirected to main
$sql = "SELECT c.name AS countryName, user_id, fname, lname, email, balance, homeCountry " .
        "FROM users u " .
        "INNER JOIN countries c ON " .
        "c.country_id = u.homeCountry " .
        "WHERE u.email = :eml AND u.password = :ps";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(
    ':eml' => $_SESSION['email'],
    ':ps' =>$password
));
$row = $stmt->fetch(PDO::FETCH_ASSOC);
if(! $row)
{
    //Account doesn't exist, unset session variables and redirect back to login page, with an error message
    $_SESSION["loginMessage"] = "Invalid login";
    unset($_SESSION['email']);
    unset($_SESSION['password']);
    header('location:../client/html/logIn.html');
}
else
{
        $_SESSION['user'] = $row['email'];
        $_SESSION['name'] = $row['fname'] . ' ' . $row['lname'];
        $_SESSION['balance'] = $row['balance'];
        $_SESSION['homeCountry'] = $row['homeCountry'];
        $_SESSION['id'] = $row['user_id'];
        $_SESSION['countryName'] = $row['countryName'];
        unset($_SESSION['email']);
        unset($_SESSION['password']);
        header('location:../client/html/main.html');
}
?>