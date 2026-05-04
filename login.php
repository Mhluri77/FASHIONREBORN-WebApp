<?php
session_start();
include 'DBConn.php';

$message = ""; // for success/error messages

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = md5($_POST['password']); // hash entered password

    // Check if account exists in tbluser
    $sql = "SELECT * FROM tbluser WHERE email='$email' AND password='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        // Store email in session
        $_SESSION['email'] = $row['email'];

        // Check if this email also exists in tbladmin
        $sql_admin = "SELECT * FROM tbladmin WHERE email='$email'";
        $result_admin = $conn->query($sql_admin);

        if ($result_admin->num_rows > 0) {
            $_SESSION['role'] = "admin";
            $message = "<div class='success'>Login successful. Welcome, " . $row['name'] . " (Admin)!</div>";
            $message .= "<div class='links'><a href='admin.php'>Go to Admin Dashboard</a></div>";
        } else {
            $_SESSION['role'] = "user";
            $message = "<div class='success'>Login successful. Welcome, " . $row['name'] . "!</div>";
            $message .= "<div class='links'><a href='products.php'>Go to Products</a></div>";
        }
    } else {
        $message = "<div class='error'>Invalid email or password.</div>";
    }
}
?>

<?php include 'header.php'; ?>

<div class="container">
    <?php echo $message; ?>

    <h3>User Login</h3>
    <form method="post" action="">
        <label>Email:</label>
        <input type="text" name="email" required><br>

        <label>Password:</label>
        <input type="password" name="password" required><br>

        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>
