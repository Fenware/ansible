-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: database
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consult_schedule`
--

DROP TABLE IF EXISTS `consult_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consult_schedule` (
  `id_teacher` int NOT NULL,
  `day` tinyint NOT NULL,
  `start_hour` time NOT NULL,
  `end_hour` time NOT NULL,
  PRIMARY KEY (`id_teacher`,`day`),
  CONSTRAINT `consult_schedule_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `teacher` (`id`),
  CONSTRAINT `consult_schedule_chk_1` CHECK (((`day` >= 1) and (`day` <= 5)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consult_schedule`
--

LOCK TABLES `consult_schedule` WRITE;
/*!40000 ALTER TABLE `consult_schedule` DISABLE KEYS */;
INSERT INTO `consult_schedule` VALUES (13,1,'16:00:00','18:00:00'),(13,2,'10:00:00','18:00:00'),(13,3,'13:00:00','18:00:00'),(13,4,'10:00:00','18:00:00'),(13,5,'20:00:00','18:00:00');
/*!40000 ALTER TABLE `consult_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_orientation` int NOT NULL,
  `name` varchar(3) COLLATE utf8mb4_bin NOT NULL,
  `code` char(8) COLLATE utf8mb4_bin NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `id_orientation` (`id_orientation`),
  CONSTRAINT `group_ibfk_1` FOREIGN KEY (`id_orientation`) REFERENCES `orientation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,1,'AA','gERfubQ2',1),(2,1,'BA','uD9J2iQF',1),(3,2,'BC','USHzbV7K',1),(4,2,'CD','CFjtm2se',1),(5,3,'BE','6Y6ufEeG',1),(6,4,'CA','w8PZ53kE',1);
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individual`
--

DROP TABLE IF EXISTS `individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `individual_ibfk_1` FOREIGN KEY (`id`) REFERENCES `query` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual`
--

LOCK TABLES `individual` WRITE;
/*!40000 ALTER TABLE `individual` DISABLE KEYS */;
INSERT INTO `individual` VALUES (1);
/*!40000 ALTER TABLE `individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_query` int NOT NULL,
  `id_user` int NOT NULL,
  `content` varchar(600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`,`id_query`),
  KEY `id_user` (`id_user`),
  KEY `id_query` (`id_query`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`id_query`) REFERENCES `query` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,2,'Hola profe, como anda? la pregunta es la que puse en el tema. Gracias','2021-09-10 00:00:00'),(2,1,13,'Buen dia, todo tranquilo bajo el sol? Me parece que faltaste el dia que tratamos ese tema en clase, un desviado social es una persona que tiene un comportamiento que va en contra de la expectativa de los demas. Que pase bien','2021-09-10 00:00:00'),(3,2,5,'Hello teacher, we would like to know the correct translation of <<consulta>> because we gonna use it in our proyect. Thanks!','2021-09-02 00:00:00'),(4,2,2,'That\'s a very good cuestion bro','2021-09-02 00:00:00'),(5,2,12,'Hello students, mmmm... you can use consultation or query, query sounds better, use that one.','2021-09-03 00:00:00');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orientation`
--

DROP TABLE IF EXISTS `orientation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orientation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `year` int NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orientation`
--

LOCK TABLES `orientation` WRITE;
/*!40000 ALTER TABLE `orientation` DISABLE KEYS */;
INSERT INTO `orientation` VALUES (1,'Informatica 1',1,1),(2,'Informatica 2',2,1),(3,'Desarrollo y Soporte',3,1),(4,'Desarrollo Web',3,1);
/*!40000 ALTER TABLE `orientation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query`
--

DROP TABLE IF EXISTS `query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_student` int NOT NULL,
  `id_teacher` int NOT NULL,
  `id_group` int NOT NULL,
  `id_subject` int NOT NULL,
  `theme` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL,
  `finish_date` datetime DEFAULT NULL,
  `resume` text COLLATE utf8mb4_unicode_ci,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_student` (`id_student`),
  KEY `id_teacher` (`id_teacher`,`id_group`,`id_subject`),
  CONSTRAINT `query_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`),
  CONSTRAINT `query_ibfk_2` FOREIGN KEY (`id_teacher`, `id_group`, `id_subject`) REFERENCES `teacher_group_subject` (`id_teacher`, `id_group`, `id_subject`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query`
--

LOCK TABLES `query` WRITE;
/*!40000 ALTER TABLE `query` DISABLE KEYS */;
INSERT INTO `query` VALUES (1,2,13,5,8,'Que es un desviado social?','2021-09-10 00:00:00','2021-09-10 00:00:00','Un desviado social es una persona que tiene un comportamiento que va contra de la expectativa de los demas',1),(2,5,12,5,2,'The correct translation of <<consulta>> ','2021-09-02 00:00:00','2021-09-03 00:00:00','We can use consultation or query, but consultation sounds like you don\'t know english and you are throwing fruit',1);
/*!40000 ALTER TABLE `query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`id`) REFERENCES `query` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (2);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_participants`
--

DROP TABLE IF EXISTS `room_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_participants` (
  `id_room` int NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_room`,`id_user`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `room_participants_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `room` (`id`),
  CONSTRAINT `room_participants_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_participants`
--

LOCK TABLES `room_participants` WRITE;
/*!40000 ALTER TABLE `room_participants` DISABLE KEYS */;
INSERT INTO `room_participants` VALUES (2,2),(2,5),(2,12);
/*!40000 ALTER TABLE `room_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2),(3),(4),(5),(6),(7),(8);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_group`
--

DROP TABLE IF EXISTS `student_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_group` (
  `id_student` int NOT NULL,
  `id_group` int NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_student`),
  KEY `id_group` (`id_group`),
  CONSTRAINT `student_group_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id`),
  CONSTRAINT `student_group_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_group`
