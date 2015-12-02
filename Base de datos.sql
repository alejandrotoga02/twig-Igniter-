-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: comercio
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen` (
  `idAlmacen` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAlmacen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articulos`
--

DROP TABLE IF EXISTS `articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articulos` (
  `ARTICULO_ID` int(11) NOT NULL,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `CLAVE` varchar(45) DEFAULT NULL,
  `PRECIODELISTA` float DEFAULT NULL,
  `EXISTENCIA` int(11) DEFAULT NULL,
  `FECHA_HORA_ULT_MODIF` date DEFAULT NULL,
  `LINEA_ARTICULO_ID` int(11) DEFAULT NULL,
  `IMAGEN` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ARTICULO_ID`),
  UNIQUE KEY `CLAVE_UNIQUE` (`CLAVE`),
  KEY `articulo_linea_idx` (`LINEA_ARTICULO_ID`),
  CONSTRAINT `articulo_linea` FOREIGN KEY (`LINEA_ARTICULO_ID`) REFERENCES `lineas_articulos` (`LINEA_ARTICULO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulos`
--

LOCK TABLES `articulos` WRITE;
/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` VALUES (5073,'Chair Swing','QAAPII',236.99,0,NULL,1320,'http://demo.harnishdesign.net/opencart/bigshop/image/cache/data/demo/samsung_tab_1-152x152.jpg'),(5079,'Casual Saddle Shoes','QARO',119.5,0,NULL,1322,'http://demo.harnishdesign.net/opencart/bigshop/image/cache/data/demo/hp_1-152x152.jpg'),(5085,'Bag Lady','QCLO',119.5,0,NULL,1323,'http://demo.harnishdesign.net/opencart/bigshop/image/cache/data/demo/bag-152x152.jpg'),(5086,'Eyewear Eyeglasses','EEY0',119.5,0,NULL,1323,'http://demo.harnishdesign.net/opencart/bigshop/image/cache/data/demo/ipod_touch_1-152x152.jpg'),(5087,'Nail Polish','NAPO',119.5,0,NULL,1322,'http://demo.harnishdesign.net/opencart/bigshop/image/cache/data/demo/ipod_shuffle_1-152x152.jpg'),(5088,'Sports Watch Band',NULL,0,5,NULL,1320,'http://demo.harnishdesign.net/opencart/bigshop/image/cache/data/demo/samsung_syncmaster_941bw-152x152.jpg');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad` (
  `idCiudad` int(11) NOT NULL AUTO_INCREMENT,
  `Ciudad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Colima'),(2,'Villa de Alvarez');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `zonacliente` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `ciudad_id` int(11) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `poblacion` varchar(45) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `rfc` varchar(45) DEFAULT NULL,
  `notas` varchar(90) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `estado_cliente_idx` (`estado_id`),
  KEY `ciudad_cliente_idx` (`ciudad_id`),
  CONSTRAINT `ciudad_cliente` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad` (`idCiudad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `estado_cliente` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`idEstado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (3,'natanahel','Felipe Natanahel',1,1,1,'Condor',85,'Santa ','Colima','','3121628989','28037','felipe_lopez13@hotmail.com','','algo','234'),(7,'felipe','dfsdf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'neocid.natanahel@gmail.com',NULL,NULL,'234');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `Estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Colima');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `fav`
--

DROP TABLE IF EXISTS `fav`;
/*!50001 DROP VIEW IF EXISTS `fav`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `fav` (
  `idmarcador` tinyint NOT NULL,
  `Cliente` tinyint NOT NULL,
  `Producto` tinyint NOT NULL,
  `Nombre` tinyint NOT NULL,
  `Imagen` tinyint NOT NULL,
  `Precio` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `forma_pago`
--

DROP TABLE IF EXISTS `forma_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forma_pago` (
  `idForma_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `FormaDePago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idForma_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pago`
--

LOCK TABLES `forma_pago` WRITE;
/*!40000 ALTER TABLE `forma_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `forma_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos_articulos`
--

DROP TABLE IF EXISTS `grupos_articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupos_articulos` (
  `idGRUPOS_ARTICULOS` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `FECHA_HORA_ULT_MODIF` date DEFAULT NULL,
  PRIMARY KEY (`idGRUPOS_ARTICULOS`)
) ENGINE=InnoDB AUTO_INCREMENT=1301 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_articulos`
--

LOCK TABLES `grupos_articulos` WRITE;
/*!40000 ALTER TABLE `grupos_articulos` DISABLE KEYS */;
INSERT INTO `grupos_articulos` VALUES (1299,'MUFRANCE',NULL),(1300,'BOLSAS',NULL);
/*!40000 ALTER TABLE `grupos_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas_articulos`
--

DROP TABLE IF EXISTS `lineas_articulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineas_articulos` (
  `LINEA_ARTICULO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(45) DEFAULT NULL,
  `GRUPO_LINEA_ID` int(11) DEFAULT NULL,
  `FECHA_HORA_ULT_MODIF` date DEFAULT NULL,
  PRIMARY KEY (`LINEA_ARTICULO_ID`),
  KEY `Lineas-Grupos_idx` (`GRUPO_LINEA_ID`),
  CONSTRAINT `Lineas-Grupos` FOREIGN KEY (`GRUPO_LINEA_ID`) REFERENCES `grupos_articulos` (`idGRUPOS_ARTICULOS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1324 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas_articulos`
--

LOCK TABLES `lineas_articulos` WRITE;
/*!40000 ALTER TABLE `lineas_articulos` DISABLE KEYS */;
INSERT INTO `lineas_articulos` VALUES (1320,'CUCHARAS MUFRANCE',1299,NULL),(1321,'TENEDORES MUFRANCE',1299,NULL),(1322,'PLANA REYMA',1300,NULL),(1323,'BOLSA POLIPROPILENO',1300,NULL);
/*!40000 ALTER TABLE `lineas_articulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcador`
--

DROP TABLE IF EXISTS `marcador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcador` (
  `idmarcador` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmarcador`),
  KEY `marcador_cliente_idx` (`idcliente`),
  KEY `marcador_articulo_idx` (`idproducto`),
  CONSTRAINT `marcador_articulo` FOREIGN KEY (`idproducto`) REFERENCES `articulos` (`ARTICULO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `marcador_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcador`
--

LOCK TABLES `marcador` WRITE;
/*!40000 ALTER TABLE `marcador` DISABLE KEYS */;
INSERT INTO `marcador` VALUES (3,3,5086),(4,7,5073),(6,3,5088);
/*!40000 ALTER TABLE `marcador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosdetalle`
--

DROP TABLE IF EXISTS `pedidosdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidosdetalle` (
  `DOCTO_ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT,
  `CLAVE_ART` varchar(45) DEFAULT NULL,
  `ARTICULO_ID` int(11) DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `TOTAL` float DEFAULT NULL,
  `POSICION` varchar(45) DEFAULT NULL,
  `TIPO_DOCUMENTO` varchar(45) DEFAULT NULL,
  `NOMBREU` varchar(45) DEFAULT NULL,
  `DESCUENTO` float DEFAULT NULL,
  `OBSERVACIONES` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DOCTO_ID_PEDIDO`),
  KEY `pedido_articulo_idx` (`CLAVE_ART`,`ARTICULO_ID`),
  CONSTRAINT `pedido_articulo` FOREIGN KEY (`CLAVE_ART`, `ARTICULO_ID`) REFERENCES `articulos` (`CLAVE`, `ARTICULO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosdetalle`
--

LOCK TABLES `pedidosdetalle` WRITE;
/*!40000 ALTER TABLE `pedidosdetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidosdetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidosencabezado`
--

DROP TABLE IF EXISTS `pedidosencabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidosencabezado` (
  `idPedidosEncabezado` int(11) NOT NULL AUTO_INCREMENT,
  `clave_cliente` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `NOMBREU` varchar(45) DEFAULT NULL,
  `ALMACEN_ID` int(11) DEFAULT NULL,
  `ANTICIPO` float DEFAULT NULL,
  `TIPO_DOCUMENTO` varchar(45) DEFAULT NULL,
  `FORMA_COBRO_ID` int(11) DEFAULT NULL,
  `FACTURA` varchar(45) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPedidosEncabezado`),
  KEY `pedido_idx` (`ALMACEN_ID`),
  KEY `pedido_pago_idx` (`FORMA_COBRO_ID`),
  KEY `pedido_cliente_idx` (`cliente_id`),
  KEY `pedido_cliente_idx1` (`cliente_id`,`clave_cliente`),
  KEY `pedido_cliente_idx2` (`clave_cliente`),
  CONSTRAINT `pedido_almacen` FOREIGN KEY (`ALMACEN_ID`) REFERENCES `almacen` (`idAlmacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pedido_cliente` FOREIGN KEY (`clave_cliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pedido_pago` FOREIGN KEY (`FORMA_COBRO_ID`) REFERENCES `forma_pago` (`idForma_Pago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidosencabezado`
--

LOCK TABLES `pedidosencabezado` WRITE;
/*!40000 ALTER TABLE `pedidosencabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidosencabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `fav`
--

/*!50001 DROP TABLE IF EXISTS `fav`*/;
/*!50001 DROP VIEW IF EXISTS `fav`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fav` AS (select `m`.`idmarcador` AS `idmarcador`,`m`.`idcliente` AS `Cliente`,`m`.`idproducto` AS `Producto`,`a`.`NOMBRE` AS `Nombre`,`a`.`IMAGEN` AS `Imagen`,`a`.`PRECIODELISTA` AS `Precio` from (`marcador` `m` join `articulos` `a` on((`a`.`ARTICULO_ID` = `m`.`idproducto`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-02 16:05:45
