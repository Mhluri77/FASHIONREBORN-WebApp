# FASHIONREBORN Web Application

##  Overview
FASHIONREBORN is a PHP/MySQL web application built with XAMPP.  
It allows users to register, log in, browse products, place orders, and send messages to admins.  
Admins can verify users, manage products, and approve/reject/ship orders.

 **Important Naming Note**  
- The project folder in `htdocs` is called **FASHIONREBORN** (this is the application’s name/branding).  
- The MySQL database is called **clothingstore** (this is the backend schema).  
- The PHP connection file (`DBConn.php`) points to the `clothingstore` database.  
Both names are correct — folder = project name, database = schema name.

---

##  Requirements
- XAMPP (Apache + MySQL)
- phpMyAdmin
- Web browser (Chrome/Edge/Firefox)

---

##  Setup Instructions
1. Clone this repository:
   ```bash
   git clone https://github.com/YourUsername/FASHIONREBORN.git


Code
C:/xampp/htdocs/FASHIONREBORN/
Start Apache and MySQL in XAMPP Control Panel.

Open phpMyAdmin → create a database called:

Code
clothingstore
Import the SQL file:

Go to Import → select myClothingStore.sql → click Go.

(Optional) Load the 5‑entry .txt files manually:

Use LOAD DATA LOCAL INFILE commands provided in the repo.

Open your browser and go to:

Code
http://localhost/FASHIONREBORN/
🔗 Application URLs
Home Page → http://localhost/FASHIONREBORN/index.php

Register Page → http://localhost/FASHIONREBORN/register.php

Login Page → http://localhost/FASHIONREBORN/login.php

Admin Dashboard → http://localhost/FASHIONREBORN/admin.php

Logout → http://localhost/FASHIONREBORN/logout.php

👤 User Features
Register at: http://localhost/FASHIONREBORN/register.php

Log in at: http://localhost/FASHIONREBORN/login.php

Browse products via the home page

Place orders through the product listing

Send messages to admin via the messaging system

🔑 Admin Features
Access dashboard: http://localhost/FASHIONREBORN/admin.php

Verify new users

Add, update, delete products

Approve, reject, ship orders

View and respond to user messages

🎥 Demo Video
Watch the full demonstration here: [YouTube Link]

📂 Repository Contents
index.php → Home page

register.php → User registration

login.php → User login

admin.php → Admin dashboard

logout.php → Logout functionality

DBConn.php → Database connection file (points to clothingstore)

myClothingStore.sql → Database schema + 30 entries

tbluser_5.txt, tbladmin_5.txt, tblclothes_5.txt, tblaorder_5.txt, tblmessage_5.txt → Manual import files (5 entries each)

README.md → Setup and usage guide

🛠 Troubleshooting
Error: Unknown database 'clothingstore' → Create the database in phpMyAdmin before importing.

Error: Access denied for user 'root' → Check your DBConn.php credentials (default is root with no password).

Error: LOAD DATA LOCAL INFILE disabled → Start MySQL with --local-infile=1 or enable it in XAMPP config.

Blank page in browser → Ensure Apache is running and project folder is inside htdocs.

CSS/JS not loading → Check that asset paths are relative to FASHIONREBORN/.
