<?php
session_start();
include 'DBConn.php';

// Protect admin access
if (!isset($_SESSION['email'])) {
    echo "<div class='error'>You must <a href='login.php'>login</a> first.</div>";
    exit();
}
if ($_SESSION['role'] !== 'admin') {
    echo "<div class='error'>Access denied. You logged in as a User, not an Admin.</div>";
    exit();
}

include 'header.php';
?>

<div class="container">
    <h2>Users</h2>
    <?php
    $sql = "SELECT * FROM tbluser";
    $result = $conn->query($sql);
    echo "<table class='orders-table'>";
    echo "<tr><th>Email</th><th>Name</th><th>Role</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>{$row['email']}</td><td>{$row['name']}</td><td>{$row['role']}</td></tr>";
    }
    echo "</table>";
    ?>

    <h2>Products</h2>
    <?php
    // Handle product + order actions
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Product actions
        if (isset($_POST['add'])) {
            $name = $_POST['name'];
            $price = $_POST['price'];
            $sql = "INSERT INTO tblclothes (name, price) VALUES ('$name', '$price')";
            $conn->query($sql);
            echo "<div class='success'>Product added successfully.</div>";
        }
        if (isset($_POST['update'])) {
            $id = $_POST['product_id'];
            $name = $_POST['name'];
            $price = $_POST['price'];
            $sql = "UPDATE tblclothes SET name='$name', price='$price' WHERE product_id=$id";
            $conn->query($sql);
            echo "<div class='info'>Product updated successfully.</div>";
        }
        if (isset($_POST['delete'])) {
            $id = $_POST['product_id'];
            $sql = "DELETE FROM tblclothes WHERE product_id=$id";
            $conn->query($sql);
            echo "<div class='error'>Product deleted successfully.</div>";
        }

        // Order actions
        if (isset($_POST['approve'])) {
            $id = $_POST['order_id'];
            $sql = "UPDATE tblaorder SET status='Approved' WHERE order_id=$id";
            $conn->query($sql);
            echo "<div class='success'>Order approved.</div>";
        }
        if (isset($_POST['cancel'])) {
            $id = $_POST['order_id'];
            $sql = "UPDATE tblaorder SET status='Rejected' WHERE order_id=$id";
            $conn->query($sql);
            echo "<div class='error'>Order rejected.</div>";
        }
        if (isset($_POST['ship'])) {
            $id = $_POST['order_id'];
            $sql = "UPDATE tblaorder SET status='Shipped' WHERE order_id=$id";
            $conn->query($sql);
            echo "<div class='info'>Order marked as shipped.</div>";
        }
    }

    // Show product list
    $sql = "SELECT * FROM tblclothes";
    $result = $conn->query($sql);
    echo "<table class='orders-table'>";
    echo "<tr><th>ID</th><th>Name</th><th>Price</th><th>Actions</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>
                <form method='post' action=''>
                    <td>{$row['product_id']}<input type='hidden' name='product_id' value='{$row['product_id']}'></td>
                    <td><input type='text' name='name' value='{$row['name']}'></td>
                    <td><input type='text' name='price' value='{$row['price']}'></td>
                    <td>
                        <input type='submit' name='update' value='Update'>
                        <input type='submit' name='delete' value='Delete'>
                    </td>
                </form>
              </tr>";
    }
    echo "</table>";
    ?>

    <h3>Add New Product</h3>
    <form method="post" action="">
        <input type="text" name="name" placeholder="Product Name" required>
        <input type="text" name="price" placeholder="Price" required>
        <input type="submit" name="add" value="Add Product">
    </form>

    <h2>Orders</h2>
    <?php
    $sql = "SELECT * FROM tblaorder";
    $result = $conn->query($sql);
    echo "<table class='orders-table'>";
    echo "<tr><th>ID</th><th>User</th><th>Products</th><th>Date</th><th>Status</th><th>Actions</th></tr>";
    while ($row = $result->fetch_assoc()) {
        // Color coding for status
        $statusClass = "";
        switch ($row['status']) {
            case "Approved": $statusClass = "style='color:green;font-weight:bold;'"; break;
            case "Rejected": $statusClass = "style='color:red;font-weight:bold;'"; break;
            case "Shipped": $statusClass = "style='color:blue;font-weight:bold;'"; break;
            default: $statusClass = "style='color:orange;font-weight:bold;'"; // Pending
        }

        echo "<tr>
                <form method='post' action=''>
                    <td>{$row['order_id']}<input type='hidden' name='order_id' value='{$row['order_id']}'></td>
                    <td>{$row['user_email']}</td>
                    <td>{$row['product_ids']}</td>
                    <td>{$row['order_date']}</td>
                    <td $statusClass>{$row['status']}</td>
                    <td>
                        <input type='submit' name='approve' value='Approve'>
                        <input type='submit' name='cancel' value='Reject'>
                        <input type='submit' name='ship' value='Ship'>
                    </td>
                </form>
              </tr>";
    }
    echo "</table>";

    $conn->close();
    ?>
</div>
</body>
</html>
