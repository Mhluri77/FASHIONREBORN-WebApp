-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2026 at 07:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothingstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`admin_id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Karabo Mohale', 'karabomohale@gmail.com', '9a617edefe5107095fa659a3effc29d9', 'admin'),
(2, 'Gift Mapimele', 'giftmapimele77@gmail.com', '84e3db8594f3385c9877fe7f5b7ccaef', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tblaorder`
--

CREATE TABLE `tblaorder` (
  `order_id` int(11) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `product_ids` text NOT NULL,
  `order_date` datetime NOT NULL,
  `status` enum('Pending','Approved','Shipped','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblaorder`
--

INSERT INTO `tblaorder` (`order_id`, `user_email`, `product_ids`, `order_date`, `status`) VALUES
(1, 'karabomohale@gmail.com', '1', '2026-05-01 10:00:00', ''),
(2, 'giftmapimele77@gmail.com', '2', '2026-05-01 11:00:00', ''),
(3, 'thabomokoena@gmail.com', '3', '2026-05-02 09:30:00', ''),
(4, 'ayandadlamini@gmail.com', '4', '2026-05-02 14:15:00', ''),
(5, 'leratokhumalo@gmail.com', '5', '2026-05-03 16:45:00', ''),
(8, 'karabomohale@gmail.com', '1', '2026-05-01 10:00:00', 'Pending'),
(9, 'giftmapimele77@gmail.com', '2', '2026-05-01 11:00:00', 'Approved'),
(10, 'thabomokoena@gmail.com', '3', '2026-05-02 09:30:00', 'Shipped'),
(11, 'ayandadlamini@gmail.com', '4', '2026-05-02 14:15:00', 'Cancelled'),
(12, 'leratokhumalo@gmail.com', '5', '2026-05-03 16:45:00', 'Pending'),
(13, 'siphonkosi@gmail.com', '6', '2026-05-04 10:00:00', 'Pending'),
(14, 'nomsazulu@gmail.com', '7', '2026-05-04 11:00:00', 'Approved'),
(15, 'mphosebola@gmail.com', '8', '2026-05-05 09:30:00', 'Shipped'),
(16, 'preciousndlovu@gmail.com', '9', '2026-05-05 14:15:00', 'Cancelled'),
(17, 'sanelemthembu@gmail.com', '10', '2026-05-06 16:45:00', 'Pending'),
(18, 'admin1@example.com', '11', '2026-05-07 10:00:00', 'Approved'),
(19, 'admin2@example.com', '12', '2026-05-07 11:00:00', 'Shipped'),
(20, 'admin3@example.com', '13', '2026-05-08 09:30:00', 'Cancelled'),
(21, 'admin4@example.com', '14', '2026-05-08 14:15:00', 'Pending'),
(22, 'admin5@example.com', '15', '2026-05-09 16:45:00', 'Approved'),
(23, 'tshepomaluleke@gmail.com', '16', '2026-05-10 10:00:00', 'Pending'),
(24, 'kabelophiri@gmail.com', '17', '2026-05-10 11:00:00', 'Approved'),
(25, 'boitumeloradebe@gmail.com', '18', '2026-05-11 09:30:00', 'Shipped'),
(26, 'nthabisengmolefe@gmail.com', '19', '2026-05-11 14:15:00', 'Cancelled'),
(27, 'kgothatsomakhubela@gmail.com', '20', '2026-05-12 16:45:00', 'Pending'),
(28, 'palesamokoena@gmail.com', '21', '2026-05-13 10:00:00', ''),
(39, 'karabomohale@gmail.com', '1', '2026-05-01 10:00:00', 'Pending'),
(40, 'giftmapimele77@gmail.com', '2', '2026-05-01 11:00:00', 'Approved'),
(41, 'thabomokoena@gmail.com', '3', '2026-05-02 09:30:00', 'Shipped'),
(42, 'ayandadlamini@gmail.com', '4', '2026-05-02 14:15:00', 'Cancelled'),
(43, 'leratokhumalo@gmail.com', '5', '2026-05-03 16:45:00', 'Pending'),
(44, 'siphonkosi@gmail.com', '6', '2026-05-04 10:00:00', 'Pending'),
(45, 'nomsazulu@gmail.com', '7', '2026-05-04 11:00:00', 'Approved'),
(46, 'mphosebola@gmail.com', '8', '2026-05-05 09:30:00', 'Shipped'),
(47, 'preciousndlovu@gmail.com', '9', '2026-05-05 14:15:00', 'Cancelled'),
(48, 'sanelemthembu@gmail.com', '10', '2026-05-06 16:45:00', 'Pending'),
(49, 'admin1@example.com', '11', '2026-05-07 10:00:00', 'Approved'),
(50, 'admin2@example.com', '12', '2026-05-07 11:00:00', 'Shipped'),
(51, 'admin3@example.com', '13', '2026-05-08 09:30:00', 'Cancelled'),
(52, 'admin4@example.com', '14', '2026-05-08 14:15:00', 'Pending'),
(53, 'admin5@example.com', '15', '2026-05-09 16:45:00', 'Approved'),
(54, 'tshepomaluleke@gmail.com', '16', '2026-05-10 10:00:00', 'Pending'),
(55, 'kabelophiri@gmail.com', '17', '2026-05-10 11:00:00', 'Approved'),
(56, 'boitumeloradebe@gmail.com', '18', '2026-05-11 09:30:00', 'Shipped'),
(57, 'nthabisengmolefe@gmail.com', '19', '2026-05-11 14:15:00', 'Cancelled'),
(58, 'kgothatsomakhubela@gmail.com', '20', '2026-05-12 16:45:00', 'Pending'),
(59, 'palesamokoena@gmail.com', '21', '2026-05-13 10:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblclothes`
--

CREATE TABLE `tblclothes` (
  `product_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblclothes`
--

INSERT INTO `tblclothes` (`product_id`, `name`, `description`, `price`, `image`) VALUES
(1, 'T-Shirt', 'Cotton round neck', 199.99, 'tshirt.jpg\r'),
(2, 'Jeans', 'Blue denim slim fit', 499.99, 'jeans.jpg\r'),
(3, 'Sneakers', 'White casual shoes', 799.99, 'sneakers.jpg\r'),
(4, 'Jacket', 'Leather biker jacket', 1299.99, 'jacket.jpg\r'),
(5, 'Cap', 'Black baseball cap', 149.99, 'cap.jpg\r'),
(8, 'T-Shirt', 'Cotton round neck', 199.99, 'tshirt.jpg'),
(9, 'Jeans', 'Blue denim slim fit', 499.99, 'jeans.jpg'),
(10, 'Sneakers', 'White casual shoes', 799.99, 'sneakers.jpg'),
(11, 'Jacket', 'Leather biker jacket', 1299.99, 'jacket.jpg'),
(12, 'Cap', 'Black baseball cap', 149.99, 'cap.jpg'),
(13, 'Dress', 'Red evening dress', 899.99, 'dress.jpg'),
(14, 'Skirt', 'Black pencil skirt', 399.99, 'skirt.jpg'),
(15, 'Blouse', 'White silk blouse', 349.99, 'blouse.jpg'),
(16, 'Shorts', 'Denim shorts', 299.99, 'shorts.jpg'),
(17, 'Sandals', 'Brown leather sandals', 499.99, 'sandals.jpg'),
(18, 'Boots', 'Winter boots', 999.99, 'boots.jpg'),
(19, 'Scarf', 'Wool scarf', 199.99, 'scarf.jpg'),
(20, 'Gloves', 'Leather gloves', 249.99, 'gloves.jpg'),
(21, 'Socks', 'Cotton socks', 99.99, 'socks.jpg'),
(22, 'Sweater', 'Wool sweater', 599.99, 'sweater.jpg'),
(23, 'Tracksuit', 'Sports tracksuit', 699.99, 'tracksuit.jpg'),
(24, 'Hat', 'Sun hat', 149.99, 'hat.jpg'),
(25, 'Belt', 'Leather belt', 199.99, 'belt.jpg'),
(26, 'Coat', 'Winter coat', 1499.99, 'coat.jpg'),
(27, 'Tie', 'Silk tie', 249.99, 'tie.jpg'),
(28, 'Suit', 'Formal suit', 2499.99, 'suit.jpg'),
(29, 'Tank Top', 'Sleeveless cotton top', 149.99, 'tanktop.jpg'),
(30, 'Leggings', 'Black leggings', 299.99, 'leggings.jpg'),
(31, 'Hoodie', 'Graphic hoodie', 499.99, 'hoodie.jpg'),
(32, 'Cardigan', 'Knitted cardigan', 399.99, 'cardigan.jpg'),
(33, 'Overalls', 'Denim overalls', 599.99, 'overalls.jpg'),
(34, 'Pajamas', 'Cotton pajamas', 349.99, 'pajamas.jpg'),
(35, 'Swimsuit', 'One-piece swimsuit', 449.99, 'swimsuit.jpg'),
(36, 'Blazer', 'Formal blazer', 899.99, 'blazer.jpg'),
(37, 'Tracksuit Pants', 'Sports pants', 399.99, 'trackpants.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblmessage`
--

CREATE TABLE `tblmessage` (
  `message_id` int(11) NOT NULL,
  `sender_email` varchar(100) NOT NULL,
  `receiver_email` varchar(100) NOT NULL,
  `message_text` text NOT NULL,
  `sent_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblmessage`
--

INSERT INTO `tblmessage` (`message_id`, `sender_email`, `receiver_email`, `message_text`, `sent_at`) VALUES
(1, 'karabomohale@gmail.com', 'giftmapimele77@gmail.com', 'Hi Gift!', '2026-05-01 09:00:00'),
(2, 'giftmapimele77@gmail.com', 'karabomohale@gmail.com', 'Hello Karabo!', '2026-05-01 09:05:00'),
(3, 'thabomokoena@gmail.com', 'ayandadlamini@gmail.com', 'Hey Ayanda', '0000-00-00 00:00:00'),
(4, 'ayandadlamini@gmail.com', 'thabomokoena@gmail.com', 'I’m good', '0000-00-00 00:00:00'),
(5, 'leratokhumalo@gmail.com', 'karabomohale@gmail.com', 'Please verify your account.', '2026-05-03 08:00:00'),
(8, 'karabomohale@gmail.com', 'giftmapimele77@gmail.com', 'Hi Gift!', '2026-05-01 09:00:00'),
(9, 'giftmapimele77@gmail.com', 'karabomohale@gmail.com', 'Hello Karabo!', '2026-05-01 09:05:00'),
(10, 'thabomokoena@gmail.com', 'ayandadlamini@gmail.com', 'Hey Ayanda', '0000-00-00 00:00:00'),
(11, 'ayandadlamini@gmail.com', 'thabomokoena@gmail.com', 'I’m good', '0000-00-00 00:00:00'),
(12, 'leratokhumalo@gmail.com', 'karabomohale@gmail.com', 'Please verify your account.', '2026-05-03 08:00:00'),
(13, 'siphonkosi@gmail.com', 'nomsazulu@gmail.com', 'Are you joining the meeting?', '2026-05-03 09:00:00'),
(14, 'nomsazulu@gmail.com', 'siphonkosi@gmail.com', 'Yes', '0000-00-00 00:00:00'),
(15, 'mphosebola@gmail.com', 'preciousndlovu@gmail.com', 'Can you send me the report?', '2026-05-04 10:00:00'),
(16, 'preciousndlovu@gmail.com', 'mphosebola@gmail.com', 'Report attached.', '2026-05-04 10:15:00'),
(17, 'sanelemthembu@gmail.com', 'admin1@example.com', 'Need help with login.', '2026-05-04 11:00:00'),
(18, 'admin1@example.com', 'sanelemthembu@gmail.com', 'Password reset link sent.', '2026-05-04 11:10:00'),
(23, 'tshepomaluleke@gmail.com', 'kabelophiri@gmail.com', 'Let’s meet tomorrow.', '2026-05-06 14:00:00'),
(24, 'kabelophiri@gmail.com', 'tshepomaluleke@gmail.com', 'Sure', '0000-00-00 00:00:00'),
(25, 'boitumeloradebe@gmail.com', 'nthabisengmolefe@gmail.com', 'Happy Birthday!', '2026-05-07 08:00:00'),
(26, 'nthabisengmolefe@gmail.com', 'boitumeloradebe@gmail.com', 'Thank you!', '2026-05-07 08:05:00'),
(27, 'kgothatsomakhubela@gmail.com', 'palesamokoena@gmail.com', 'Did you finish the task?', '2026-05-07 15:00:00'),
(28, 'palesamokoena@gmail.com', 'kgothatsomakhubela@gmail.com', 'Yes', '0000-00-00 00:00:00'),
(29, 'tumiramaphosa@gmail.com', 'neobaloyi@gmail.com', 'Can you check the invoice?', '2026-05-08 09:00:00'),
(30, 'neobaloyi@gmail.com', 'tumiramaphosa@gmail.com', 'Invoice looks fine.', '2026-05-08 09:15:00'),
(31, 'keamolefe@gmail.com', 'lebogangshongwe@gmail.com', 'Meeting postponed.', '2026-05-08 10:00:00'),
(32, 'lebogangshongwe@gmail.com', 'keamolefe@gmail.com', 'Thanks for the update.', '2026-05-08 10:10:00'),
(33, 'rethabiledube@gmail.com', 'onkarabilesithole@gmail.com', 'Can you join the call?', '2026-05-09 11:00:00'),
(34, 'onkarabilesithole@gmail.com', 'rethabiledube@gmail.com', 'Joining now.', '2026-05-09 11:05:00'),
(35, 'kgomotsomaseko@gmail.com', 'nokuthulambatha@gmail.com', 'Project deadline extended.', '2026-05-09 12:00:00'),
(36, 'nokuthulambatha@gmail.com', 'kgomotsomaseko@gmail.com', 'That’s great news!', '2026-05-09 12:15:00'),
(37, 'zanelekhosa@gmail.com', 'giftmapimele77@gmail.com', 'Welcome to the team!', '2026-05-10 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`user_id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Karabo Mohale   karabomohale@gmail.com   9a617edefe5107095fa659a3effc29d9\r', '', '', ''),
(6, 'Karabo Mohale', 'karabomohale@gmail.com', '9a617edefe5107095fa659a3effc29d9', 'user'),
(7, 'Gift Mapimele', 'giftmapimele77@gmail.com', '84e3db8594f3385c9877fe7f5b7ccaef', 'user'),
(8, 'Thabo Mokoena', 'thabomokoena@gmail.com', 'cb34fe3d8b726a138035a6c652c43d32', 'user'),
(9, 'Ayanda Dlamini', 'ayandadlamini@gmail.com', 'eea709ac8d78dded77964048061e8bc8', 'user'),
(10, 'Lerato Khumalo', 'leratokhumalo@gmail.com', 'c66b938eac14c63536324c40aee29996', 'user'),
(11, 'Sipho Nkosi', 'siphonkosi@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(12, 'Nomsa Zulu', 'nomsazulu@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(13, 'Mpho Sebola', 'mphosebola@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(14, 'Precious Ndlovu', 'preciousndlovu@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(15, 'Sanele Mthembu', 'sanelemthembu@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(16, 'Admin One', 'admin1@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin'),
(17, 'Admin Two', 'admin2@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin'),
(18, 'Admin Three', 'admin3@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin'),
(19, 'Admin Four', 'admin4@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin'),
(20, 'Admin Five', 'admin5@example.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin'),
(21, 'Tshepo Maluleke', 'tshepomaluleke@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(22, 'Kabelo Phiri', 'kabelophiri@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(23, 'Boitumelo Radebe', 'boitumeloradebe@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(24, 'Nthabiseng Molefe', 'nthabisengmolefe@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(25, 'Kgothatso Makhubela', 'kgothatsomakhubela@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(26, 'Palesa Mokoena', 'palesamokoena@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(27, 'Tumi Ramaphosa', 'tumiramaphosa@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(28, 'Neo Baloyi', 'neobaloyi@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(29, 'Kea Molefe', 'keamolefe@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(30, 'Lebogang Shongwe', 'lebogangshongwe@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(31, 'Rethabile Dube', 'rethabiledube@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(32, 'Onkarabile Sithole', 'onkarabilesithole@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(33, 'Kgomotso Maseko', 'kgomotsomaseko@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(34, 'Nokuthula Mbatha', 'nokuthulambatha@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user'),
(35, 'Zanele Khosa', 'zanelekhosa@gmail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tblaorder`
--
ALTER TABLE `tblaorder`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tblclothes`
--
ALTER TABLE `tblclothes`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `tblmessage`
--
ALTER TABLE `tblmessage`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblaorder`
--
ALTER TABLE `tblaorder`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `tblclothes`
--
ALTER TABLE `tblclothes`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tblmessage`
--
ALTER TABLE `tblmessage`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
