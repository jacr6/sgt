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
  `estimado` DATETIME  NULL DEFAULT NULL,
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
  `modificado` datetime NULL DEFAULT  NULL,
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
