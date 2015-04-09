-- MySQL dump 10.13  Distrib 5.6.22, for Win32 (x86)
--
-- Host: localhost    Database: CometCareerPortal
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `username` varchar(13) NOT NULL,
  `password` varchar(14) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12991 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_job`
--

DROP TABLE IF EXISTS `company_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_job` (
  `comp_job` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comp_job`),
  KEY `company_job_fk1` (`company_id`),
  KEY `company_job_fk2` (`job_id`),
  CONSTRAINT `company_job_fk1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `company_job_fk2` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_job`
--

LOCK TABLES `company_job` WRITE;
/*!40000 ALTER TABLE `company_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` varchar(8) NOT NULL DEFAULT '',
  `course_section` int(11) NOT NULL DEFAULT '0',
  `course_title` varchar(255) DEFAULT NULL,
  `course_level` varchar(255) DEFAULT NULL,
  `creit_hrs` int(11) DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_id`,`course_section`),
  KEY `course_fk1` (`professor_id`),
  CONSTRAINT `course_fk1` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) DEFAULT NULL,
  `username` varchar(13) NOT NULL,
  `password` varchar(14) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_job`
--

DROP TABLE IF EXISTS `department_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_job` (
  `dept_job` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_job`),
  KEY `department_job_fk1` (`department_id`),
  KEY `department_job_fk2` (`job_id`),
  CONSTRAINT `department_job_fk1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`),
  CONSTRAINT `department_job_fk2` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_job`
--

LOCK TABLES `department_job` WRITE;
/*!40000 ALTER TABLE `department_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `department_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employment_details`
--

DROP TABLE IF EXISTS `employment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employment_details` (
  `employment_id` int(11) NOT NULL AUTO_INCREMENT,
  `employer` varchar(128) DEFAULT NULL,
  `years_of_exp` int(11) DEFAULT NULL,
  `company_designation` varchar(255) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`employment_id`),
  KEY `employment_details_fk1` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14734 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employment_details`
--

LOCK TABLES `employment_details` WRITE;
/*!40000 ALTER TABLE `employment_details` DISABLE KEYS */;
INSERT INTO `employment_details` VALUES (14730,'ACI Worldwide Inc.',2,'Associate Database Administrator',8377),(14731,'TrueSpider Technology',3,'UI Designer',14455),(14732,'The University of Texas at Dallas',5,'Ashbel Smith Professor-Computer Science',8379),(14733,'ACI Worldwide Inc.',4,'Principal Architect',8379);
/*!40000 ALTER TABLE `employment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `visa_category` varchar(10) DEFAULT NULL,
  `job_type` varchar(255) DEFAULT NULL,
  `joining_requirement` varchar(255) DEFAULT NULL,
  `pre_requsite` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7865 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `professor_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `professor_qualification` varchar(255) DEFAULT NULL,
  `research_interest` varchar(255) DEFAULT NULL,
  `contact_number` char(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `username` varchar(13) NOT NULL,
  `password` varchar(14) NOT NULL,
  PRIMARY KEY (`professor_id`),
  KEY `professor_fk1` (`department_id`),
  CONSTRAINT `professor_fk1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8380 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (8376,'Dan ','Moldovan','PhD','Natural Language Processing','19421710161','moldovan@hlt.utdallas.edu','ECS South 3.410,\r\nErik Jonsson School of Engineering and Computer Science,The University of Texas at Dallas',NULL,'danm123','danm123'),(8377,'Chris ','Davis','PhD','Computational Linguistics','19728833574','chrisirwindavis@utdallas.edu','ECSS 4.705, Eric Jonson School of Engg and Computer Science, The University of Texas at Dallas',NULL,'chris123','chris123'),(8378,'Vibhav','Gogate','PhD','Machine learning, Artificial Intelligence, Data mining and Big data.','19728834245','vgogate@hlt.utdallas.edu','ECSS 3.406, The Univesity Of Texas at Dallas',NULL,'vibhav123','vibhav123'),(8379,'Ramaswamy','Chandrasekaran','PhD','Ashbel Smith Professor-Computer Science','19728832032','Ramaswamy.Chandrasekaran@utdallas.edu',' ECSN 4.622, The University of Texas at Dallas',NULL,'rama123','rama123');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor_job`
--

DROP TABLE IF EXISTS `professor_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor_job` (
  `prof_job` int(11) NOT NULL AUTO_INCREMENT,
  `professor_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prof_job`),
  KEY `professor_job_fk1` (`professor_id`),
  KEY `professor_job_fk2` (`job_id`),
  CONSTRAINT `professor_job_fk1` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`),
  CONSTRAINT `professor_job_fk2` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_job`
--

LOCK TABLES `professor_job` WRITE;
/*!40000 ALTER TABLE `professor_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_title` varchar(512) DEFAULT NULL,
  `project_description` varchar(2048) DEFAULT NULL,
  `project_domain` varchar(512) DEFAULT NULL,
  `prog_lang` varchar(512) DEFAULT NULL,
  `database_used` varchar(255) DEFAULT NULL,
  `team_size` int(11) DEFAULT NULL,
  `tools` varchar(518) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14705 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (14695,'Airline Management System','Database Management Project for maintaining the Airline Schema in MySQL database and querying the database for different scenarios','Database Management','Java, JavaScript','MySQL',1,'Apache Tomcat'),(14696,'Content Based Image Retrieval','Extracting the similar images based on the contents of the input images using HHT, Fourier, Color and Texture transform','Digital Image Processing','MATLAB','MySQL',4,'Eclipse'),(14697,'Extended Wordnet','The goal of this project is to develop a tool that takes as input the current or future versions of WordNet and automatically generates an eXtended WordNet that provides several important enhancements intended to remedy the present limitations of WordNet.\r\nIn the eXtended WordNet the WordNet glosses are syntactically parsed, transformed into logic forms and content words are semantically disambiguated.','Natural Language Processing','Java','MySQL',4,''),(14698,'Text Mining for Telecommunications','The text mining technology aims to discover new knowledge from unrestricted textual documents. In this project we build a text mining technology and apply it to the telecommunications industry. This includes the development of knowledge bases and ontologies by processing documents relevant to telecommunications. ','Natural Language Processing','Java','MySQL',2,'Eclipse'),(14699,'Extended Wordnet','The goal of this project is to develop a tool that takes as input the current or future versions of WordNet and automatically generates an eXtended WordNet that provides several important enhancements intended to remedy the present limitations of WordNet.\r\nIn the eXtended WordNet the WordNet glosses are syntactically parsed, transformed into logic forms and content words are semantically disambiguated.','Natural Language Processing','Java, JavaScript','MySQL',4,'Wordnet'),(14700,'Adaptive Protocols for a Distributed Java Virtual Machine','Java is a language of growing importance but so far parallelism in Java has been limited to either multi-threading on symmetric multiprocessors (SMP) or distributed computing using Remote Method Invocation (RMI). The number and size of Java-based Internet-related applications require more and more parallelism and system scalability. This proposal addresses the problem of designing memory consistency protocols for a distributed Java Virtual Machine capable of self-adapting at runtime to different application characteristics. The work under this project is divided into five tasks: (1) the definition of the memory consistency model, (2) the development of consistency protocols, (3) the definition of an analytical performance model on which adaptive protocols are based, (4) the development of processor allocation algorithms for load balancing, and (5) the evaluation of the system performance using four classes of applications. ','Natural Language Processing','Java','DB2',1,'Eclipse'),(14701,'Automatic Contact Synchronization','J2ME Application to synchronize the contacts based on Cloud on all the devices of particular user','J2ME','Java','SQLite',4,'Apache Tomcat'),(14702,'Alchemy 2','Alchemy 2 The pre-release version of Alchemy 2.0 is available. Alchemy 2.0 is a software package for inference and learning in Markov logic networks (MLNs). As the name suggests, Alchemy 2.0 is based on the Alchemy software package. The novelty in Alchemy 2.0 is that it includes several lifted probabilistic inference algorithms.','Artificial Intelligence','Python','',5,''),(14703,'Recent Advances in Combinatorial Optimization: Flow Problems','Recent Advances in Combinatorial Optimization: Flow Problems and Network synthesis\r\nIndo-US workshop on Computational Optimization and Systems Analysis, IIT Kanpur','Operating Systems','Unix','',4,''),(14704,'Recent Advances in Combinatorial Optimization: Flow Problems','Recent Advances in Combinatorial Optimization: Flow Problems and Network synthesis\r\nIndo-US workshop on Computational Optimization and Systems Analysis, IIT Kanpur','Operating Systems','Unix','',4,'');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_professor`
--

DROP TABLE IF EXISTS `projects_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_professor` (
  `proj_prof` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `professor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`proj_prof`),
  KEY `projects_professor_fk1` (`project_id`),
  KEY `projects_professor_fk2` (`professor_id`),
  CONSTRAINT `projects_professor_fk1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `projects_professor_fk2` FOREIGN KEY (`professor_id`) REFERENCES `professor` (`professor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_professor`
--

LOCK TABLES `projects_professor` WRITE;
/*!40000 ALTER TABLE `projects_professor` DISABLE KEYS */;
INSERT INTO `projects_professor` VALUES (3,14699,8376),(4,14700,8377),(5,14702,8378),(6,14703,8379),(7,14704,8379);
/*!40000 ALTER TABLE `projects_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES ('SEQ_GEN',0);
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `contact_number` char(13) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `username` varchar(13) NOT NULL,
  `password` varchar(14) NOT NULL,
  `StudentType` varchar(128) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `Student_fk` (`department_id`),
  CONSTRAINT `Student_fk` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14456 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (14454,'Prasad','Pande','Computer Science','4692303887','pande.prasad1@gmail.com','7825, McCallum BlvdApartment 716DallasTexas75252',NULL,'prasad123','prasad123','Graduate Student'),(14455,'Rahul','Dalia','Computer Science','14692305542','rahul.dalia1@gmail.com','716-Border PL, University OaksApt-3ArlingtonTexas76013',NULL,'rahul123','rahul123','Graduate Student');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course` (
  `stud_course` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `course_id` varchar(8) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stud_course`),
  KEY `student_course_fk1` (`student_id`),
  KEY `student_course_fk2` (`course_id`),
  CONSTRAINT `student_course_fk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_course_fk2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_job`
--

DROP TABLE IF EXISTS `student_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_job` (
  `stud_job` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `job_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stud_job`),
  KEY `student_job_fk1` (`student_id`),
  KEY `student_job_fk2` (`job_id`),
  CONSTRAINT `student_job_fk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_job_fk2` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_job`
--

LOCK TABLES `student_job` WRITE;
/*!40000 ALTER TABLE `student_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_projects`
--

DROP TABLE IF EXISTS `student_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_projects` (
  `stud_proj` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`stud_proj`),
  KEY `student_projects_fk1` (`student_id`),
  KEY `student_projects_fk2` (`project_id`),
  CONSTRAINT `student_projects_fk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  CONSTRAINT `student_projects_fk2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=790 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_projects`
--

LOCK TABLES `student_projects` WRITE;
/*!40000 ALTER TABLE `student_projects` DISABLE KEYS */;
INSERT INTO `student_projects` VALUES (787,14454,14695),(788,14454,14696),(789,14455,14701);
/*!40000 ALTER TABLE `student_projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-09 18:42:33
