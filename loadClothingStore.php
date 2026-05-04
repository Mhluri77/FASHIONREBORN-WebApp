<?php
// loadClothingStore.php
// Script to recreate ClothingStore database tables

include 'DBConn.php'; // connection file

// Drop tables if they exist (order matters because of dependencies)
$conn->query("DROP TABLE IF EXISTS tblmessage");
$conn->query("DROP TABLE IF EXISTS tblaorder");
$conn->query("DROP TABLE IF EXISTS tblclothes");
$conn->query("DROP TABLE IF EXISTS tbluser");

// Create tbluser
$sqlUser = "CREATE TABLE IF NOT EXISTS tbluser (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user','admin') DEFAULT 'user'
)";
$conn->query($sqlUser);

// Create tblclothes
$sqlClothes = "CREATE TABLE IF NOT EXISTS tblclothes (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(255)
)";
$conn->query($sqlClothes);

// Create tblaorder
$sqlOrder = "CREATE TABLE IF NOT EXISTS tblaorder (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_email VARCHAR(100) NOT NULL,
    product_ids TEXT NOT NULL,
    order_date DATETIME NOT NULL,
    status ENUM('Pending','Approved','Shipped','Cancelled') DEFAULT 'Pending'
)";
$conn->query($sqlOrder);

// Create tblmessage
$sqlMessage = "CREATE TABLE IF NOT EXISTS tblmessage (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_email VARCHAR(100) NOT NULL,
    receiver_email VARCHAR(100) NOT NULL,
    message_text TEXT NOT NULL,
    sent_at DATETIME NOT NULL
)";
$conn->query($sqlMessage);

echo "<div class='success'>ClothingStore tables created successfully.</div>";

$conn->close();
?>
