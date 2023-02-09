-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2022 at 04:38 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_barangay`
--

-- --------------------------------------------------------

--
-- Table structure for table `form_type`
--

CREATE TABLE `form_type` (
  `req_id` int(11) NOT NULL,
  `request_type` varchar(50) DEFAULT NULL,
  `fee` decimal(20,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `form_type`
--

INSERT INTO `form_type` (`req_id`, `request_type`, `fee`) VALUES
(1, 'Residency', '50.000000'),
(2, 'Indigency', '10.000000'),
(3, 'Death Certificate', '100.000000'),
(4, 'Birth Certificate', '200.000000'),
(5, 'Barangay Clearance', '10.000000');

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `pay_id` int(11) NOT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `shipping_fee` double DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`pay_id`, `payment_type`, `shipping_fee`, `description`) VALUES
(1, 'COD', 40, 'Cash on Delivery'),
(2, 'GCASH', NULL, 'E-payment');

-- --------------------------------------------------------

--
-- Table structure for table `receipt_transaction`
--

CREATE TABLE `receipt_transaction` (
  `recep_id` int(11) NOT NULL,
  `req_form_information_id` int(11) DEFAULT NULL,
  `req_id` int(11) DEFAULT NULL,
  `req_form_type_id` int(11) DEFAULT NULL,
  `pay_id` int(11) DEFAULT NULL,
  `or_no` varchar(50) DEFAULT NULL,
  `contact_no` varchar(50) DEFAULT NULL,
  `total_amount` decimal(20,6) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipt_transaction`
--

INSERT INTO `receipt_transaction` (`recep_id`, `req_form_information_id`, `req_id`, `req_form_type_id`, `pay_id`, `or_no`, `contact_no`, `total_amount`, `delivery_address`, `status`, `created_at`, `updated_at`) VALUES
(30, 33, 1, 35, 1, NULL, '123123123', '100.000000', 'Philippines', 2, '2022-09-13 05:14:44', '2022-09-13 05:14:46'),
(31, 34, 3, 36, 1, NULL, 'awdawd', '150.000000', 'Philippines', 2, '2022-09-13 06:43:36', '2022-09-13 06:43:38'),
(32, 35, 5, 37, 1, NULL, '09361776112', '60.000000', 'Tipanoy Iligan City', 2, '2022-09-13 08:23:35', '2022-09-13 08:23:36');

-- --------------------------------------------------------

--
-- Table structure for table `request_form_information`
--

