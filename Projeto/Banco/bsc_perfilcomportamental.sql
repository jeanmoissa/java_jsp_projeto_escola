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
-- Table structure for table `perfilcomportamental`
--

DROP TABLE IF EXISTS `perfilcomportamental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfilcomportamental` (
  `idPerfilComportamental` int NOT NULL AUTO_INCREMENT,
  `idAluno` int NOT NULL,
  `pcq1` char(1) NOT NULL,
  `pcq2` char(1) NOT NULL,
  `pcq3` char(1) NOT NULL,
  `pcq4` char(1) NOT NULL,
  `pcq5` char(1) NOT NULL,
  `pcq6` char(1) NOT NULL,
  `pcq7` char(1) NOT NULL,
  `pcq8` char(1) NOT NULL,
  `pcq9` char(1) NOT NULL,
  `pcq10` char(1) NOT NULL,
  `pcq11` char(1) NOT NULL,
  `pcq12` char(1) NOT NULL,
  `pcq13` char(1) NOT NULL,
  `pcq14` char(1) NOT NULL,
  `pcq15` char(1) NOT NULL,
  `pcq16` char(1) NOT NULL,
  `pcq17` char(1) NOT NULL,
  `pcq18` char(1) NOT NULL,
  `pcq19` char(1) NOT NULL,
  `pcq20` char(1) NOT NULL,
  `pcq21` char(1) NOT NULL,
  `pcq22` char(1) NOT NULL,
  `pcq23` char(1) NOT NULL,
  `pcq24` char(1) NOT NULL,
  `pcq25` char(1) NOT NULL,
  `A` int NOT NULL,
  `C` int NOT NULL,
  `I` int NOT NULL,
  `O` int NOT NULL,
  `resultadoComportamental` varchar(20) NOT NULL,
  PRIMARY KEY (`idPerfilComportamental`),
  UNIQUE KEY `idAluno_UNIQUE` (`idAluno`),
  CONSTRAINT `idAlunoComportamental` FOREIGN KEY (`idAluno`) REFERENCES `alunos` (`idAluno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfilcomportamental`
--

LOCK TABLES `perfilcomportamental` WRITE;
/*!40000 ALTER TABLE `perfilcomportamental` DISABLE KEYS */;
INSERT INTO `perfilcomportamental` VALUES (3,1,'C','C','O','C','O','A','O','O','A','O','A','O','C','A','A','C','C','O','C','I','O','C','O','I','C',5,9,2,9,'Empate C e O'),(4,4,'O','C','O','C','A','C','C','O','O','A','O','A','A','A','I','A','C','O','C','A','I','O','A','A','C',9,7,2,7,'Letra A');
/*!40000 ALTER TABLE `perfilcomportamental` ENABLE KEYS */;
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
