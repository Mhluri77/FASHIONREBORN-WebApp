<?php
session_start();
include 'DBConn.php';

// Check if user is logged in
if (!isset($_SESSION['email'])) {
    echo "<div class='error'>You must <a href='login.php'>login</a> first.</div>";
    exit();
}

$userEmail = $_SESSION['email'];

// Fetch orders for this user (include status explicitly)
$sql = "SELECT order_id, product_ids, order_date, status 
        FROM tblaorder 
        WHERE user_email='$userEmail'";
$result = $conn->query($sql);
?>

<?php include 'header.php'; ?>

<div class="container">
    <p>Welcome, <?php echo htmlspecialchars($userEmail); ?>!</p>

    <?php
    if ($result && $result->num_rows > 0) {
        echo "<table class='orders-table'>";
        echo "<tr><th>Order ID</th><th>Products</th><th>Date</th><th>Status</th></tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>{$row['order_id']}</td>
                    <td>{$row['product_ids']}</td>
                    <td>{$row['order_date']}</td>
                    <td>" . (isset($row['status']) ? $row['status'] : 'Pending') . "</td>
                  </tr>";
        }
        echo "</table>";
    } else {
        echo "<div class='info'>You have no orders yet.</div>";
    }
    ?>
</div>
</body>
</html>
