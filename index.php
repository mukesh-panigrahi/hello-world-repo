<?php
$servername = "10.27.251.151";
$username = "dmFyTXlEQlVzZXI=";
$password = "dmFyTXlEQlBhc3M=";

// Create connection
$conn = mysqli_connect($servername, $username, $password);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully11111";
?>
