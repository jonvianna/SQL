CREATE DATABASE  IF NOT EXISTS `locadora` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `locadora`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: locadora
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
-- Table structure for table `acervo`
--

DROP TABLE IF EXISTS `acervo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acervo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Título` varchar(40) DEFAULT NULL,
  `Genero` enum('Ação','Aventura','Comédia','Drama','Policial','Romance','Terror') DEFAULT NULL,
  `Ano` year DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acervo`
--

LOCK TABLES `acervo` WRITE;
/*!40000 ALTER TABLE `acervo` DISABLE KEYS */;
INSERT INTO `acervo` VALUES (1,'A Hora do Pesadelo','Terror',1986),(2,'Ben-Hur','Aventura',1960),(3,'Como eu era antes de você','Romance',2016),(4,'Estrada sem lei','Policial',2019),(5,'Forrest Gump - O contador de histórias','Comédia',1994),(6,'Harry Potter e a Ordem da Fênix','Aventura',2007),(7,'Intocáveis','Drama',2012),(8,'It - A Coisa','Terror',2017),(9,'Minha mãe é uma peça','Comédia',2013),(10,'O Iluminado','Terror',1980),(11,'O resgate do soldade Ryan','Drama',1998),(13,'Os Vingadores - The Avengers','Ação',2012),(14,'Pantera negra','Ação',2018),(15,'Para todos os garotos que já amei','Romance',2018),(31,'O Poderoso Chefão','Drama',1972);
/*!40000 ALTER TABLE `acervo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-09 22:09:35
