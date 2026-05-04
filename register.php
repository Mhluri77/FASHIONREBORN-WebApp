<?php
include 'DBConn.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = md5($_POST['password']); // hash password

    $sql = "INSERT INTO tbluser (name, email, password) VALUES ('$name', '$email', '$password')";

    if ($conn->query($sql) === TRUE) {
        echo "<div class='success'>Registration successful. You can now <a href='login.php'>login</a>.</div>";
    } else {
        echo "<div class='error'>Error: " . $conn->error . "</div>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <header>
        <h2>Clothing Store - Register</h2>
    </header>

    <form method="post" action="">
        <label>Name:</label>
        <input type="text" name="name" required><br>

        <label>Email:</label>
        <input type="email" name="email" required><br>

        <label>Password:</label>
        <input type="password" name="password" required><br>

        <input type="submit" value="Register">
    </form>
</body>
</html>
