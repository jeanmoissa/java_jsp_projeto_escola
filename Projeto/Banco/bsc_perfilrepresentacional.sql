-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: bsc
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `perfilrepresentacional`
--

DROP TABLE IF EXISTS `perfilrepresentacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfilrepresentacional` (
  `idPerfilRepresentacional` int NOT NULL AUTO_INCREMENT,
  `idAluno` int NOT NULL,
  `prq1a` int NOT NULL,
  `prq1b` int NOT NULL,
  `prq1c` int NOT NULL,
  `prq1d` int NOT NULL,
  `prq2a` int NOT NULL,
  `prq2b` int NOT NULL,
  `prq2c` int NOT NULL,
  `prq2d` int NOT NULL,
  `prq3a` int NOT NULL,
  `prq3b` int NOT NULL,
  `prq3c` int NOT NULL,
  `prq3d` int NOT NULL,
  `prq4a` int NOT NULL,
  `prq4b` int NOT NULL,
  `prq4c` int NOT NULL,
  `prq4d` int NOT NULL,
  `prq5a` int NOT NULL,
  `prq5b` int NOT NULL,
  `prq5c` int NOT NULL,
  `prq5d` int NOT NULL,
  `V` int NOT NULL,
  `C` int NOT NULL,
  `A` int NOT NULL,
  `D` int NOT NULL,
  PRIMARY KEY (`idPerfilRepresentacional`),
  UNIQUE KEY `idAluno_UNIQUE` (`idAluno`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfilrepresentacional`
--

LOCK TABLES `perfilrepresentacional` WRITE;
/*!40000 ALTER TABLE `perfilrepresentacional` DISABLE KEYS */;
INSERT INTO `perfilrepresentacional` VALUES (47,1,4,3,2,1,1,2,3,4,4,3,2,1,1,2,3,4,4,3,2,1,13,16,10,11);
/*!40000 ALTER TABLE `perfilrepresentacional` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-25 14:13:27
