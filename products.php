<?php
session_start();
include 'DBConn.php';

// Check if user is logged in
if (!isset($_SESSION['email'])) {
    echo "<div class='error'>You must <a href='login.php'>login</a> first.</div>";
    exit();
}

// Fetch products from tblClothes
$sql = "SELECT * FROM tblclothes";
$result = $conn->query($sql);
?>

<?php include 'header.php'; ?>

<div class="container">
    <p>Welcome, <?php echo htmlspecialchars($_SESSION['email']); ?>!</p>

    <div class="products">
    <?php
    if ($result && $result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            echo "<div class='product-card'>";
            echo "<h3>" . $row['name'] . "</h3>";
            echo "<p>" . $row['description'] . "</p>";
            echo "<p class='price'>Price: R" . $row['price'] . "</p>";
            if (!empty($row['image'])) {
                echo "<img src='" . $row['image'] . "' alt='Product Image'>";
            }
            echo "<form method='post' action='cart.php'>
                    <input type='hidden' name='product_id' value='" . $row['product_id'] . "'>
                    <input type='submit' value='Add to Cart'>
                  </form>";
            echo "</div>";
        }
    } else {
        echo "<div class='info'>No products available.</div>";
    }
    ?>
    </div>
</div>
</body>
</html>
