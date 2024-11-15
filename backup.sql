-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: OptimakeDB
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Apparatus`
--

DROP TABLE IF EXISTS `Apparatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Apparatus` (
  `apparatus_id` int(11) NOT NULL AUTO_INCREMENT,
  `apparatus_name` varchar(255) NOT NULL,
  PRIMARY KEY (`apparatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Apparatus`
--

LOCK TABLES `Apparatus` WRITE;
/*!40000 ALTER TABLE `Apparatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Apparatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campus`
--

DROP TABLE IF EXISTS `Campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campus` (
  `campus_id` int(11) NOT NULL AUTO_INCREMENT,
  `campus_name` varchar(255) NOT NULL,
  `university_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`campus_id`),
  KEY `university_id` (`university_id`),
  CONSTRAINT `Campus_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `University` (`university_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campus`
--

LOCK TABLES `Campus` WRITE;
/*!40000 ALTER TABLE `Campus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Campus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `College`
--

DROP TABLE IF EXISTS `College`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `College` (
  `college_id` int(11) NOT NULL AUTO_INCREMENT,
  `college_name` varchar(255) NOT NULL,
  `campus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`college_id`),
  KEY `campus_id` (`campus_id`),
  CONSTRAINT `College_ibfk_1` FOREIGN KEY (`campus_id`) REFERENCES `Campus` (`campus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `College`
--

LOCK TABLES `College` WRITE;
/*!40000 ALTER TABLE `College` DISABLE KEYS */;
/*!40000 ALTER TABLE `College` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `course_code` varchar(50) NOT NULL,
  `classification_id` int(11) DEFAULT NULL,
  `units` int(11) NOT NULL,
  `number_of_sections` int(11) NOT NULL,
  `lab_hours_per_week` int(11) DEFAULT NULL,
  `lecture_hours_per_week` int(11) DEFAULT NULL,
  `apparatus_id` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `classification_id` (`classification_id`),
  KEY `apparatus_id` (`apparatus_id`),
  KEY `university_id` (`university_id`),
  KEY `campus_id` (`campus_id`),
  KEY `college_id` (`college_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`classification_id`) REFERENCES `CourseClassification` (`classification_id`),
  CONSTRAINT `Course_ibfk_2` FOREIGN KEY (`apparatus_id`) REFERENCES `Apparatus` (`apparatus_id`),
  CONSTRAINT `Course_ibfk_3` FOREIGN KEY (`university_id`) REFERENCES `University` (`university_id`),
  CONSTRAINT `Course_ibfk_4` FOREIGN KEY (`campus_id`) REFERENCES `Campus` (`campus_id`),
  CONSTRAINT `Course_ibfk_5` FOREIGN KEY (`college_id`) REFERENCES `College` (`college_id`),
  CONSTRAINT `Course_ibfk_6` FOREIGN KEY (`department_id`) REFERENCES `Department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseClassification`
--

DROP TABLE IF EXISTS `CourseClassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseClassification` (
  `classification_id` int(11) NOT NULL AUTO_INCREMENT,
  `classification_name` varchar(255) NOT NULL,
  PRIMARY KEY (`classification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseClassification`
--

LOCK TABLES `CourseClassification` WRITE;
/*!40000 ALTER TABLE `CourseClassification` DISABLE KEYS */;
/*!40000 ALTER TABLE `CourseClassification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmploymentType`
--

DROP TABLE IF EXISTS `EmploymentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmploymentType` (
  `employment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `employment_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`employment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmploymentType`
--

LOCK TABLES `EmploymentType` WRITE;
/*!40000 ALTER TABLE `EmploymentType` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmploymentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `classification_id` int(11) DEFAULT NULL,
  `employment_type_id` int(11) DEFAULT NULL,
  `available_time_slots` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`faculty_id`),
  KEY `classification_id` (`classification_id`),
  KEY `employment_type_id` (`employment_type_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`classification_id`) REFERENCES `FacultyClassification` (`classification_id`),
  CONSTRAINT `Faculty_ibfk_2` FOREIGN KEY (`employment_type_id`) REFERENCES `EmploymentType` (`employment_type_id`),
  CONSTRAINT `Faculty_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `Department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FacultyClassification`
--

DROP TABLE IF EXISTS `FacultyClassification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FacultyClassification` (
  `classification_id` int(11) NOT NULL AUTO_INCREMENT,
  `classification_name` varchar(255) NOT NULL,
  PRIMARY KEY (`classification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FacultyClassification`
--

LOCK TABLES `FacultyClassification` WRITE;
/*!40000 ALTER TABLE `FacultyClassification` DISABLE KEYS */;
/*!40000 ALTER TABLE `FacultyClassification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `apparatus_id` int(11) DEFAULT NULL,
  `university_id` int(11) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  KEY `apparatus_id` (`apparatus_id`),
  KEY `university_id` (`university_id`),
  KEY `campus_id` (`campus_id`),
  KEY `college_id` (`college_id`),
  CONSTRAINT `Room_ibfk_1` FOREIGN KEY (`apparatus_id`) REFERENCES `Apparatus` (`apparatus_id`),
  CONSTRAINT `Room_ibfk_2` FOREIGN KEY (`university_id`) REFERENCES `University` (`university_id`),
  CONSTRAINT `Room_ibfk_3` FOREIGN KEY (`campus_id`) REFERENCES `Campus` (`campus_id`),
  CONSTRAINT `Room_ibfk_4` FOREIGN KEY (`college_id`) REFERENCES `College` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sections`
--

DROP TABLE IF EXISTS `Sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sections` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) NOT NULL,
  `number_of_students` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `Sections_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `Department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sections`
--

LOCK TABLES `Sections` WRITE;
/*!40000 ALTER TABLE `Sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `year_level` int(11) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `department_id` (`department_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `Department` (`department_id`),
  CONSTRAINT `Student_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `Sections` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `University`
--

DROP TABLE IF EXISTS `University`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `University` (
  `university_id` int(11) NOT NULL AUTO_INCREMENT,
  `university_name` varchar(255) NOT NULL,
  PRIMARY KEY (`university_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `University`
--

LOCK TABLES `University` WRITE;
/*!40000 ALTER TABLE `University` DISABLE KEYS */;
/*!40000 ALTER TABLE `University` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-15  7:53:22
