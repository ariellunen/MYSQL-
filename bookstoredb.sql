-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstoredb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `all_purchases`
--

DROP TABLE IF EXISTS `all_purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_purchases` (
  `PurchaseID` int NOT NULL AUTO_INCREMENT,
  `Book_ID` int DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `purchase_type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PurchaseID`),
  KEY `ID_book_idx` (`Book_ID`),
  CONSTRAINT `ID_book` FOREIGN KEY (`Book_ID`) REFERENCES `books` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_purchases`
--

LOCK TABLES `all_purchases` WRITE;
/*!40000 ALTER TABLE `all_purchases` DISABLE KEYS */;
INSERT INTO `all_purchases` VALUES (1,8,200,'2020-06-08','Shipping'),(2,8,100,'2020-03-20','Shipping'),(3,8,43,'2019-04-15','Shipping'),(4,8,72,'2020-01-12','Shipping'),(5,8,93,'2020-07-10','Shipping'),(6,8,150,'2019-11-25','Shipping'),(7,5,180,'2019-09-09','Shipping'),(8,5,170,'2020-03-30','Shipping'),(9,4,50,'2020-03-17','Shipping'),(10,6,138,'2020-07-29','Shipping'),(11,4,35,'2020-04-26','Shipping'),(12,1,90,'2020-04-30','Shipping'),(13,5,85,'2020-07-24','Shipping'),(14,6,10,'2020-02-10','frontal'),(15,4,12,'2020-02-10','frontal'),(16,9,13,'2020-04-10','frontal'),(17,6,12,'2020-05-10','frontal'),(18,3,10,'2020-06-10','frontal'),(19,8,8,'2007-04-05','frontal'),(20,4,8,'2010-06-08','frontal'),(21,6,12,'2020-05-10','frontal'),(22,3,10,'2020-06-10','frontal'),(23,8,8,'2007-04-05','frontal'),(24,4,8,'2010-06-08','frontal'),(25,8,12,'2020-07-15','frontal'),(26,3,20,'2020-07-15','frontal'),(27,2,11,'2020-05-13','frontal'),(28,2,11,'2020-07-15','frontal'),(29,2,17,'2020-07-15','frontal'),(30,2,15,'2020-07-30','frontal'),(31,16,15,'2020-07-30','frontal');
/*!40000 ALTER TABLE `all_purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `AuthorID` int NOT NULL,
  `Author_fname` varchar(50) DEFAULT NULL,
  `Author_lname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Ernest ','Hemingway'),(2,'Paulo','Coelho'),(3,'JK','Rowling'),(4,'George','R.R. Martin'),(5,'J.R.R','Tolkien'),(6,'Vladimir','Nabokov'),(7,'Leo','Tolstoy'),(8,'Harper ','Lee'),(9,'James','Joyce'),(10,'William','Shakespeare'),(11,'Lewis','Carroll'),(12,'Mark','Twain'),(13,'Leo','Tolstoy'),(14,'Herman','Melville'),(15,'yaron','peer');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_authors`
--

DROP TABLE IF EXISTS `book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_authors` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `bookauthors_aid_idx` (`author_id`),
  CONSTRAINT `bookauthors_aid` FOREIGN KEY (`author_id`) REFERENCES `authors` (`AuthorID`),
  CONSTRAINT `bookauthors_bid` FOREIGN KEY (`book_id`) REFERENCES `books` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_authors`
--

LOCK TABLES `book_authors` WRITE;
/*!40000 ALTER TABLE `book_authors` DISABLE KEYS */;
INSERT INTO `book_authors` VALUES (2,1),(3,1),(4,1),(9,1),(3,2),(4,2),(1,3),(2,3),(6,3),(10,3),(2,4),(5,4),(8,4),(13,4),(12,5),(11,7),(7,9),(14,12),(15,13),(16,14),(17,15);
/*!40000 ALTER TABLE `book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_details`
--

DROP TABLE IF EXISTS `book_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_details` (
  `book_edID` int NOT NULL AUTO_INCREMENT,
  `bookID` int NOT NULL,
  `edition` int NOT NULL,
  `pubID` int DEFAULT NULL,
  `Condition` varchar(45) DEFAULT NULL,
  `Sale_price` int DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `Publishing Year` varchar(45) DEFAULT NULL,
  `Language` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`book_edID`),
  KEY `fk2222` (`pubID`),
  KEY `fk4444` (`Weight`),
  KEY `fk1111_idx` (`bookID`),
  CONSTRAINT `fk2222` FOREIGN KEY (`pubID`) REFERENCES `publisher` (`idPublisher`),
  CONSTRAINT `fk3333` FOREIGN KEY (`bookID`) REFERENCES `books` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_details`
