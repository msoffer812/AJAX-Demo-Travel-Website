<?php
session_start();
require 'pdo.php';

$_SESSION['email'] = htmlentities($_POST['email']);
$_SESSION['fname'] = htmlentities($_POST['fname']);
$_SESSION['lname'] = htmlentities($_POST['lname']);
$_SESSION['password'] = htmlentities($_POST['password1']);
$_SESSION['homeCountry'] = $_POST['homeCountry'];

//set up entered password to see if it matches
$salt = "jvgnirvw853485028345854yvu^%&(%^(&ERWrrefjec";
$string = $salt . $_SESSION['password'];
$password = hash('sha256', $string);


//sql selection of email and password. If it exists, the user is redirected to new account page
$sql = "SELECT * FROM users WHERE email = :eml";
$stmt = $pdo->prepare($sql);
$stmt->execute(array(
    ':eml' => $_SESSION['email']
));
$row = $stmt->fetch(PDO::FETCH_ASSOC);
if($row)
{
    //Account exists, unset session variables and redirect back to new account page, with an error message
    $_SESSION["loginMessage"] = "Account already exists";
    unset($_SESSION['email']);
    unset($_SESSION['password']);
    unset($_SESSION['fname']);
    unset($_SESSION['lname']);
    unset($_SESSION['homeCountry']);
    header('location:../client/html/create_account.html');
}
else//Create new account
{
    $sql = "INSERT INTO users(fname, lname, password, email, balance, homeCountry) VALUES (:fnm, :lnm, :pss, :eml, 0, :hc)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(
        ':fnm' => $_SESSION['fname'],
        ':lnm' => $_SESSION['lname'],
        ':pss' => $password,
        ':eml' => $_SESSION['email'],
        ':hc' => $_SESSION['homeCountry']
    ));
    $_SESSION["loginMessage"] = "Account created!";
    unset($_SESSION['email']);
    unset($_SESSION['password']);
    unset($_SESSION['fname']);
    unset($_SESSION['lname']);
    unset($_SESSION['homeCountry']);
    //redirect to login
    header('location:../client/html/accountCreated.html');
}
?>