--

LOCK TABLES `student_group` WRITE;
/*!40000 ALTER TABLE `student_group` DISABLE KEYS */;
INSERT INTO `student_group` VALUES (2,5,1),(3,1,1),(4,2,1),(5,5,1),(6,5,1),(7,3,1),(8,4,1);
/*!40000 ALTER TABLE `student_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Matematica',1),(2,'Ingles',1),(3,'Fisica',1),(4,'Quimica',1),(5,'Analisis y Produccion de Textos',1),(6,'Historia',1),(7,'Filosofia',1),(8,'Sociologia',1),(9,'Biologia CTS',1),(10,'Economia',1),(11,'Programacion I',1),(12,'Sistemas Opeativos I',1),(13,'Logica Para Informatica',1),(14,'Metodos Discretos',1),(15,'Lab. de Soporte de Equipos Informaticos',1),(16,'Geometria',1),(17,'Lab. de Tecnologias Electricas Aplicadas',1),(18,'Programacion II',1),(19,'Sistemas Operativos II',1),(20,'Disenno Web',1),(21,'Sistemas de Bases de Datos I',1),(22,'Lab. de Redes de Area Local',1),(23,'Electronica aplicada a la Informatica',1),(24,'Programacion Web',1),(25,'Gestion de Proyectos Web',1),(26,'Programacion III',1),(27,'Gestion de Proyecto',1),(28,'Redes de Datos y Seguridad',1),(29,'Sistemas de Bases de Datos II',1),(30,'Formacion Empresarial',1),(31,'Sistemas Operativos III',1),(32,'Analisis y disenno de Aplicaciones',1);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_orientation`
--

DROP TABLE IF EXISTS `subject_orientation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_orientation` (
  `id_subject` int NOT NULL,
  `id_orientation` int NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_subject`,`id_orientation`),
  KEY `id_orientation` (`id_orientation`),
  CONSTRAINT `subject_orientation_ibfk_1` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`),
  CONSTRAINT `subject_orientation_ibfk_2` FOREIGN KEY (`id_orientation`) REFERENCES `orientation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_orientation`
--

LOCK TABLES `subject_orientation` WRITE;
/*!40000 ALTER TABLE `subject_orientation` DISABLE KEYS */;
INSERT INTO `subject_orientation` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(2,1,1),(2,2,1),(2,3,1),(2,4,1),(3,2,1),(4,1,1),(5,1,1),(5,2,1),(6,1,1),(7,3,1),(7,4,1),(8,3,1),(8,4,1),(9,1,1),(10,2,1),(11,1,1),(12,1,1),(13,1,1),(14,1,1),(15,1,1),(16,1,1),(16,2,1),(17,1,1),(18,2,1),(19,2,1),(20,2,1),(20,4,1),(21,2,1),(22,2,1),(23,2,1),(24,4,1),(25,4,1),(26,3,1),(27,3,1),(28,3,1),(29,3,1),(29,4,1),(30,3,1),(30,4,1),(31,3,1),(31,4,1),(32,3,1),(32,4,1);
/*!40000 ALTER TABLE `subject_orientation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `id` int NOT NULL,
  `max_rooms_per_gs` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  CONSTRAINT `teacher_chk_1` CHECK ((`max_rooms_per_gs` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (9,1),(10,1),(11,1),(12,1),(13,1),(14,1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_group`
--

DROP TABLE IF EXISTS `teacher_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_group` (
  `id_teacher` int NOT NULL,
  `id_group` int NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_teacher`,`id_group`),
  KEY `id_group` (`id_group`),
  CONSTRAINT `teacher_group_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `teacher` (`id`),
  CONSTRAINT `teacher_group_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_group`
--

LOCK TABLES `teacher_group` WRITE;
/*!40000 ALTER TABLE `teacher_group` DISABLE KEYS */;
INSERT INTO `teacher_group` VALUES (9,1,1),(9,2,1),(9,3,1),(10,5,1),(10,6,1),(11,1,1),(11,2,1),(12,1,1),(12,2,1),(12,5,1),(13,1,1),(13,2,1),(13,5,1);
/*!40000 ALTER TABLE `teacher_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_group_subject`
--

DROP TABLE IF EXISTS `teacher_group_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_group_subject` (
  `id_teacher` int NOT NULL,
  `id_group` int NOT NULL,
  `id_subject` int NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_teacher`,`id_group`,`id_subject`),
  CONSTRAINT `teacher_group_subject_ibfk_1` FOREIGN KEY (`id_teacher`, `id_group`) REFERENCES `teacher_group` (`id_teacher`, `id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_group_subject`
--

LOCK TABLES `teacher_group_subject` WRITE;
/*!40000 ALTER TABLE `teacher_group_subject` DISABLE KEYS */;
INSERT INTO `teacher_group_subject` VALUES (9,1,1,1),(9,2,1,1),(9,3,1,1),(10,5,30,1),(10,6,30,1),(11,1,5,1),(11,2,5,1),(12,1,2,1),(12,2,2,1),(12,5,2,1),(13,1,6,1),(13,2,10,1),(13,5,8,1);
/*!40000 ALTER TABLE `teacher_group_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ci` char(9) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `middle_name` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `surname` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `second_surname` varchar(16) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(50) COLLATE utf8mb4_bin DEFAULT '01-man.svg',
  `nickname` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `state_account` tinyint(1) NOT NULL DEFAULT '2',
  `connection_time` datetime DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'00000000','Administrador',NULL,'Administrador',NULL,'administrador@admin.com','01-man.svg','administrador',1,NULL,'$2y$10$NOA9YzGzXsE.DCGwMMor2uYcl5ZtJGJxCix88blfVIcNg3H7c7KKW'),(2,'55618821','Lucas',NULL,'Pintos',NULL,'lucaspintos909@gmail.com','02-boy.svg','lucaspintos909',2,NULL,'$2y$10$NOA9YzGzXsE.DCGwMMor2uYcl5ZtJGJxCix88blfVIcNg3H7c7KKW'),(3,'55618823','Juan',NULL,'Perez',NULL,'jp@gmail.com','02-boy.svg','Chopan',1,NULL,'$2y$10$SUKaHxnxnDi4BLZ9gaXwPee0V9tTJVVekq3f1W1q8MVxsC9CeypZi'),(4,'55628425','Gimena',NULL,'Sosa',NULL,'laGime123@gmail.com','02-boy.svg','WatterLemon',1,NULL,'$2y$10$Zin6Sn6KsJbVPVeC9sFmguyTFWsbTvU2MmjKt04hmiSmbgFqc/mmq'),(5,'55654882','Felipe',NULL,'Dobrinin',NULL,'fel@gmail.com','07-boy-2.svg','Ramandudu',2,NULL,'$2y$10$IKLJtiGl.ti2p52tdpLTYOUlZWDMS8sxMTRL75CIFnG04fSO3JBrW'),(6,'55123882','David',NULL,'De Los Santos',NULL,'d2a@gmail.com','07-boy-2.svg','El Planilla',1,NULL,'$2y$10$sTt2XEiRDwIep2YA6nerPeNVOxmFj2gUAOjXsFDne5h0IW8N9QuhC'),(7,'35123882','Adrian',NULL,'Del Valle',NULL,'incongnito43@gmail.com','07-boy-2.svg','Larabel',1,NULL,'$2y$10$SHSoqQ7R419cipEOB3mfP.f7P5uoSjiBeMI5xF0MVuRAmPx4bQhe6'),(8,'15123882','Maria','Antonieta','De Las Nieves',NULL,'marymary@gmail.com','07-boy-2.svg','La Chilindrina',1,NULL,'$2y$10$WRkUcgw1Xs4CAqV9Juut9evoTNzWvpXGOBm1MgaBi2lxJ1jGrrPbS'),(9,'25123882','Dulcinea',NULL,'Del Toboso',NULL,'ejemplo@gmail.com','07-boy-2.svg','La Donna',1,NULL,'$2y$10$CnrfzHzJX1ptLdw2PxQUo.JxR/5pPPxbtMU6I5B.CF77Cl2Vr/ih2'),(10,'25123482','Docente',NULL,'Del ESI',NULL,'docente@gmail.com','07-boy-2.svg','docente123',2,NULL,'$2y$10$NOA9YzGzXsE.DCGwMMor2uYcl5ZtJGJxCix88blfVIcNg3H7c7KKW'),(11,'37123482','Hugo',NULL,'Soca',NULL,'delPlatoALaTierra@gmail.com','07-boy-2.svg','Hugox',1,NULL,'$2y$10$L10fWCklfyHYE6HHYBJfPuKB/k9jI8luFdYwYxQlvUPAi2hK0FWQ2'),(12,'17123482','Armando',NULL,'Mesa',NULL,'carpinteria@gmail.com','07-boy-2.svg','WiWi',1,NULL,'$2y$10$wsQRNDfHy/msMmbUh9hFBeVQmU9aiNzM2xunTNVNqWAjsMbPwXFsi'),(13,'47321482','Keny',NULL,'Bell',NULL,'personal@gmail.com','07-boy-2.svg','Campanita',1,NULL,'$2y$10$PIy9wHl9KhNoND.NFGTx9udt.zdkzoHl6wdfNkrBkbL.EBU6LV0bq'),(14,'49821482','Adrian',NULL,'Machado',NULL,'machado@gmail.com','07-boy-2.svg','Manchado',1,NULL,'$2y$10$eN3xOi3I5MeZ.KxnbYOEreB/cWjAgPWmg.Y3WyISMjk84DvR4jJ5C');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-31 14:01:23