--

LOCK TABLES `book_details` WRITE;
/*!40000 ALTER TABLE `book_details` DISABLE KEYS */;
INSERT INTO `book_details` VALUES (1,1,2,4,'Medium',17,15,'2010','English'),(2,5,5,2,'Medium',12,20,'2012','French'),(3,4,2,1,'Medium',9,18,'2008','English'),(4,3,5,2,'New',11,12,'2016','English'),(6,6,2,4,'Medium',17,9,'2010','French'),(7,8,5,2,'Medium',12,13,'2012','French'),(8,9,2,1,'Shaky',9,16,'2008','English'),(9,16,3,3,'New',15,13,'2010','English'),(11,11,5,1,'Medium',7,17,'2015','Arabic'),(12,11,5,2,'Medium',9,18,'2017','English'),(13,17,1,4,'New',10,30,'2020','English');
/*!40000 ALTER TABLE `book_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BookID` int NOT NULL,
  `Title` varchar(50) NOT NULL,
  PRIMARY KEY (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Harry Potter And The Chamber of Secrets'),(2,'Harry Potter and the Prisoner of Azkaban'),(3,'The Alchemist'),(4,'Eleven Minutes'),(5,'Ulysses'),(6,'War And Peace'),(7,'Harry Potter and the Philosopher\'s Stone'),(8,'The Lord of the Rings. Part 1: The Fellowship of t'),(9,'Lolita'),(10,'The Old Man And The Sea'),(11,'Hamlet'),(12,'To Kill a Mockingbird'),(13,'Harry Potter And The Chamber of Secrets'),(14,'The Human Body'),(15,'Roki'),(16,'Pola and pol'),(17,'She said NO!');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Reg_date` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Books_Bought` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (101,'0543216495','Ran','1972-03-11','2020-06-08','Yirmeyahu12. Tel Aviv-Yafo','1'),(102,'0526321478','ben','1986-12-20','2020-08-03','golan 50, Tel-Aviv','2'),(111,'0503164978','John','2000-02-01','2019-01-10','Shlomo Ibn Gabirol 109,Tel Aviv-Yafo','3'),(222,'0542569873','Shay','1999-09-01','2020-05-05','Shenkin 24, Tel-Aviv','5'),(333,'0503126497','Yael','1998-08-02','2020-04-19','Montefiore 22 Tel Aviv-Yafo','4'),(444,'0523164579','Josh','1995-02-02','2020-07-15','keilat-riga 12, Tel-Aviv','0'),(555,'0531649787','Omer','2012-03-03','2020-07-27','Jabotinsky 22, Ramt-Gan','1'),(666,'0523469187','Bar','1998-02-12','2020-01-20','Eilat 48, Kiryat Malakhi','6'),(777,'0526498120','Yali','1998-07-18','2020-07-28','Dizengoff 288, Tel Aviv-Yafo','3'),(888,'0543612597','Or','1993-09-11','2019-05-06','Anna-frank 13, Ramat-Gan','2'),(999,'0523164978','Adi','1988-04-11','2017-08-09','512,New street, JW','5');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `OrderID` int NOT NULL,
  `CustomerID` int DEFAULT NULL,
  `BookID` int DEFAULT NULL,
  `Order_Status` varchar(45) NOT NULL,
  `order_date` date DEFAULT NULL,
  `Date_received` date NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `customorder-fk3` (`BookID`),
  CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `customorder-fk3` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,111,8,'Ordered','2020-03-09','2020-03-11'),(2,222,5,'Available','2020-02-09','2020-02-11'),(3,101,4,'Available','2020-06-11','2020-06-15'),(4,555,9,'Ordered','2020-07-02','2020-09-11'),(5,444,5,'Ordered','2020-06-29','2020-07-12'),(6,888,4,'Available','2020-07-01','2020-08-03'),(7,999,1,'Ordered','2020-07-15','2020-08-02'),(8,777,5,'Ordered','2020-07-15','2020-08-30'),(9,999,6,'Available','2020-07-15','2020-08-29'),(10,777,6,'Ordered','2020-07-15','2020-09-11'),(11,777,6,'Ordered','2020-07-15','2020-08-13'),(12,333,6,'Available','2020-07-15','2020-08-12'),(13,222,16,'Ordered','2020-03-11','2020-04-11'),(14,101,16,'Available','2020-07-30','2020-09-11'),(15,101,2,'Ordered','2020-07-30','2020-08-02'),(16,111,6,'Ordered','2020-07-30','2020-08-02'),(17,888,5,'Ordered','2020-07-30','2020-08-30'),(18,555,5,'Available','2020-07-30','2020-08-19'),(19,555,8,'Ordered','2020-07-30','2020-08-19'),(20,777,16,'ordered','2020-05-15','2020-06-20'),(21,102,17,'Ordered','2020-08-04','2020-08-24'),(22,102,16,'Ordered','2020-08-04','2020-08-24'),(23,102,4,'Ordered','2020-08-04','2020-08-24');
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_purchase`
--

DROP TABLE IF EXISTS `customer_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_purchase` (
  `PurchaseID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `Date_c` date DEFAULT NULL,
  `Book_ID` int DEFAULT NULL,
  `Bill` int DEFAULT NULL,
  `Sold_By` int DEFAULT NULL,
  PRIMARY KEY (`PurchaseID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `employess_fk2` (`Sold_By`),
  KEY `bookEd_idx` (`Book_ID`),
  CONSTRAINT `book_fk2` FOREIGN KEY (`Book_ID`) REFERENCES `books` (`BookID`),
  CONSTRAINT `customer_fk2` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `employess_fk2` FOREIGN KEY (`Sold_By`) REFERENCES `employees` (`EmpID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_purchase`
--

LOCK TABLES `customer_purchase` WRITE;
/*!40000 ALTER TABLE `customer_purchase` DISABLE KEYS */;
INSERT INTO `customer_purchase` VALUES (1,111,'2020-02-10',6,10,1),(2,101,'2020-02-10',4,12,1),(3,222,'2020-04-10',9,13,2),(4,222,'2020-05-10',6,12,5),(5,111,'2020-06-10',3,10,2),(6,222,'2007-04-05',8,8,8),(7,333,'2010-06-08',4,8,7),(8,777,'2020-05-10',6,12,5),(9,888,'2020-06-10',3,10,2),(10,999,'2007-04-05',8,8,2),(11,101,'2010-06-08',4,8,2),(12,101,'2020-07-15',8,12,11),(14,222,'2020-07-15',3,20,11),(15,111,'2020-05-13',2,11,9),(16,444,'2020-07-15',2,11,4),(17,555,'2020-07-15',2,17,3),(18,777,'2020-07-30',2,15,11),(19,777,'2020-07-30',16,15,2);
/*!40000 ALTER TABLE `customer_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_payments`
--

DROP TABLE IF EXISTS `date_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date_payments` (
  `PaymentID` int NOT NULL,
  `rent` varchar(10) DEFAULT NULL,
  `Salaries` varchar(30) DEFAULT NULL,
  `ElectricBills` varchar(20) DEFAULT NULL,
  `PhoneBills` varchar(20) DEFAULT NULL,
  `Arnona` varchar(45) DEFAULT NULL,
  `Water` varchar(45) DEFAULT NULL,
  `misc` varchar(45) DEFAULT NULL,
  `dateID` int NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `pay_idx` (`dateID`),
  CONSTRAINT `pay` FOREIGN KEY (`dateID`) REFERENCES `store_payments` (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_payments`
--

LOCK TABLES `date_payments` WRITE;
/*!40000 ALTER TABLE `date_payments` DISABLE KEYS */;
INSERT INTO `date_payments` VALUES (1,'456','951','753','698','654','5426','854',2),(2,'785','5236','357','951','123','222','951',3),(3,'569','418','875','482','695','554','753',4),(4,'847','521','951','657','854','896','65',5),(5,'516','452','745','30','785','565','25',6),(6,'203','458','658','205','412','523','203',7),(7,'365','412','258','951','365','201','542',8),(8,'951','5920','975','258','325','468','615',9),(9,'956','325','748','520','203','596','745',1),(10,'987','456','321','456','585','555','202',10),(11,'658','2470','158','302','654','254','752',11);
/*!40000 ALTER TABLE `date_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmpID` int NOT NULL,
  `EmpPhone` varchar(20) DEFAULT NULL,
  `Emp_name` varchar(45) DEFAULT NULL,
  `Emp_lname` varchar(45) DEFAULT NULL,
  `Join_Date` date DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'0546666321','Tal','Carni','2020-05-10','Balfour 12 Tel-Aviv'),(2,'0523020102','Moshe','Smuali','2020-05-10','Brenner 19 Tel-Aviv'),(3,'0542301236','Ira','Avital','2020-01-13','Rashi 17 Tel-Aviv'),(4,'0589632148','Alon','Yarkoni','2020-10-30','Golan 99 Tel-Aviv'),(5,'0523147891','Lee','Levy','2020-01-23','HaAvoda 1 Tel-Aviv'),(6,'0548032069','Amit','Klein','2020-12-25','HaMaccabi 12 Tel Aviv-Yafo'),(7,'0503201023','Sivan','Zioni','2020-01-13','Bet Yosef 13 Tel-Aviv'),(8,'0548088659','Yenon','Nakash','2020-08-13','Kehilat Sofia 6 Tel Aviv-Yafo'),(9,'0506691032','Dikla','Aldor','2020-10-18','Rashi 11 Tel-Aviv'),(10,'0506671235','Maya','Sofer','2020-09-17','Zrubavel 16 Tel-Aviv'),(11,'0508465321','Keren','Dayan','2020-08-16','Geula 15 Tel-Aviv');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `idPublisher` int NOT NULL AUTO_INCREMENT,
  `pub_name` varchar(45) DEFAULT 'The Publisher',
  PRIMARY KEY (`idPublisher`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Penguin Random House'),(2,'Hachette'),(3,'Macmillan'),(4,'HarperCollins'),(5,'Simon & Schuster');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `SalaryID` int NOT NULL,
  `EmpID` int NOT NULL,
  `Month` int DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `hoursWorked` int DEFAULT NULL,
  `perHour` int DEFAULT NULL,
  PRIMARY KEY (`SalaryID`),
  KEY `name_idx` (`EmpID`),
  CONSTRAINT `name` FOREIGN KEY (`EmpID`) REFERENCES `employees` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,1,9,2019,120,26),(2,1,6,2020,110,26),(3,3,7,2020,102,30),(4,1,10,2017,100,26),(5,2,12,2019,100,30),(6,4,9,2020,100,26),(7,9,8,2020,100,26),(8,1,4,2020,98,26),(9,7,5,2015,97,26),(10,2,3,2020,95,30),(11,5,10,2020,95,26),(12,8,10,2019,92,26),(13,11,2,2020,86,30),(14,10,1,2020,80,30),(15,6,12,2020,78,25);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_transaction`
--

DROP TABLE IF EXISTS `shipment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipment_transaction` (
  `TransactionID` int NOT NULL,
  `total_cost` float NOT NULL DEFAULT '0',
  `Payment_Method` varchar(20) DEFAULT NULL,
  `ShipmentID` int DEFAULT NULL,
  `Option_id` int DEFAULT NULL,
  `Transaction_Date` date DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `ShipmentID` (`ShipmentID`),
  KEY `shipmerntfk2_idx` (`Option_id`),
  CONSTRAINT `shipment_transaction_ibfk_1` FOREIGN KEY (`ShipmentID`) REFERENCES `shipments` (`ShipmentID`),
  CONSTRAINT `shipmerntfk2` FOREIGN KEY (`Option_id`) REFERENCES `shipmentoptions` (`OptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_transaction`
--

LOCK TABLES `shipment_transaction` WRITE;
/*!40000 ALTER TABLE `shipment_transaction` DISABLE KEYS */;
INSERT INTO `shipment_transaction` VALUES (1,200,'Visa',1,1,'2020-06-08'),(2,100,'Bit app',2,1,'2020-03-20'),(3,43,'Bank Transfer',3,2,'2019-04-15'),(4,72,'Bit app',4,1,'2020-01-12'),(5,93,'visa',10,2,'2020-07-10'),(6,150,'visa',12,2,'2019-11-25'),(7,180,'visa',9,1,'2019-09-09'),(8,170,'Bit app',5,2,'2020-03-30'),(9,50,'Bank Transfer',3,2,'2020-03-17'),(10,138,'Bank Transfer',11,1,'2020-07-29'),(11,35,'Bit app',2,2,'2020-04-26'),(12,90,'visa',1,2,'2020-04-30'),(13,85,'visa',8,1,'2020-07-24');
/*!40000 ALTER TABLE `shipment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipmentoptions`
--

DROP TABLE IF EXISTS `shipmentoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipmentoptions` (
  `OptionID` int NOT NULL,
  `shipping_type` varchar(30) DEFAULT NULL,
  `Cost` float NOT NULL,
  PRIMARY KEY (`OptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipmentoptions`
--

LOCK TABLES `shipmentoptions` WRITE;
/*!40000 ALTER TABLE `shipmentoptions` DISABLE KEYS */;
INSERT INTO `shipmentoptions` VALUES (1,'Israel Post',30),(2,'Express Shipment',35);
/*!40000 ALTER TABLE `shipmentoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipments` (
  `ShipmentID` int NOT NULL,
  `OrderID` int NOT NULL,
  `Shipment_Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ShipmentID`),
  KEY `shipfk2_idx` (`OrderID`),
  CONSTRAINT `shipfk3` FOREIGN KEY (`OrderID`) REFERENCES `customer_order` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (1,1,'Shipping'),(2,1,'Shipped'),(3,1,'Waiting'),(4,2,'Delivered'),(5,2,'Waiting'),(6,2,'Waiting'),(7,3,'Shipping'),(8,6,'Shipping'),(9,10,'Waiting'),(10,6,'Waiting'),(11,7,'Waiting'),(12,18,'Shipping'),(13,15,'Waiting'),(14,13,'Shipping');
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `stockID` int NOT NULL,
  `Arr_date` date DEFAULT NULL,
  `Inventory_location` varchar(45) DEFAULT 'Store',
  `BookEdition` int DEFAULT NULL,
  PRIMARY KEY (`stockID`),
  KEY `fk111` (`BookEdition`),
  CONSTRAINT `fk111` FOREIGN KEY (`BookEdition`) REFERENCES `book_details` (`book_edID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` VALUES (1,'2020-08-14','Store',2),(2,'2020-07-01','Warehouse',1),(3,'2020-06-29','Store',1),(4,'2020-01-25','Warehouse',3),(5,'2020-03-26','Store',3),(7,'2020-07-05','Warehouse',2),(8,'2020-05-30','Warehouse',1),(11,'2008-07-14','Warehouse',4),(14,'2020-07-14','Warehouse',7),(15,'2010-08-12','Store',11),(16,'2020-03-15','Store',13);
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_payments`
--

DROP TABLE IF EXISTS `store_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_payments` (
  `PaymentID` int NOT NULL,
  `Month` int DEFAULT NULL,
  `Year` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_payments`
--

LOCK TABLES `store_payments` WRITE;
/*!40000 ALTER TABLE `store_payments` DISABLE KEYS */;
INSERT INTO `store_payments` VALUES (1,9,2019),(2,6,2020),(3,7,2020),(4,10,2017),(5,12,2019),(6,9,2020),(7,8,2020),(8,4,2020),(9,5,2015),(10,3,2020),(11,10,2020);
/*!40000 ALTER TABLE `store_payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-05 21:02:14
