<?php
session_start();
include 'DBConn.php';

// Initialize cart if not set
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

// Handle Add to Cart action
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['product_id'])) {
    $product_id = $_POST['product_id'];
    $_SESSION['cart'][] = $product_id;
    echo "<div class='success'>Product added to cart.</div>";
}
?>

<?php include 'header.php'; ?>

<div class="container">
<?php
if (!empty($_SESSION['cart'])) {
    echo "<table class='orders-table'>";
    echo "<tr><th>Product</th><th>Price</th></tr>";

    $ids = implode(",", $_SESSION['cart']);
    $sql = "SELECT * FROM tblclothes WHERE product_id IN ($ids)";
    $result = $conn->query($sql);

    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>{$row['name']}</td>
                <td>R{$row['price']}</td>
              </tr>";
    }

    echo "</table>";

    echo "<form method='post' action='checkout.php'>
            <input type='submit' value='Checkout'>
          </form>";
} else {
    echo "<div class='info'>Your cart is empty.</div>";
}

$conn->close();
?>
</div>
</body>
</html>
