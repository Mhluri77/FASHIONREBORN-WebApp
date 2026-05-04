<?php
include 'DBConn.php';

// Step 1: Disable foreign key checks
$conn->query("SET FOREIGN_KEY_CHECKS = 0");

// Step 2: Drop tblUser if it exists
$sql = "DROP TABLE IF EXISTS tblUser";
$conn->query($sql);

// Step 3: Re-enable foreign key checks
$conn->query("SET FOREIGN_KEY_CHECKS = 1");

// Step 4: Recreate tblUser
$sql = "CREATE TABLE tbluser (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255)
)";
$conn->query($sql);

// Step 5: Insert the 5 users from your userData.txt
$sql = "INSERT INTO tbluser (name, email, password) VALUES
('Karabo Mohale', 'karabomohale@gmail.com', '9a617edefe5107095fa659a3effc29d9'),
('Gift Mapimele', 'giftmapimele77@gmail.com', '84e3db8594f3385c9877fe7f5b7ccaef'),
('Thabo Mokoena', 'thabomokoena@gmail.com', 'cb34fe3d8b726a138035a6c652c43d32'),
('Ayanda Dlamini', 'ayandadlamini@gmail.com', 'eea709ac8d78dded77964048061e8bc8'),
('Lerato Khumalo', 'leratokhumalo@gmail.com', 'c66b938eac14c63536324c40aee29996')";
        
if ($conn->query($sql) === TRUE) {
    echo "tblUser recreated and 5 users inserted successfully.<br>";
} else {
    echo "Error inserting users: " . $conn->error . "<br>";
}

// Step 6: Close connection
$conn->close();
?>
