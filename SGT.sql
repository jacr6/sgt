-- MySQL dump 10.13  Distrib 5.6.28, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: SGT
-- ------------------------------------------------------
-- Server version	5.6.28-0ubuntu0.15.04.1

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
-- Current Database: `SGT`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `SGT` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `SGT`;

--
-- Table structure for table `Actividade`
--

DROP TABLE IF EXISTS `Actividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Actividade` (
  `cod_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `actividad` varchar(50) DEFAULT NULL,
  `duracion` float DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_actividad`),
  UNIQUE KEY `cod_actividad` (`cod_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actividade`
--

LOCK TABLES `Actividade` WRITE;
/*!40000 ALTER TABLE `Actividade` DISABLE KEYS */;
INSERT INTO `Actividade` VALUES (1,'TSS',2,'2016-05-10 13:27:14','2016-05-10 13:27:14'),(2,'ST',3,'2016-05-10 13:27:14','2016-05-10 13:27:14'),(3,'Aprobacion',1,'2016-05-10 13:27:14','2016-05-10 13:27:14'),(4,'Diseno',1,'2016-05-10 13:27:14','2016-05-10 13:27:14'),(5,'Aprobacion Diseno',1,'2016-05-10 13:27:14','2016-05-10 13:27:14'),(6,'Solicitud de TSS',1,'2016-05-10 13:27:14','2016-05-10 13:27:14'),(7,'PO TSS',7,'2016-05-10 13:27:14','2016-05-10 13:27:14'),(8,'Estimado TSS',10,'2016-05-10 16:05:27','2016-05-10 16:07:34');
/*!40000 ALTER TABLE `Actividade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Actividades_after_update` AFTER UPDATE ON `Actividade` FOR EACH ROW BEGIN

SET @DIA = (SELECT T1.duracion FROM Actividades T1 where T1.actividad like '%Estimado%');
update Surveys T1
 SET T1.estimada= TIMESTAMPADD(DAY,@DIA,T1.creado);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Aprobacione`
--

DROP TABLE IF EXISTS `Aprobacione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aprobacione` (
  `cod_ok` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_ok`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aprobacione`
--

LOCK TABLES `Aprobacione` WRITE;
/*!40000 ALTER TABLE `Aprobacione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aprobacione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asignacione`
--

DROP TABLE IF EXISTS `Asignacione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Asignacione` (
  `cod_asignacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_asignacion`),
  UNIQUE KEY `cod_asignacion_UNIQUE` (`cod_asignacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asignacione`
--

LOCK TABLES `Asignacione` WRITE;
/*!40000 ALTER TABLE `Asignacione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Asignacione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Atp`
--

DROP TABLE IF EXISTS `Atp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Atp` (
  `cod_atp` int(11) NOT NULL AUTO_INCREMENT,
  `cod_po` int(11) DEFAULT NULL,
  `cod_station` int(11) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_atp`),
  UNIQUE KEY `cod_atp_UNIQUE` (`cod_atp`),
  KEY `FK_Atps_Pos` (`cod_po`),
  KEY `FK_Atps_Stations` (`cod_station`),
  CONSTRAINT `FK_Atps_Pos` FOREIGN KEY (`cod_po`) REFERENCES `PO` (`cod_po`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Atps_Stations` FOREIGN KEY (`cod_station`) REFERENCES `Estacione` (`cod_station`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Atp`
--

LOCK TABLES `Atp` WRITE;
/*!40000 ALTER TABLE `Atp` DISABLE KEYS */;
/*!40000 ALTER TABLE `Atp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ciudade`
--

DROP TABLE IF EXISTS `Ciudade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ciudade` (
  `cod_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(45) DEFAULT NULL,
  `region` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_ciudad`),
  KEY `FK_Ciudades_Regiones` (`region`),
  CONSTRAINT `FK_Ciudades_Regiones` FOREIGN KEY (`region`) REFERENCES `Regione` (`cod_region`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciudade`
--

LOCK TABLES `Ciudade` WRITE;
/*!40000 ALTER TABLE `Ciudade` DISABLE KEYS */;
INSERT INTO `Ciudade` VALUES (1,'Pichincha',2,'Quito','2016-05-10 16:02:27','2016-05-10 16:02:27');
/*!40000 ALTER TABLE `Ciudade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contratista`
--

DROP TABLE IF EXISTS `Contratista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contratista` (
  `cod_contratista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `region` int(11) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_contratista`),
  UNIQUE KEY `codigo_UNIQUE` (`cod_contratista`),
  KEY `region_idx` (`region`),
  CONSTRAINT `region` FOREIGN KEY (`region`) REFERENCES `Ciudade` (`cod_ciudad`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contratista`
--

LOCK TABLES `Contratista` WRITE;
/*!40000 ALTER TABLE `Contratista` DISABLE KEYS */;
INSERT INTO `Contratista` VALUES (1,'Jose Cuevas',1,'2016-05-10 20:56:24','2016-05-10 20:56:29');
/*!40000 ALTER TABLE `Contratista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diseno`
--

DROP TABLE IF EXISTS `Diseno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Diseno` (
  `cod_diseno` int(11) NOT NULL AUTO_INCREMENT,
  `cod_po` int(11) NOT NULL DEFAULT '0',
  `cod_contratista` int(11) NOT NULL DEFAULT '0',
  `cod_station` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_diseno`),
  UNIQUE KEY `cod_diseño_UNIQUE` (`cod_diseno`),
  KEY `FK_Disenos_Contratistas` (`cod_contratista`),
  KEY `FK_Disenos_Pos` (`cod_po`),
  KEY `FK_Disenos_Stations` (`cod_station`),
  CONSTRAINT `FK_Disenos_Contratistas` FOREIGN KEY (`cod_contratista`) REFERENCES `Contratista` (`cod_contratista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Disenos_Pos` FOREIGN KEY (`cod_po`) REFERENCES `PO` (`cod_po`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Disenos_Stations` FOREIGN KEY (`cod_station`) REFERENCES `Estacione` (`cod_station`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diseno`
--

LOCK TABLES `Diseno` WRITE;
/*!40000 ALTER TABLE `Diseno` DISABLE KEYS */;
/*!40000 ALTER TABLE `Diseno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entregable`
--

DROP TABLE IF EXISTS `Entregable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entregable` (
  `cod_entregable` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_entregable` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_entregable`),
  UNIQUE KEY `cod_entregable_UNIQUE` (`cod_entregable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entregable`
--

LOCK TABLES `Entregable` WRITE;
/*!40000 ALTER TABLE `Entregable` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entregable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estacione`
--

DROP TABLE IF EXISTS `Estacione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estacione` (
  `cod_station` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `ciudad` int(11) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_station`),
  UNIQUE KEY `cod_estacion_UNIQUE` (`cod_station`),
  KEY `FK_Stations_Ciudades` (`ciudad`),
  CONSTRAINT `FK_Stations_Ciudades` FOREIGN KEY (`ciudad`) REFERENCES `Ciudade` (`cod_ciudad`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estacione`
--

LOCK TABLES `Estacione` WRITE;
/*!40000 ALTER TABLE `Estacione` DISABLE KEYS */;
INSERT INTO `Estacione` VALUES (1,'Las Aguilas',1,'2016-05-10 23:42:29','2016-05-10 23:42:32'),(4,'Los Castores',1,'2016-05-11 22:29:33','2016-05-11 22:29:34');
/*!40000 ALTER TABLE `Estacione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estado`
--

DROP TABLE IF EXISTS `Estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Estado` (
  `cod_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT '0',
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_estado`),
  UNIQUE KEY `cod_estado` (`cod_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estado`
--

LOCK TABLES `Estado` WRITE;
/*!40000 ALTER TABLE `Estado` DISABLE KEYS */;
INSERT INTO `Estado` VALUES (1,'PENDIENTE','2016-05-10 18:59:07','2016-05-10 18:59:07'),(2,'POR APROBACION','2016-05-10 18:59:22','2016-05-10 18:59:22'),(3,'APROBADO','2016-05-10 18:59:30','2016-05-10 18:59:35'),(4,'EN OBRAS','2016-05-10 18:59:57','2016-05-10 18:59:57'),(5,'EN INPECCION','2016-05-10 19:00:19','2016-05-10 19:00:19');
/*!40000 ALTER TABLE `Estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Factura`
--

DROP TABLE IF EXISTS `Factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Factura` (
  `cod_factura` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `referencia` int(11) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `tipo_factura` int(11) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_factura`),
  UNIQUE KEY `cod_factura_UNIQUE` (`cod_factura`),
  KEY `tipo_factura_idx` (`tipo_factura`),
  CONSTRAINT `fk_factura` FOREIGN KEY (`tipo_factura`) REFERENCES `Tipo_factura` (`cod_tipo`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Factura`
--

LOCK TABLES `Factura` WRITE;
/*!40000 ALTER TABLE `Factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Implementacione`
--

DROP TABLE IF EXISTS `Implementacione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Implementacione` (
  `cod_imp` int(11) NOT NULL AUTO_INCREMENT,
  `cod_station` int(11) DEFAULT NULL,
  `cod_po` int(11) DEFAULT NULL,
  `cod_contratista` int(11) DEFAULT NULL,
  `estimado` DATETIME NOT NULL DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_imp`),
  UNIQUE KEY `cod_imp_UNIQUE` (`cod_imp`),
  KEY `FK_Implementaciones_Contratistas` (`cod_contratista`),
  KEY `FK_Implementaciones_Pos` (`cod_po`),
  KEY `FK_Implementaciones_Stations` (`cod_station`),
  CONSTRAINT `FK_Implementaciones_Contratistas` FOREIGN KEY (`cod_contratista`) REFERENCES `Contratista` (`cod_contratista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Implementaciones_Pos` FOREIGN KEY (`cod_po`) REFERENCES `PO` (`cod_po`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Implementaciones_Stations` FOREIGN KEY (`cod_station`) REFERENCES `Estacione` (`cod_station`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Implementacione`
--

LOCK TABLES `Implementacione` WRITE;
/*!40000 ALTER TABLE `Implementacione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Implementacione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inspeccione`
--

DROP TABLE IF EXISTS `Inspeccione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inspeccione` (
  `cod_srvy` int(11) NOT NULL AUTO_INCREMENT,
  `cod_station` int(11) DEFAULT NULL,
  `cod_estado` int(11) DEFAULT NULL,
  `cod_contratista` int(11) NOT NULL,
  `estimada` DATETIME NULL DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_srvy`),
  KEY `cod_estacion_idx` (`cod_station`),
  KEY `FK_Surveys_Contratistas` (`cod_contratista`),
  KEY `FK_Surveys_Estados` (`cod_estado`),
  CONSTRAINT `FK_Surveys_Contratistas` FOREIGN KEY (`cod_contratista`) REFERENCES `Contratista` (`cod_contratista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Surveys_Estados` FOREIGN KEY (`cod_estado`) REFERENCES `Estado` (`cod_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cod_estacion` FOREIGN KEY (`cod_station`) REFERENCES `Estacione` (`cod_station`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inspeccione`
--

LOCK TABLES `Inspeccione` WRITE;
/*!40000 ALTER TABLE `Inspeccione` DISABLE KEYS */;
INSERT INTO `Inspeccione` VALUES (2,1,1,1,'2016-05-21 02:07:57','2016-05-11 02:07:57','2016-05-10 21:22:16');
/*!40000 ALTER TABLE `Inspeccione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Surveys_before_insert` BEFORE INSERT ON `Inspeccione` FOR EACH ROW BEGIN

SET @DIA = (SELECT T1.duracion FROM Actividades T1 where T1.actividad like '%Estimado%');
 SET NEW.estimada= TIMESTAMPADD(DAY,@DIA,NEW.creado);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Operacione`
--

DROP TABLE IF EXISTS `Operacione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Operacione` (
  `cod_operacion` int(11) NOT NULL AUTO_INCREMENT,
  `cod_contratista` int(11) DEFAULT NULL,
  `cod_operadora` int(11) DEFAULT NULL,
  `cod_vendor` int(11) DEFAULT NULL,
  `cod_entregable` int(11) DEFAULT NULL,
  `cod_tipo` int(11) DEFAULT NULL,
  `cod_station` int(11) DEFAULT NULL,
  `cod_po` int(11) DEFAULT NULL,
  `cod_atp` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_operacion`),
  UNIQUE KEY `cod_operacion_UNIQUE` (`cod_operacion`),
  KEY `cod_contratista_idx` (`cod_contratista`),
  KEY `cod_operadora_idx` (`cod_operadora`),
  KEY `cod_vendor_idx` (`cod_vendor`),
  KEY `cod_entregable_idx` (`cod_entregable`),
  KEY `cod_tipo_idx` (`cod_tipo`),
  KEY `cod_estacion_idx` (`cod_station`),
  KEY `cod_pos_idx` (`cod_po`),
  KEY `cod_atp_idx` (`cod_atp`),
  CONSTRAINT `fk_atp` FOREIGN KEY (`cod_atp`) REFERENCES `Atp` (`cod_atp`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_contratista` FOREIGN KEY (`cod_contratista`) REFERENCES `Contratista` (`cod_contratista`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_entregable` FOREIGN KEY (`cod_entregable`) REFERENCES `Entregable` (`cod_entregable`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_estacion` FOREIGN KEY (`cod_station`) REFERENCES `Estacione` (`cod_station`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_operadora` FOREIGN KEY (`cod_operadora`) REFERENCES `Operadora` (`cod_operadora`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_pos` FOREIGN KEY (`cod_po`) REFERENCES `PO` (`cod_po`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo` FOREIGN KEY (`cod_tipo`) REFERENCES `Tipo` (`cod_tipo`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_vendor` FOREIGN KEY (`cod_vendor`) REFERENCES `Vendor` (`cod_vendor`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Operacione`
--

LOCK TABLES `Operacione` WRITE;
/*!40000 ALTER TABLE `Operacione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Operacione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Operadora`
--

DROP TABLE IF EXISTS `Operadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Operadora` (
  `cod_operadora` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_operadora`),
  UNIQUE KEY `cod_operadora_UNIQUE` (`cod_operadora`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Operadora`
--

LOCK TABLES `Operadora` WRITE;
/*!40000 ALTER TABLE `Operadora` DISABLE KEYS */;
INSERT INTO `Operadora` VALUES (1,'CNT','','2016-05-10 23:20:50','2016-05-10 23:20:59'),(2,'CLARO','','2016-05-10 18:28:29','2016-05-10 18:28:29'),(3,'MOVISTAR','','2016-05-10 18:28:29','2016-05-10 18:28:29');
/*!40000 ALTER TABLE `Operadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PO`
--

DROP TABLE IF EXISTS `PO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO` (
  `cod_po` int(11) NOT NULL AUTO_INCREMENT,
  `cod_station` int(11) DEFAULT NULL,
  `num_tipo` varchar(50) DEFAULT NULL,
  `cod_tipo` int(11) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_po`),
  UNIQUE KEY `cod_po_UNIQUE` (`cod_po`),
  KEY `FK_PO_tipo_PO` (`cod_tipo`),
  KEY `FK_Pos_Stations` (`cod_station`),
  CONSTRAINT `FK_PO_tipo_PO` FOREIGN KEY (`cod_tipo`) REFERENCES `Tipo_PO` (`cod_tipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Pos_Stations` FOREIGN KEY (`cod_station`) REFERENCES `Estacione` (`cod_station`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PO`
--

LOCK TABLES `PO` WRITE;
/*!40000 ALTER TABLE `PO` DISABLE KEYS */;
INSERT INTO `PO` VALUES (4,1,'22334455',1,'2016-05-11 19:30:25','2016-05-11 19:30:25');
/*!40000 ALTER TABLE `PO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Privilegio`
--

DROP TABLE IF EXISTS `Privilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Privilegio` (
  `level` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`level`),
  UNIQUE KEY `level_UNIQUE` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Privilegio`
--

LOCK TABLES `Privilegio` WRITE;
/*!40000 ALTER TABLE `Privilegio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Privilegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Regione`
--

DROP TABLE IF EXISTS `Regione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Regione` (
  `cod_region` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(50) DEFAULT '0',
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_region`),
  UNIQUE KEY `cod_region` (`cod_region`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Regione`
--

LOCK TABLES `Regione` WRITE;
/*!40000 ALTER TABLE `Regione` DISABLE KEYS */;
INSERT INTO `Regione` VALUES (1,'Costa','2016-05-10 16:13:26','2016-05-10 16:13:26'),(2,'Sierra','2016-05-10 16:13:26','2016-05-10 16:13:26'),(3,'Amazonas','2016-05-10 16:13:26','2016-05-10 16:13:26'),(4,'Oriente','2016-05-10 16:13:26','2016-05-10 16:13:26');
/*!40000 ALTER TABLE `Regione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo`
--

DROP TABLE IF EXISTS `Tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo` (
  `cod_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_tipo`),
  UNIQUE KEY `cod_tipo_UNIQUE` (`cod_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo`
--

LOCK TABLES `Tipo` WRITE;
/*!40000 ALTER TABLE `Tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_PO`
--

DROP TABLE IF EXISTS `Tipo_PO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_PO` (
  `cod_tipo` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `creado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cod_tipo`),
  UNIQUE KEY `cod_tipo` (`cod_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_PO`
--

LOCK TABLES `Tipo_PO` WRITE;
/*!40000 ALTER TABLE `Tipo_PO` DISABLE KEYS */;
INSERT INTO `Tipo_PO` VALUES (1,'Deployment','2016-05-11 19:25:10','2016-05-11 19:25:10'),(2,'SiteSurvey','2016-05-11 19:24:14','2016-05-11 19:25:27');
/*!40000 ALTER TABLE `Tipo_PO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_factura`
--

DROP TABLE IF EXISTS `Tipo_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tipo_factura` (
  `cod_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_tipo`),
  UNIQUE KEY `cod_tipo_UNIQUE` (`cod_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_factura`
--

LOCK TABLES `Tipo_factura` WRITE;
/*!40000 ALTER TABLE `Tipo_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `cod_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_usuario`),
  UNIQUE KEY `cod_usuario_UNIQUE` (`cod_usuario`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `level_idx` (`level`),
  CONSTRAINT `level` FOREIGN KEY (`level`) REFERENCES `Privilegio` (`level`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `cod_vendor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modificado` datetime NULL DEFAULT NULL ,
  PRIMARY KEY (`cod_vendor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendor`
--

LOCK TABLES `Vendor` WRITE;
/*!40000 ALTER TABLE `Vendor` DISABLE KEYS */;
INSERT INTO `Vendor` VALUES (1,'HUAWEI','2016-05-10 18:26:01','2016-05-10 18:26:01'),(2,'NOKIA','2016-05-10 18:26:01','2016-05-10 18:26:01'),(3,'ZTE','2016-05-10 18:26:01','2016-05-10 18:26:01');
/*!40000 ALTER TABLE `Vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(79,'Can add auth group',27,'add_authgroup'),(80,'Can change auth group',27,'change_authgroup'),(81,'Can delete auth group',27,'delete_authgroup'),(82,'Can add auth group permissions',28,'add_authgrouppermissions'),(83,'Can change auth group permissions',28,'change_authgrouppermissions'),(84,'Can delete auth group permissions',28,'delete_authgrouppermissions'),(85,'Can add auth permission',29,'add_authpermission'),(86,'Can change auth permission',29,'change_authpermission'),(87,'Can delete auth permission',29,'delete_authpermission'),(88,'Can add auth user',30,'add_authuser'),(89,'Can change auth user',30,'change_authuser'),(90,'Can delete auth user',30,'delete_authuser'),(91,'Can add auth user groups',31,'add_authusergroups'),(92,'Can change auth user groups',31,'change_authusergroups'),(93,'Can delete auth user groups',31,'delete_authusergroups'),(94,'Can add auth user user permissions',32,'add_authuseruserpermissions'),(95,'Can change auth user user permissions',32,'change_authuseruserpermissions'),(96,'Can delete auth user user permissions',32,'delete_authuseruserpermissions'),(97,'Can add django admin log',33,'add_djangoadminlog'),(98,'Can change django admin log',33,'change_djangoadminlog'),(99,'Can delete django admin log',33,'delete_djangoadminlog'),(100,'Can add django content type',34,'add_djangocontenttype'),(101,'Can change django content type',34,'change_djangocontenttype'),(102,'Can delete django content type',34,'delete_djangocontenttype'),(103,'Can add django migrations',35,'add_djangomigrations'),(104,'Can change django migrations',35,'change_djangomigrations'),(105,'Can delete django migrations',35,'delete_djangomigrations'),(106,'Can add django session',36,'add_djangosession'),(107,'Can change django session',36,'change_djangosession'),(108,'Can delete django session',36,'delete_djangosession'),(118,'Can add actividade',40,'add_actividade'),(119,'Can change actividade',40,'change_actividade'),(120,'Can delete actividade',40,'delete_actividade'),(121,'Can add aprobacione',41,'add_aprobacione'),(122,'Can change aprobacione',41,'change_aprobacione'),(123,'Can delete aprobacione',41,'delete_aprobacione'),(124,'Can add asignacione',42,'add_asignacione'),(125,'Can change asignacione',42,'change_asignacione'),(126,'Can delete asignacione',42,'delete_asignacione'),(127,'Can add atp',43,'add_atp'),(128,'Can change atp',43,'change_atp'),(129,'Can delete atp',43,'delete_atp'),(130,'Can add ciudade',44,'add_ciudade'),(131,'Can change ciudade',44,'change_ciudade'),(132,'Can delete ciudade',44,'delete_ciudade'),(133,'Can add contratista',45,'add_contratista'),(134,'Can change contratista',45,'change_contratista'),(135,'Can delete contratista',45,'delete_contratista'),(136,'Can add diseno',46,'add_diseno'),(137,'Can change diseno',46,'change_diseno'),(138,'Can delete diseno',46,'delete_diseno'),(139,'Can add entregable',47,'add_entregable'),(140,'Can change entregable',47,'change_entregable'),(141,'Can delete entregable',47,'delete_entregable'),(142,'Can add estacione',48,'add_estacione'),(143,'Can change estacione',48,'change_estacione'),(144,'Can delete estacione',48,'delete_estacione'),(145,'Can add estado',49,'add_estado'),(146,'Can change estado',49,'change_estado'),(147,'Can delete estado',49,'delete_estado'),(148,'Can add factura',50,'add_factura'),(149,'Can change factura',50,'change_factura'),(150,'Can delete factura',50,'delete_factura'),(151,'Can add implementacione',51,'add_implementacione'),(152,'Can change implementacione',51,'change_implementacione'),(153,'Can delete implementacione',51,'delete_implementacione'),(154,'Can add inspeccione',52,'add_inspeccione'),(155,'Can change inspeccione',52,'change_inspeccione'),(156,'Can delete inspeccione',52,'delete_inspeccione'),(157,'Can add operacione',53,'add_operacione'),(158,'Can change operacione',53,'change_operacione'),(159,'Can delete operacione',53,'delete_operacione'),(160,'Can add operadora',54,'add_operadora'),(161,'Can change operadora',54,'change_operadora'),(162,'Can delete operadora',54,'delete_operadora'),(163,'Can add po',55,'add_po'),(164,'Can change po',55,'change_po'),(165,'Can delete po',55,'delete_po'),(166,'Can add privilegio',56,'add_privilegio'),(167,'Can change privilegio',56,'change_privilegio'),(168,'Can delete privilegio',56,'delete_privilegio'),(169,'Can add regione',57,'add_regione'),(170,'Can change regione',57,'change_regione'),(171,'Can delete regione',57,'delete_regione'),(172,'Can add tipo',58,'add_tipo'),(173,'Can change tipo',58,'change_tipo'),(174,'Can delete tipo',58,'delete_tipo'),(175,'Can add tipo factura',59,'add_tipofactura'),(176,'Can change tipo factura',59,'change_tipofactura'),(177,'Can delete tipo factura',59,'delete_tipofactura'),(178,'Can add usuario',60,'add_usuario'),(179,'Can change usuario',60,'change_usuario'),(180,'Can delete usuario',60,'delete_usuario'),(181,'Can add vendor',61,'add_vendor'),(182,'Can change vendor',61,'change_vendor'),(183,'Can delete vendor',61,'delete_vendor'),(184,'Can add tipo po',62,'add_tipopo'),(185,'Can change tipo po',62,'change_tipopo'),(186,'Can delete tipo po',62,'delete_tipopo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$24000$w4qPm58jdmkU$R8qhCAl7StVGB0HMQtOCpYYIGFpuB9wwvcG/XqDnZws=','2016-05-10 15:20:43.889336',1,'jcuevas','','','joe@example.com',1,1,'2016-05-10 15:10:14.664395');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-05-10 15:45:27.293977','1','Actividades object',1,'Added.',NULL,1),(2,'2016-05-10 15:45:42.505597','2','Actividades object',1,'Added.',NULL,1),(3,'2016-05-10 15:46:04.025903','3','Actividades object',1,'Added.',NULL,1),(4,'2016-05-10 15:46:34.425030','4','Actividades object',1,'Added.',NULL,1),(5,'2016-05-10 15:46:52.034929','5','Actividades object',1,'Added.',NULL,1),(6,'2016-05-10 15:50:44.648252','6','Actividades object',1,'Added.',NULL,1),(7,'2016-05-10 15:50:58.998428','7','Actividades object',1,'Added.',NULL,1),(8,'2016-05-10 15:55:59.477332','1','Contratistas object',1,'Added.',NULL,1),(9,'2016-05-10 15:56:39.794291','1','Contratistas object',2,'Changed nombre, creado and modificado.',NULL,1),(10,'2016-05-10 17:15:31.012012','1','Ciudades object',2,'No fields changed.',NULL,1),(11,'2016-05-10 17:24:17.633162','1','Ciudades object',2,'No fields changed.',NULL,1),(12,'2016-05-10 17:25:49.781937','1','Contratistas object',2,'Changed region.',NULL,1),(13,'2016-05-10 18:19:23.390889','1','Operadoras object',1,'Added.',NULL,1),(14,'2016-05-10 18:20:52.284691','1','CNT',2,'Changed creado.',NULL,1),(15,'2016-05-10 18:21:01.181005','1','CNT',2,'Changed modificado.',NULL,1),(16,'2016-05-10 18:21:07.312490','2','CLARO',1,'Added.',NULL,1),(17,'2016-05-10 18:21:14.282380','3','MOVISTAR',1,'Added.',NULL,1),(18,'2016-05-10 18:25:01.923038','1','HUWAEI',1,'Added.',NULL,1),(19,'2016-05-10 18:25:09.549558','2','NOKIA',1,'Added.',NULL,1),(20,'2016-05-10 18:25:19.352247','3','ZTE',1,'Added.',NULL,1),(21,'2016-05-10 18:25:27.895983','1','HUAWEI',2,'Changed nombre.',NULL,1),(22,'2016-05-10 18:42:34.022924','1','Las Aguilas',1,'Added.',NULL,1),(23,'2016-05-10 18:52:58.635506','1','Surveys object',1,'Added.',NULL,1),(24,'2016-05-10 19:07:47.729434','1','1',2,'Changed cod_estado.',NULL,1),(25,'2016-05-10 19:36:11.315070','2','2',1,'Added.',NULL,1),(26,'2016-05-10 19:45:00.622128','1','1',2,'No fields changed.',NULL,1),(27,'2016-05-10 19:46:29.144827','1','1',2,'Changed modificado.',NULL,1),(28,'2016-05-10 19:46:34.473771','1','1',2,'No fields changed.',NULL,1),(29,'2016-05-10 19:47:33.985833','1','1',2,'No fields changed.',NULL,1),(30,'2016-05-10 19:48:28.489512','1','1',2,'No fields changed.',NULL,1),(31,'2016-05-10 19:50:00.055032','1','1',2,'Changed estimada.',NULL,1),(32,'2016-05-10 19:54:48.652817','1','1',2,'No ha cambiado ningún campo.',NULL,1),(33,'2016-05-10 19:54:54.744122','2','2',2,'No ha cambiado ningún campo.',NULL,1),(34,'2016-05-10 19:55:55.499274','1','1',1,'Añadido.',NULL,1),(35,'2016-05-10 20:09:17.967331','1','1',3,'',NULL,1),(36,'2016-05-10 20:09:36.461662','2','2',1,'Añadido.',NULL,1),(37,'2016-05-10 20:27:15.194293','2','2',2,'No ha cambiado ningún campo.',NULL,1),(38,'2016-05-10 20:27:22.469342','2','2',3,'',NULL,1),(39,'2016-05-10 20:27:36.408000','3','3',1,'Añadido.',NULL,1),(40,'2016-05-10 20:42:47.412925','3','3',3,'',NULL,1),(41,'2016-05-10 20:43:11.193776','4','4',1,'Añadido.',NULL,1),(42,'2016-05-10 21:02:33.178392','1','1',1,'Añadido.',NULL,1),(43,'2016-05-10 21:07:44.686939','1','1',3,'',NULL,1),(44,'2016-05-10 21:07:59.910874','2','2',1,'Añadido.',NULL,1),(45,'2016-05-10 21:08:41.297836','8','Estimado TSS',2,'Modificado/a duracion.',NULL,1),(46,'2016-05-10 21:21:18.101370','8','Estimado TSS',2,'Modificado/a duracion.',NULL,1),(47,'2016-05-10 21:22:16.051793','8','Estimado TSS',2,'Modificado/a duracion.',NULL,1),(48,'2016-05-11 16:26:11.659054','1','Pos object',1,'Añadido.',NULL,1),(49,'2016-05-11 16:32:47.631085','4','4',1,'Añadido.',NULL,1),(50,'2016-05-11 16:41:53.647125','1','Las Aguilas',1,'Añadido.',NULL,1),(51,'2016-05-11 17:22:14.799408','4','Las Aguilas',2,'Modificado/a cod_contratista.',NULL,1),(52,'2016-05-11 17:27:38.835654','2','Los Castores',1,'Añadido.',NULL,1),(53,'2016-05-11 17:27:39.121994','3','Los Castores',1,'Añadido.',NULL,1),(54,'2016-05-11 17:29:12.073216','3','Los Castores',3,'',NULL,1),(55,'2016-05-11 17:29:22.887822','2','Los Castores',3,'',NULL,1),(56,'2016-05-11 17:29:36.282560','4','Los Castores',1,'Añadido.',NULL,1),(57,'2016-05-11 17:33:22.749345','2','22334455',1,'Añadido.',NULL,1),(58,'2016-05-11 18:21:44.958711','1','Las Aguilas',2,'Modificado/a cod_station.',55,1),(59,'2016-05-11 18:22:01.631797','4','Las Aguilas',3,'',51,1),(60,'2016-05-11 18:22:17.697310','5','Las Aguilas',1,'Añadido.',51,1),(61,'2016-05-11 18:37:29.397542','1','Las Aguilas',2,'No ha cambiado ningún campo.',52,1),(62,'2016-05-11 18:46:12.169867','1','Las Aguilas',2,'No ha cambiado ningún campo.',52,1),(63,'2016-05-11 18:49:25.793960','1','Las Aguilas',2,'No ha cambiado ningún campo.',52,1),(64,'2016-05-11 18:49:41.745829','5','Las Aguilas',2,'No ha cambiado ningún campo.',51,1),(65,'2016-05-11 18:49:57.087325','4','Los Castores',3,'',55,1),(66,'2016-05-11 18:50:13.337474','4','Los Castores',1,'Añadido.',55,1),(67,'2016-05-11 18:53:47.356287','1','Las Aguilas',2,'No ha cambiado ningún campo.',52,1),(68,'2016-05-11 18:53:58.902526','1','Las Aguilas',2,'No ha cambiado ningún campo.',55,1),(69,'2016-05-11 19:31:14.130266','1','Las Aguilas',2,'Modificado/a num_tipo.',55,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(40,'main','actividade'),(41,'main','aprobacione'),(42,'main','asignacione'),(43,'main','atp'),(27,'main','authgroup'),(28,'main','authgrouppermissions'),(29,'main','authpermission'),(30,'main','authuser'),(31,'main','authusergroups'),(32,'main','authuseruserpermissions'),(44,'main','ciudade'),(45,'main','contratista'),(46,'main','diseno'),(33,'main','djangoadminlog'),(34,'main','djangocontenttype'),(35,'main','djangomigrations'),(36,'main','djangosession'),(47,'main','entregable'),(48,'main','estacione'),(49,'main','estado'),(50,'main','factura'),(51,'main','implementacione'),(52,'main','inspeccione'),(53,'main','operacione'),(54,'main','operadora'),(55,'main','po'),(56,'main','privilegio'),(57,'main','regione'),(58,'main','tipo'),(59,'main','tipofactura'),(62,'main','tipopo'),(60,'main','usuario'),(61,'main','vendor'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-05-10 01:12:03.237647'),(2,'auth','0001_initial','2016-05-10 01:12:24.200492'),(3,'admin','0001_initial','2016-05-10 01:12:27.240277'),(4,'admin','0002_logentry_remove_auto_add','2016-05-10 01:12:27.431371'),(5,'contenttypes','0002_remove_content_type_name','2016-05-10 01:12:29.021162'),(6,'auth','0002_alter_permission_name_max_length','2016-05-10 01:12:30.040047'),(7,'auth','0003_alter_user_email_max_length','2016-05-10 01:12:31.045150'),(8,'auth','0004_alter_user_username_opts','2016-05-10 01:12:31.123292'),(9,'auth','0005_alter_user_last_login_null','2016-05-10 01:12:31.974306'),(10,'auth','0006_require_contenttypes_0002','2016-05-10 01:12:32.030380'),(11,'auth','0007_alter_validators_add_error_messages','2016-05-10 01:12:32.099798'),(12,'sessions','0001_initial','2016-05-10 01:12:32.890330'),(13,'main','0001_initial','2016-05-10 15:10:58.353687'),(14,'main','0002_regiones','2016-05-10 16:05:12.961350'),(15,'main','0003_estados','2016-05-11 16:30:11.110032'),(16,'main','0004_implementaciones','2016-05-11 16:30:11.207812'),(17,'main','0005_atps','2016-05-11 17:11:46.321091'),(18,'main','0006_implementaciones','2016-05-11 17:21:49.271588'),(19,'main','0007_atps','2016-05-11 17:23:39.294517'),(20,'main','0008_pos','2016-05-11 17:32:53.230218');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7i4rj5ga36wns8639dbxib0u5cwjo7gk','MTlkOWVjNmVkZTllZmMzOWY0MDM2NWFmZTRiOGRhNmY3NzhkMjEzZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ3NzdiZmRhYmM1OGU2M2RlODc3ZDFjNmM5YzYzMWY2Zjg3ZDE5ZDYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-05-24 15:20:43.990515');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-12 18:57:50
