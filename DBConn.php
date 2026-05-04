<?php
$servername = "localhost";
$username   = "root";
$password   = "";
$dbname     = "clothingStore";

$conn = mysqli_init();
mysqli_options($conn, MYSQLI_OPT_LOCAL_INFILE, true);
mysqli_real_connect($conn, $servername, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Debug check
$result = $conn->query("SHOW VARIABLES LIKE 'local_infile'");
$row = $result->fetch_assoc();
echo "local_infile is set to: " . $row['Value'];
?>
