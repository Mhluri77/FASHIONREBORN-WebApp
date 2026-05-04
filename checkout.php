<?php
session_start();
include 'DBConn.php';

if (!isset($_SESSION['email'])) {
    echo "<div class='error'>You must <a href='login.php'>login</a> first.</div>";
    exit();
}
?>

<?php include 'header.php'; ?>

<div class="container">
<?php
if (!empty($_SESSION['cart'])) {
    $user_email = $_SESSION['email'];
    $product_ids = implode(",", $_SESSION['cart']);

    $sql = "INSERT INTO tblaorder (user_email, product_ids, order_date)
            VALUES ('$user_email', '$product_ids', NOW())";

    if ($conn->query($sql) === TRUE) {
        echo "<div class='success'>Order placed successfully!</div>";
        $_SESSION['cart'] = []; // clear cart
    } else {
        echo "<div class='error'>Error: " . $conn->error . "</div>";
    }
} else {
    echo "<div class='info'>Your cart is empty.</div>";
}

$conn->close();
?>
</div>
</body>
</html>
