<?php
session_start();
unset($_SESSION['user']);
unset($_SESSION['name']);
unset($_SESSION['balance']);
unset($_SESSION['homeCountry']);
unset($_SESSION['id']);
unset($_SESSION['countryName']);
header('location:../client/html/logIn.html');