CREATE TABLE `request_form_information` (
  `req_form_information_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_form_information`
--

INSERT INTO `request_form_information` (`req_form_information_id`, `user_id`, `first_name`, `last_name`, `middle_name`, `birthdate`, `address`, `created_at`, `updated_at`) VALUES
(33, 2, 'Juan', 'Tamad', 'P', '2000-08-28', 'Bernales Street', '2022-09-13 05:14:44', '2022-09-13 05:14:44'),
(34, 2, 'Pedro', 'Pendoko', 'M', '2000-02-28', 'Tipanoy Iligan City', '2022-09-13 06:43:36', '2022-09-13 06:43:36'),
(35, 2, 'Ken', 'Hanz', 'L', '2220-02-22', 'Bernales Street', '2022-09-13 08:23:35', '2022-09-13 08:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `request_form_type`
--

CREATE TABLE `request_form_type` (
  `req_form_type_id` int(11) NOT NULL,
  `req_form_information_id` int(11) DEFAULT NULL,
  `req_id` int(11) DEFAULT 0,
  `purpose` varchar(50) DEFAULT NULL,
  `terms_of_living` varchar(50) DEFAULT NULL,
  `cedula_number` varchar(100) NOT NULL,
  `date_deceased` date DEFAULT NULL,
  `place_of_death` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_form_type`
--

INSERT INTO `request_form_type` (`req_form_type_id`, `req_form_information_id`, `req_id`, `purpose`, `terms_of_living`, `cedula_number`, `date_deceased`, `place_of_death`, `father_name`, `mother_name`, `created_at`, `updated_at`) VALUES
(35, 33, 1, 'awdawdawd', '2', '', NULL, '', '', '', '2022-09-13 05:14:44', '2022-09-13 05:14:44'),
(36, 34, 3, 'None', '', '', '0000-00-00', 'Baraaas', '', '', '2022-09-13 06:43:36', '2022-09-13 06:43:36'),
(37, 35, 5, 'For kids', '', '123', NULL, '', '', '', '2022-09-13 08:23:35', '2022-09-13 08:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `status_type`
--

CREATE TABLE `status_type` (
  `id` int(11) NOT NULL,
  `status_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status_type`
--

INSERT INTO `status_type` (`id`, `status_type`) VALUES
(1, 'waiting_confimation'),
(2, 'confirmed_by_resident'),
(3, 'pending_request'),
(4, 'approved'),
(5, 'disapproved'),
(6, 'processing'),
(7, 'ready to get'),
(8, 'cancel');

-- --------------------------------------------------------

--
-- Table structure for table `tblactivity`
--

CREATE TABLE `tblactivity` (
  `id` int(11) NOT NULL,
  `dateofactivity` date NOT NULL,
  `activity` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblactivity`
--

INSERT INTO `tblactivity` (`id`, `dateofactivity`, `activity`, `description`) VALUES
(1, '2022-09-09', 'dsadasdas', 'adasdasdas');

-- --------------------------------------------------------

--
-- Table structure for table `tblactivityphoto`
--

CREATE TABLE `tblactivityphoto` (
  `id` int(11) NOT NULL,
  `activityid` int(11) NOT NULL,
  `filename` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblactivityphoto`
--

INSERT INTO `tblactivityphoto` (`id`, `activityid`, `filename`) VALUES
(1, 1, '1662435755708coke.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblblotter`
--

CREATE TABLE `tblblotter` (
  `id` int(11) NOT NULL,
  `yearRecorded` varchar(4) NOT NULL,
  `dateRecorded` date NOT NULL,
  `complainant` text NOT NULL,
  `cage` int(11) NOT NULL,
  `caddress` text NOT NULL,
  `ccontact` int(11) NOT NULL,
  `personToComplain` text NOT NULL,
  `page` int(11) NOT NULL,
  `paddress` text NOT NULL,
  `pcontact` int(11) NOT NULL,
  `complaint` text NOT NULL,
  `actionTaken` varchar(50) NOT NULL,
  `sStatus` varchar(50) NOT NULL,
  `locationOfIncidence` text NOT NULL,
  `recordedby` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblclearance`
--

CREATE TABLE `tblclearance` (
  `id` int(11) NOT NULL,
  `clearanceNo` int(11) NOT NULL,
  `residentid` int(11) NOT NULL,
  `findings` text NOT NULL,
  `purpose` text NOT NULL,
  `orNo` int(11) NOT NULL,
  `samount` int(11) NOT NULL,
  `dateRecorded` date NOT NULL,
  `recordedBy` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblclearance`
--

INSERT INTO `tblclearance` (`id`, `clearanceNo`, `residentid`, `findings`, `purpose`, `orNo`, `samount`, `dateRecorded`, `recordedBy`, `status`) VALUES
(3, 2311, 2, 'ffdfd', 'example', 12312, 250, '2022-09-06', 'Fernando', 'Approved'),
(4, 0, 2, '', 'example', 0, 0, '2022-09-08', 'Fernando', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tblhousehold`
--

CREATE TABLE `tblhousehold` (
  `id` int(11) NOT NULL,
  `householdno` int(11) NOT NULL,
  `zone` varchar(11) NOT NULL,
  `totalhouseholdmembers` int(2) NOT NULL,
  `headoffamily` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbllogs`
--

CREATE TABLE `tbllogs` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `logdate` datetime NOT NULL,
  `action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbllogs`
--

INSERT INTO `tbllogs` (`id`, `user`, `logdate`, `action`) VALUES
(1, 'Administrator', '2021-10-21 16:27:24', 'Added Resident named Suares, Jude Reyes'),
(2, 'Administrator', '2021-10-22 12:16:56', 'Update Resident named Suares, Jude Reyes'),
(3, 'Administrator', '2022-09-06 06:24:24', 'Added Resident named Torres, Fernando L'),
(4, 'Administrator', '2022-09-06 11:42:35', 'Added Activity dsadasdas');

-- --------------------------------------------------------

--
-- Table structure for table `tblofficial`
--

CREATE TABLE `tblofficial` (
  `id` int(11) NOT NULL,
  `sPosition` varchar(50) NOT NULL,
  `completeName` text NOT NULL,
  `pcontact` varchar(20) NOT NULL,
  `paddress` text NOT NULL,
  `termStart` date NOT NULL,
  `termEnd` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblofficial`
--

INSERT INTO `tblofficial` (`id`, `sPosition`, `completeName`, `pcontact`, `paddress`, `termStart`, `termEnd`, `status`) VALUES
(4, 'Captain', 'Reymar Medes', '091234567890', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
(5, 'Kagawad(Ordinance)', 'Benjie Miranda', '09234567894', 'Brgy. Tan-awan. Kabankalan City', '2018-05-21', '2022-05-23', 'Ongoing Term'),
(6, 'Kagawad(Public Safety)', 'Rhodora Molina', '09452316722', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
(7, 'Kagawad(Tourism)', 'Ronilo Boyayot', '09456732456', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
(8, 'Kagawad(Budget & Finance)', 'Dondon Laurico', '09337869045', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
(9, 'Kagawad(Agriculture)', 'Joseph Soligan', '09227865784', 'Brgy.Tan-awan, Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
(10, 'Kagawad(Education)', 'Idol Anono', '094567892341', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-23', 'Ongoing Term'),
(11, 'Kagawad(Infrastracture)', 'Rolly Torres', '09386784563', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term');

-- --------------------------------------------------------

--
-- Table structure for table `tblpermit`
--

CREATE TABLE `tblpermit` (
  `id` int(11) NOT NULL,
  `residentid` int(11) NOT NULL,
  `businessName` text NOT NULL,
  `businessAddress` text NOT NULL,
  `typeOfBusiness` varchar(50) NOT NULL,
  `orNo` int(11) NOT NULL,
  `samount` int(11) NOT NULL,
  `dateRecorded` date NOT NULL,
  `recordedBy` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpermit`
--

INSERT INTO `tblpermit` (`id`, `residentid`, `businessName`, `businessAddress`, `typeOfBusiness`, `orNo`, `samount`, `dateRecorded`, `recordedBy`, `status`) VALUES
(1, 2, 'Juan Company', 'Prk1', 'Merchandising', 0, 0, '2022-09-13', 'fj', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tblresident`
--

CREATE TABLE `tblresident` (
  `id` int(11) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `bdate` varchar(20) NOT NULL,
  `bplace` text NOT NULL,
  `age` int(11) NOT NULL,
  `barangay` varchar(120) NOT NULL,
  `zone` varchar(5) NOT NULL,
  `totalhousehold` int(5) NOT NULL,
  `differentlyabledperson` varchar(100) NOT NULL,
  `relationtohead` varchar(50) NOT NULL,
  `maritalstatus` varchar(50) NOT NULL,
  `bloodtype` varchar(10) NOT NULL,
  `civilstatus` varchar(20) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `monthlyincome` int(12) NOT NULL,
  `householdnum` int(11) NOT NULL,
  `lengthofstay` int(11) NOT NULL,
  `religion` varchar(50) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `skills` text NOT NULL,
  `igpitID` int(11) NOT NULL,
  `philhealthNo` int(12) NOT NULL,
  `highestEducationalAttainment` varchar(50) NOT NULL,
  `houseOwnershipStatus` varchar(50) NOT NULL,
  `landOwnershipStatus` varchar(20) NOT NULL,
  `dwellingtype` varchar(20) NOT NULL,
  `waterUsage` varchar(20) NOT NULL,
  `lightningFacilities` varchar(20) NOT NULL,
  `sanitaryToilet` varchar(20) NOT NULL,
  `formerAddress` text NOT NULL,
  `remarks` text NOT NULL,
  `image` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblresident`
--

INSERT INTO `tblresident` (`id`, `lname`, `fname`, `mname`, `bdate`, `bplace`, `age`, `barangay`, `zone`, `totalhousehold`, `differentlyabledperson`, `relationtohead`, `maritalstatus`, `bloodtype`, `civilstatus`, `occupation`, `monthlyincome`, `householdnum`, `lengthofstay`, `religion`, `nationality`, `gender`, `skills`, `igpitID`, `philhealthNo`, `highestEducationalAttainment`, `houseOwnershipStatus`, `landOwnershipStatus`, `dwellingtype`, `waterUsage`, `lightningFacilities`, `sanitaryToilet`, `formerAddress`, `remarks`, `image`, `username`, `password`) VALUES
(1, 'Suares', 'Jude', 'Reyes', '2021-10-12', 'Brgy. Mambato, Himamaylan City', 0, 'Brgy.Tan-awan', '1', 10, 'yes', 'Brother', 'single', '0+', 'Single', 'Programmer', 300000, 1, 5, 'Catholic', 'Filipino', 'Male', 'Programming', 1122, 2147483647, 'Doctorate degree', 'Live with Parents/Relatives', 'Care Taker', '2nd Option', 'Deep Well', '2147483647', 'Water-sealed', 'brgy. enlcaro', 'None', '1634804844819_[Complete] Laravel Ecommerce Project with Source Code.png', 'jude', 'jude123'),
(2, 'Tamd', 'Juan', 'L', '2022-09-14', 'dsa', 0, 'dsa', '21321', 1, 'dasds', 'dsadss', 'asd', 'asdas', 'adas', 'dsad', 123, 2323, 44, 'dasd', 'asdsa', 'Male', 'ads', 213, 4534543, 'Doctorate degree', 'Own Home', 'Owned', '1st Option', 'Faucet', 'Lamp', 'Antipolo', 'dsad', 'dasdaas', '1662416664725_das.jpg', 'resident', 'resident123');

-- --------------------------------------------------------

--
-- Table structure for table `tblstaff`
--

CREATE TABLE `tblstaff` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblstaff`
--

INSERT INTO `tblstaff` (`id`, `name`, `username`, `password`) VALUES
(1, 'Adones Evangelista', 'adones', 'adones123');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`id`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', 'administrator'),
(2, 'zone', 'zone', 'zoneleader');

-- --------------------------------------------------------

--
-- Table structure for table `tblzone`
--

CREATE TABLE `tblzone` (
  `id` int(5) NOT NULL,
  `zone` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblzone`
--

INSERT INTO `tblzone` (`id`, `zone`, `username`, `password`) VALUES
(0, '051820', 'zone_leader', 'zone_leader123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `form_type`
--
ALTER TABLE `form_type`
  ADD PRIMARY KEY (`req_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`pay_id`) USING BTREE;

--
-- Indexes for table `receipt_transaction`
--
ALTER TABLE `receipt_transaction`
  ADD PRIMARY KEY (`recep_id`);

--
-- Indexes for table `request_form_information`
--
ALTER TABLE `request_form_information`
  ADD PRIMARY KEY (`req_form_information_id`) USING BTREE;

--
-- Indexes for table `request_form_type`
--
ALTER TABLE `request_form_type`
  ADD PRIMARY KEY (`req_form_type_id`) USING BTREE;

--
-- Indexes for table `status_type`
--
ALTER TABLE `status_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblactivity`
--
ALTER TABLE `tblactivity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblactivityphoto`
--
ALTER TABLE `tblactivityphoto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblblotter`
--
ALTER TABLE `tblblotter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblclearance`
--
ALTER TABLE `tblclearance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblhousehold`
--
ALTER TABLE `tblhousehold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbllogs`
--
ALTER TABLE `tbllogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblofficial`
--
ALTER TABLE `tblofficial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpermit`
--
ALTER TABLE `tblpermit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblresident`
--
ALTER TABLE `tblresident`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblstaff`
--
ALTER TABLE `tblstaff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblzone`
--
ALTER TABLE `tblzone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `form_type`
--
ALTER TABLE `form_type`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receipt_transaction`
--
ALTER TABLE `receipt_transaction`
  MODIFY `recep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `request_form_information`
--
ALTER TABLE `request_form_information`
  MODIFY `req_form_information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `request_form_type`
--
ALTER TABLE `request_form_type`
  MODIFY `req_form_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `status_type`
--
ALTER TABLE `status_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblactivity`
--
ALTER TABLE `tblactivity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblactivityphoto`
--
ALTER TABLE `tblactivityphoto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblblotter`
--
ALTER TABLE `tblblotter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblclearance`
--
ALTER TABLE `tblclearance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblhousehold`
--
ALTER TABLE `tblhousehold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbllogs`
--
ALTER TABLE `tbllogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblofficial`
--
ALTER TABLE `tblofficial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblpermit`
--
ALTER TABLE `tblpermit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblresident`
--
ALTER TABLE `tblresident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblstaff`
--
ALTER TABLE `tblstaff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
