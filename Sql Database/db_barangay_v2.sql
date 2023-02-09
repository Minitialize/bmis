-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_barangay
DROP DATABASE IF EXISTS `db_barangay`;
CREATE DATABASE IF NOT EXISTS `db_barangay` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_barangay`;

-- Dumping structure for table db_barangay.form_type
DROP TABLE IF EXISTS `form_type`;
CREATE TABLE IF NOT EXISTS `form_type` (
  `req_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_type` varchar(50) DEFAULT NULL,
  `fee` decimal(20,6) DEFAULT NULL,
  PRIMARY KEY (`req_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.form_type: ~5 rows (approximately)
DELETE FROM `form_type`;
/*!40000 ALTER TABLE `form_type` DISABLE KEYS */;
INSERT INTO `form_type` (`req_id`, `request_type`, `fee`) VALUES
	(1, 'Residency', 50.000000),
	(2, 'Indigency', 10.000000),
	(3, 'Death Certificate', 100.000000),
	(4, 'Birth Certificate', 200.000000),
	(5, 'Clearance', 10.000000);
/*!40000 ALTER TABLE `form_type` ENABLE KEYS */;

-- Dumping structure for table db_barangay.payment_method
DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(50) DEFAULT NULL,
  `shipping_fee` double DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pay_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.payment_method: ~3 rows (approximately)
DELETE FROM `payment_method`;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` (`pay_id`, `payment_type`, `shipping_fee`, `description`) VALUES
	(1, 'COD', 40, 'Cash on Delivery'),
	(2, 'GCASH', NULL, 'E-payment');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;

-- Dumping structure for table db_barangay.receipt_transaction
DROP TABLE IF EXISTS `receipt_transaction`;
CREATE TABLE IF NOT EXISTS `receipt_transaction` (
  `recep_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_form_information_id` int(11) DEFAULT NULL,
  `req_id` int(11) DEFAULT NULL,
  `req_form_type_id` int(11) DEFAULT NULL,
  `pay_id` int(11) DEFAULT NULL,
  `or_no` varchar(50) DEFAULT NULL,
  `contact_no` varchar(50) DEFAULT NULL,
  `total_amount` decimal(20,6) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`recep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.receipt_transaction: ~14 rows (approximately)
DELETE FROM `receipt_transaction`;
/*!40000 ALTER TABLE `receipt_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt_transaction` ENABLE KEYS */;

