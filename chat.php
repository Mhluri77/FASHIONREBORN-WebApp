<?php
session_start();
include 'DBConn.php';

// Check if user is logged in
if (!isset($_SESSION['email'])) {
    echo "<div class='error'>You must <a href='login.php'>login</a> first.</div>";
    exit();
}

$userEmail = $_SESSION['email'];

// Handle sending a message
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['receiver']) && isset($_POST['message'])) {
    $sender = $userEmail;
    $receiver = $_POST['receiver'];
    $message = $_POST['message'];

    $sql = "INSERT INTO tblmessage (sender_email, receiver_email, message_text, sent_at)
            VALUES ('$sender', '$receiver', '$message', NOW())";

    if ($conn->query($sql) === TRUE) {
        echo "<div class='success'>Message sent.</div>";
    } else {
        echo "<div class='error'>Error: " . $conn->error . "</div>";
    }
}
?>

<?php include 'header.php'; ?>

<div class="container">
    <p>Welcome, <?php echo htmlspecialchars($userEmail); ?>!</p>

    <?php
    // Show conversation if a receiver is chosen
    if (isset($_GET['receiver'])) {
        $receiver = $_GET['receiver'];
        $sql = "SELECT * FROM tblmessage 
                WHERE (sender_email='$userEmail' AND receiver_email='$receiver')
                   OR (sender_email='$receiver' AND receiver_email='$userEmail')
                ORDER BY sent_at ASC";
        $result = $conn->query($sql);

        echo "<h3>Conversation with $receiver</h3>";
        echo "<div class='chat-box'>";
        while ($row = $result->fetch_assoc()) {
            echo "<div class='chat-message'>
                    <strong>{$row['sender_email']}:</strong> {$row['message_text']}
                    <span class='timestamp'>({$row['sent_at']})</span>
                  </div>";
        }
        echo "</div>";
    }
    ?>

    <h3>Send a Message</h3>
    <form method="post" action="chat.php" class="chat-form">
        <label for="receiver">Receiver:</label>
        <select name="receiver" required>
            <?php
            // Load all users except the logged-in one
            $sql = "SELECT email FROM tbluser WHERE email != '$userEmail'";
            $users = $conn->query($sql);
            while ($u = $users->fetch_assoc()) {
                echo "<option value='{$u['email']}'>{$u['email']}</option>";
            }
            ?>
        </select><br><br>

        <label for="message">Message:</label>
        <textarea name="message" required></textarea><br><br>

        <input type="submit" value="Send Message">
    </form>

    <h3>Start a Conversation</h3>
    <div class="conversation-links">
        <?php
        // Show quick links to chat with other users
        $sql = "SELECT email FROM tbluser WHERE email != '$userEmail'";
        $users = $conn->query($sql);
        while ($u = $users->fetch_assoc()) {
            echo "<p><a href='chat.php?receiver={$u['email']}'>Chat with {$u['email']}</a></p>";
        }
        ?>
    </div>
</div>
</body>
</html>
