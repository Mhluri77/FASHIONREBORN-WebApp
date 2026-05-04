<?php
session_start();
include 'DBConn.php';

// Protect user access
if (!isset($_SESSION['email'])) {
    echo "<div class='error'>You must <a href='login.php'>login</a> first.</div>";
    exit();
}
if ($_SESSION['role'] !== 'user') {
    echo "<div class='error'>Access denied. Only Users can access this page.</div>";
    exit();
}

include 'header.php';
?>

<div class="container">
    <h2>Welcome, <?php echo $_SESSION['email']; ?></h2>

    <h2>Available Products</h2>
    <?php
    $sql = "SELECT * FROM tblclothes";
    $result = $conn->query($sql);

    echo "<table class='orders-table'>";
    echo "<tr><th>ID</th><th>Name</th><th>Description</th><th>Price</th><th>Action</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <form method='post' action=''>
                    <td>{$row['product_id']}</td>
                    <td>{$row['name']}</td>
                    <td>{$row['description']}</td>
                    <td>{$row['price']}</td>
                    <td>
                        <input type='hidden' name='product_id' value='{$row['product_id']}'>
                        <input type='submit' name='order' value='Place Order'>
                    </td>
                </form>
              </tr>";
    }
    echo "</table>";

    // Handle placing an order
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['order'])) {
        $product_id = $_POST['product_id'];
        $user_email = $_SESSION['email'];
        $date = date("Y-m-d H:i:s");
        $status = "Pending";

        $sql = "INSERT INTO tblaorder (user_email, product_ids, order_date, status) 
                VALUES ('$user_email', '$product_id', '$date', '$status')";
        if ($conn->query($sql) === TRUE) {
            echo "<div class='success'>Order placed successfully!</div>";
        } else {
            echo "<div class='error'>Error placing order: " . $conn->error . "</div>";
        }
    }
    ?>

    <h2>My Orders</h2>
    <?php
    $user_email = $_SESSION['email'];
    $sql = "SELECT * FROM tblaorder WHERE user_email='$user_email'";
    $result = $conn->query($sql);

    echo "<table class='orders-table'>";
    echo "<tr><th>ID</th><th>Products</th><th>Date</th><th>Status</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>{$row['order_id']}</td>
                <td>{$row['product_ids']}</td>
                <td>{$row['order_date']}</td>
                <td>{$row['status']}</td>
              </tr>";
    }
    echo "</table>";

    $conn->close();
    ?>
</div>
</body>
</html>