-- Dumping structure for table db_barangay.request_form_information
DROP TABLE IF EXISTS `request_form_information`;
CREATE TABLE IF NOT EXISTS `request_form_information` (
  `req_form_information_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`req_form_information_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.request_form_information: ~19 rows (approximately)
DELETE FROM `request_form_information`;
/*!40000 ALTER TABLE `request_form_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_form_information` ENABLE KEYS */;

-- Dumping structure for table db_barangay.request_form_type
DROP TABLE IF EXISTS `request_form_type`;
CREATE TABLE IF NOT EXISTS `request_form_type` (
  `req_form_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_form_information_id` int(11) DEFAULT NULL,
  `req_id` int(11) DEFAULT '0',
  `purpose` varchar(50) DEFAULT NULL,
  `terms_of_living` varchar(50) DEFAULT NULL,
  `date_deceased` date DEFAULT NULL,
  `place_of_death` varchar(255) DEFAULT NULL,
  `father_name` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`req_form_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.request_form_type: ~20 rows (approximately)
DELETE FROM `request_form_type`;
/*!40000 ALTER TABLE `request_form_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_form_type` ENABLE KEYS */;

-- Dumping structure for table db_barangay.status_type
DROP TABLE IF EXISTS `status_type`;
CREATE TABLE IF NOT EXISTS `status_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.status_type: ~8 rows (approximately)
DELETE FROM `status_type`;
/*!40000 ALTER TABLE `status_type` DISABLE KEYS */;
INSERT INTO `status_type` (`id`, `status_type`) VALUES
	(1, 'waiting_confimation'),
	(2, 'confirmed_by_resident'),
	(3, 'pending_request'),
	(4, 'approved'),
	(5, 'disapproved'),
	(6, 'processing'),
	(7, 'ready to get'),
	(8, 'cancel');
/*!40000 ALTER TABLE `status_type` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblactivity
DROP TABLE IF EXISTS `tblactivity`;
CREATE TABLE IF NOT EXISTS `tblactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateofactivity` date NOT NULL,
  `activity` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblactivity: ~0 rows (approximately)
DELETE FROM `tblactivity`;
/*!40000 ALTER TABLE `tblactivity` DISABLE KEYS */;
INSERT INTO `tblactivity` (`id`, `dateofactivity`, `activity`, `description`) VALUES
	(1, '2022-09-09', 'dsadasdas', 'adasdasdas');
/*!40000 ALTER TABLE `tblactivity` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblactivityphoto
DROP TABLE IF EXISTS `tblactivityphoto`;
CREATE TABLE IF NOT EXISTS `tblactivityphoto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activityid` int(11) NOT NULL,
  `filename` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblactivityphoto: ~0 rows (approximately)
DELETE FROM `tblactivityphoto`;
/*!40000 ALTER TABLE `tblactivityphoto` DISABLE KEYS */;
INSERT INTO `tblactivityphoto` (`id`, `activityid`, `filename`) VALUES
	(1, 1, '1662435755708coke.jpg');
/*!40000 ALTER TABLE `tblactivityphoto` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblblotter
DROP TABLE IF EXISTS `tblblotter`;
CREATE TABLE IF NOT EXISTS `tblblotter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `recordedby` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblblotter: ~0 rows (approximately)
DELETE FROM `tblblotter`;
/*!40000 ALTER TABLE `tblblotter` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblblotter` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblclearance
DROP TABLE IF EXISTS `tblclearance`;
CREATE TABLE IF NOT EXISTS `tblclearance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clearanceNo` int(11) NOT NULL,
  `residentid` int(11) NOT NULL,
  `findings` text NOT NULL,
  `purpose` text NOT NULL,
  `orNo` int(11) NOT NULL,
  `samount` int(11) NOT NULL,
  `dateRecorded` date NOT NULL,
  `recordedBy` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblclearance: ~2 rows (approximately)
DELETE FROM `tblclearance`;
/*!40000 ALTER TABLE `tblclearance` DISABLE KEYS */;
INSERT INTO `tblclearance` (`id`, `clearanceNo`, `residentid`, `findings`, `purpose`, `orNo`, `samount`, `dateRecorded`, `recordedBy`, `status`) VALUES
	(3, 2311, 2, 'ffdfd', 'example', 12312, 250, '2022-09-06', 'Fernando', 'Approved'),
	(4, 0, 2, '', 'example', 0, 0, '2022-09-08', 'Fernando', 'Approved');
/*!40000 ALTER TABLE `tblclearance` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblhousehold
DROP TABLE IF EXISTS `tblhousehold`;
CREATE TABLE IF NOT EXISTS `tblhousehold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `householdno` int(11) NOT NULL,
  `zone` varchar(11) NOT NULL,
  `totalhouseholdmembers` int(2) NOT NULL,
  `headoffamily` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblhousehold: ~0 rows (approximately)
DELETE FROM `tblhousehold`;
/*!40000 ALTER TABLE `tblhousehold` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblhousehold` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tbllogs
DROP TABLE IF EXISTS `tbllogs`;
CREATE TABLE IF NOT EXISTS `tbllogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `logdate` datetime NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tbllogs: ~4 rows (approximately)
DELETE FROM `tbllogs`;
/*!40000 ALTER TABLE `tbllogs` DISABLE KEYS */;
INSERT INTO `tbllogs` (`id`, `user`, `logdate`, `action`) VALUES
	(1, 'Administrator', '2021-10-21 16:27:24', 'Added Resident named Suares, Jude Reyes'),
	(2, 'Administrator', '2021-10-22 12:16:56', 'Update Resident named Suares, Jude Reyes'),
	(3, 'Administrator', '2022-09-06 06:24:24', 'Added Resident named Torres, Fernando L'),
	(4, 'Administrator', '2022-09-06 11:42:35', 'Added Activity dsadasdas');
/*!40000 ALTER TABLE `tbllogs` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblofficial
DROP TABLE IF EXISTS `tblofficial`;
CREATE TABLE IF NOT EXISTS `tblofficial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sPosition` varchar(50) NOT NULL,
  `completeName` text NOT NULL,
  `pcontact` varchar(20) NOT NULL,
  `paddress` text NOT NULL,
  `termStart` date NOT NULL,
  `termEnd` date NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblofficial: ~8 rows (approximately)
DELETE FROM `tblofficial`;
/*!40000 ALTER TABLE `tblofficial` DISABLE KEYS */;
INSERT INTO `tblofficial` (`id`, `sPosition`, `completeName`, `pcontact`, `paddress`, `termStart`, `termEnd`, `status`) VALUES
	(4, 'Captain', 'Reymar Medes', '091234567890', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
	(5, 'Kagawad(Ordinance)', 'Benjie Miranda', '09234567894', 'Brgy. Tan-awan. Kabankalan City', '2018-05-21', '2022-05-23', 'Ongoing Term'),
	(6, 'Kagawad(Public Safety)', 'Rhodora Molina', '09452316722', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
	(7, 'Kagawad(Tourism)', 'Ronilo Boyayot', '09456732456', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
	(8, 'Kagawad(Budget & Finance)', 'Dondon Laurico', '09337869045', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
	(9, 'Kagawad(Agriculture)', 'Joseph Soligan', '09227865784', 'Brgy.Tan-awan, Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term'),
	(10, 'Kagawad(Education)', 'Idol Anono', '094567892341', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-23', 'Ongoing Term'),
	(11, 'Kagawad(Infrastracture)', 'Rolly Torres', '09386784563', 'Brgy. Tan-awan. Kabankalan City', '2018-05-22', '2022-05-22', 'Ongoing Term');
/*!40000 ALTER TABLE `tblofficial` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblpermit
DROP TABLE IF EXISTS `tblpermit`;
CREATE TABLE IF NOT EXISTS `tblpermit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `residentid` int(11) NOT NULL,
  `businessName` text NOT NULL,
  `businessAddress` text NOT NULL,
  `typeOfBusiness` varchar(50) NOT NULL,
  `orNo` int(11) NOT NULL,
  `samount` int(11) NOT NULL,
  `dateRecorded` date NOT NULL,
  `recordedBy` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblpermit: ~0 rows (approximately)
DELETE FROM `tblpermit`;
/*!40000 ALTER TABLE `tblpermit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpermit` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblresident
DROP TABLE IF EXISTS `tblresident`;
CREATE TABLE IF NOT EXISTS `tblresident` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblresident: ~2 rows (approximately)
DELETE FROM `tblresident`;
/*!40000 ALTER TABLE `tblresident` DISABLE KEYS */;
INSERT INTO `tblresident` (`id`, `lname`, `fname`, `mname`, `bdate`, `bplace`, `age`, `barangay`, `zone`, `totalhousehold`, `differentlyabledperson`, `relationtohead`, `maritalstatus`, `bloodtype`, `civilstatus`, `occupation`, `monthlyincome`, `householdnum`, `lengthofstay`, `religion`, `nationality`, `gender`, `skills`, `igpitID`, `philhealthNo`, `highestEducationalAttainment`, `houseOwnershipStatus`, `landOwnershipStatus`, `dwellingtype`, `waterUsage`, `lightningFacilities`, `sanitaryToilet`, `formerAddress`, `remarks`, `image`, `username`, `password`) VALUES
	(1, 'Suares', 'Jude', 'Reyes', '2021-10-12', 'Brgy. Mambato, Himamaylan City', 0, 'Brgy.Tan-awan', '1', 10, 'yes', 'Brother', 'single', '0+', 'Single', 'Programmer', 300000, 1, 5, 'Catholic', 'Filipino', 'Male', 'Programming', 1122, 2147483647, 'Doctorate degree', 'Live with Parents/Relatives', 'Care Taker', '2nd Option', 'Deep Well', '2147483647', 'Water-sealed', 'brgy. enlcaro', 'None', '1634804844819_[Complete] Laravel Ecommerce Project with Source Code.png', 'jude', 'jude123'),
	(2, 'Torres', 'Fernando', 'L', '2022-09-14', 'dsa', 0, 'dsa', '21321', 1, 'dasds', 'dsadss', 'asd', 'asdas', 'adas', 'dsad', 123, 2323, 44, 'dasd', 'asdsa', 'Male', 'ads', 213, 4534543, 'Doctorate degree', 'Own Home', 'Owned', '1st Option', 'Faucet', 'Lamp', 'Antipolo', 'dsad', 'dasdaas', '1662416664725_das.jpg', 'fj', 'fj123');
/*!40000 ALTER TABLE `tblresident` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblstaff
DROP TABLE IF EXISTS `tblstaff`;
CREATE TABLE IF NOT EXISTS `tblstaff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblstaff: ~0 rows (approximately)
DELETE FROM `tblstaff`;
/*!40000 ALTER TABLE `tblstaff` DISABLE KEYS */;
INSERT INTO `tblstaff` (`id`, `name`, `username`, `password`) VALUES
	(1, 'Adones Evangelista', 'adones', 'adones123');
/*!40000 ALTER TABLE `tblstaff` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tbluser
DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE IF NOT EXISTS `tbluser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tbluser: ~2 rows (approximately)
DELETE FROM `tbluser`;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
INSERT INTO `tbluser` (`id`, `username`, `password`, `type`) VALUES
	(1, 'admin', 'admin', 'administrator'),
	(2, 'zone', 'zone', 'zoneleader');
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;

-- Dumping structure for table db_barangay.tblzone
DROP TABLE IF EXISTS `tblzone`;
CREATE TABLE IF NOT EXISTS `tblzone` (
  `id` int(5) NOT NULL,
  `zone` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_barangay.tblzone: ~1 rows (approximately)
DELETE FROM `tblzone`;
/*!40000 ALTER TABLE `tblzone` DISABLE KEYS */;
INSERT INTO `tblzone` (`id`, `zone`, `username`, `password`) VALUES
	(0, '051820', 'jude', 'jude');
/*!40000 ALTER TABLE `tblzone` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
