<?php
// Database credentials
$host = "localhost"; // or "127.0.0.1"
$username = "root";  // default XAMPP username
$password = "";      // default XAMPP password is empty
$dbname = "water_distribution_system";

// Create connection
$conn = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Optional: Set character set to UTF-8
$conn->set_charset("utf8");

?>
