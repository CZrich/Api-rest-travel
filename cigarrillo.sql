-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: bd_empresa
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `GZM_CIGA_MARCA`
--

DROP TABLE IF EXISTS `GZM_CIGA_MARCA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZM_CIGA_MARCA` (
  `MarCigCod` int NOT NULL,
  `MarCigNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MarCigEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `MarCigFabCod` int DEFAULT NULL,
  PRIMARY KEY (`MarCigCod`),
  KEY `IX_Relationship2` (`MarCigFabCod`),
  CONSTRAINT `Fabrica Rel` FOREIGN KEY (`MarCigFabCod`) REFERENCES `L1M_FABRICANTE` (`FabCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZM_CIGA_MARCA`
--

LOCK TABLES `GZM_CIGA_MARCA` WRITE;
/*!40000 ALTER TABLE `GZM_CIGA_MARCA` DISABLE KEYS */;
INSERT INTO `GZM_CIGA_MARCA` VALUES (1,'Marlboro Red','A',1),(2,'Camel Blue','A',2),(3,'Lucky Strike Original','A',3),(4,'Pall Mall Blue','A',1),(5,'Winston White','A',2),(6,'Chesterfield Red','A',3),(7,'L&M Blue','A',1),(8,'Kent Silver','A',2),(9,'Parliament Aqua Blue','A',3),(10,'Dunhill Fine Cut','A',1),(11,'Benson & Hedges Gold','A',2),(12,'Davidoff Classic','A',3),(13,'Marlboro Gold','A',1),(14,'Camel Black','A',2),(15,'Lucky Strike Silver','A',3),(16,'Philip Morris Blue','A',4),(17,'Rothmans King Size','A',5),(18,'West Red','A',4),(19,'Gauloises Blondes','A',5),(20,'Fortuna Red','A',4),(21,'Gitanes Brunes','A',5),(22,'Pall Mall Red','A',4),(23,'Chesterfield Blue','A',5),(24,'Winston Red','A',4),(25,'L&M Red','A',5);
/*!40000 ALTER TABLE `GZM_CIGA_MARCA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZM_CIGA_TIPO`
--

DROP TABLE IF EXISTS `GZM_CIGA_TIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZM_CIGA_TIPO` (
  `CigTipCod` int NOT NULL,
  `CigTipNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CigTipEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `CigTipFilCod` int DEFAULT NULL,
  PRIMARY KEY (`CigTipCod`),
  KEY `IX_Relationship1` (`CigTipFilCod`),
  CONSTRAINT `Filtro Rel` FOREIGN KEY (`CigTipFilCod`) REFERENCES `GZZ_CIGA_FILTRO` (`CigFilCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZM_CIGA_TIPO`
--

LOCK TABLES `GZM_CIGA_TIPO` WRITE;
/*!40000 ALTER TABLE `GZM_CIGA_TIPO` DISABLE KEYS */;
INSERT INTO `GZM_CIGA_TIPO` VALUES (1,'Cigarro Regular','A',1),(2,'Cigarro Mentolado','A',2),(3,'Cigarro Light','A',3),(4,'Cigarro Ultralight','A',4),(5,'Cigarro 100s','A',5),(6,'Cigarro Slim','A',6),(7,'Cigarro Super Slim','A',7),(8,'Cigarro Black','A',8),(9,'Cigarro Blue','A',9),(10,'Cigarro Silver','A',10),(11,'Cigarro Gold','A',11),(12,'Cigarro Red','A',12),(13,'Cigarro Brown','A',13),(14,'Cigarro White','A',14),(15,'Cigarro Unfiltered','A',15),(16,'Cigarro Clove','A',16),(17,'Cigarro Organic','A',17),(18,'Cigarro Charcoal Filter','A',18),(19,'Cigarro Extra Menthol','A',19),(20,'Cigarro Low Nicotine','A',20),(21,'Cigarro High Nicotine','A',21),(22,'Cigarro Long','A',22),(23,'Cigarro Short','A',23),(24,'Cigarro Flavored','A',24),(25,'Cigarro Premium','A',25);
/*!40000 ALTER TABLE `GZM_CIGA_TIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZM_USUARIO`
--

DROP TABLE IF EXISTS `GZM_USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZM_USUARIO` (
  `UsuCod` int NOT NULL,
  `UsuNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UsuEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `UsuRolCod` int DEFAULT NULL,
  `UsuPas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UsuFabCod` int DEFAULT NULL,
  PRIMARY KEY (`UsuCod`),
  KEY `IX_Relationship17` (`UsuRolCod`),
  KEY `IX_Relationship32` (`UsuFabCod`),
  CONSTRAINT `Relationship17` FOREIGN KEY (`UsuRolCod`) REFERENCES `GZZ_ROL` (`RolCod`),
  CONSTRAINT `Relationship32` FOREIGN KEY (`UsuFabCod`) REFERENCES `L1M_FABRICANTE` (`FabCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZM_USUARIO`
--

LOCK TABLES `GZM_USUARIO` WRITE;
/*!40000 ALTER TABLE `GZM_USUARIO` DISABLE KEYS */;
INSERT INTO `GZM_USUARIO` VALUES (1,'Juan Perez','A',1,'password123',1),(2,'Maria Garcia','A',2,'passw0rd',2),(3,'Carlos Sanchez','A',3,'12345678',3),(4,'Ana Lopez','A',4,'password',4),(5,'Luis Hernandez','A',5,'mypassword',5),(6,'Elena Martinez','A',1,'securepass',6),(7,'Jorge Rodriguez','A',2,'qwerty123',7),(8,'Laura Fernandez','A',3,'abc123',8),(9,'Ricardo Gomez','A',4,'letmein',9),(10,'Paula Diaz','A',5,'admin123',10),(11,'Miguel Torres','A',1,'password1',11),(12,'Sofia Ramirez','A',2,'pass123',12),(13,'David Morales','A',3,'password!',13),(14,'Isabel Cruz','A',4,'myp@ssw0rd',14),(15,'Fernando Reyes','A',5,'admin1',15),(16,'Patricia Ortiz','A',1,'userpass',1),(17,'Jose Ruiz','A',2,'mysecret',2),(18,'Claudia Chavez','A',3,'1234abcd',3),(19,'Manuel Vargas','A',4,'password2',4),(20,'Teresa Medina','A',5,'mypass',5),(21,'Andrea Castro','A',1,'user1234',6),(22,'Francisco Soto','A',2,'password3',7),(23,'Silvia Alvarez','A',3,'pass7890',8),(24,'Oscar Romero','A',4,'mypassword1',9),(25,'Gabriela Vega','A',5,'secure123',10);
/*!40000 ALTER TABLE `GZM_USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZZ_CIGA_CLASE`
--

DROP TABLE IF EXISTS `GZZ_CIGA_CLASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZZ_CIGA_CLASE` (
  `CigClaCod` int NOT NULL,
  `CigClaNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CigClaEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`CigClaCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZZ_CIGA_CLASE`
--

LOCK TABLES `GZZ_CIGA_CLASE` WRITE;
/*!40000 ALTER TABLE `GZZ_CIGA_CLASE` DISABLE KEYS */;
INSERT INTO `GZZ_CIGA_CLASE` VALUES (1,'Regular','A'),(2,'Light','A'),(3,'Menthol','A'),(4,'Ultra Light','A'),(5,'Full Flavor','A'),(6,'Gold','A'),(7,'Silver','A'),(8,'Red','A'),(9,'Blue','A'),(10,'Black','A'),(11,'White','A'),(12,'Slim','A'),(13,'Superslim','A'),(14,'100s','A'),(15,'120s','A'),(16,'Organic','A'),(17,'Non-Filter','A'),(18,'Clove','A'),(19,'Roll-Your-Own','A'),(20,'Pipe Tobacco','A'),(21,'Cigarillos','A'),(22,'Herbal','A'),(23,'Natural','A'),(24,'Low Tar','A'),(25,'Virginia Blend','A');
/*!40000 ALTER TABLE `GZZ_CIGA_CLASE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZZ_CIGA_FILTRO`
--

DROP TABLE IF EXISTS `GZZ_CIGA_FILTRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZZ_CIGA_FILTRO` (
  `CigFilCod` int NOT NULL,
  `CigFilNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CigFilEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`CigFilCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZZ_CIGA_FILTRO`
--

LOCK TABLES `GZZ_CIGA_FILTRO` WRITE;
/*!40000 ALTER TABLE `GZZ_CIGA_FILTRO` DISABLE KEYS */;
INSERT INTO `GZZ_CIGA_FILTRO` VALUES (1,'Standard','A'),(2,'Slim','A'),(3,'Charcoal','A'),(4,'Micro Slim','A'),(5,'Super Slim','A'),(6,'Double Charcoal','A'),(7,'Cork Tip','A'),(8,'Plastic Tip','A'),(9,'Menthol','A'),(10,'Perforated','A'),(11,'Low Resistance','A'),(12,'Ventilated','A'),(13,'Carbon','A'),(14,'Natural Fiber','A'),(15,'Organic','A'),(16,'Activated Carbon','A'),(17,'Extra Long','A'),(18,'Flavor Capsule','A'),(19,'Dual Flavor','A'),(20,'Triple Charcoal','A'),(21,'Non-Perforated','A'),(22,'Reinforced','A'),(23,'Hybrid','A'),(24,'Ultra Slim','A'),(25,'Biodegradable','A');
/*!40000 ALTER TABLE `GZZ_CIGA_FILTRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZZ_CIGA_MENTOLADO`
--

DROP TABLE IF EXISTS `GZZ_CIGA_MENTOLADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZZ_CIGA_MENTOLADO` (
  `CigMenCod` int NOT NULL,
  `CigMenNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CigMenEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`CigMenCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZZ_CIGA_MENTOLADO`
--

LOCK TABLES `GZZ_CIGA_MENTOLADO` WRITE;
/*!40000 ALTER TABLE `GZZ_CIGA_MENTOLADO` DISABLE KEYS */;
INSERT INTO `GZZ_CIGA_MENTOLADO` VALUES (1,'Classic Menthol','A'),(2,'Mint Burst','A'),(3,'Fresh Menthol','A'),(4,'Cool Breeze','A'),(5,'Arctic Ice','A'),(6,'Polar Mint','A'),(7,'Frosted Menthol','A'),(8,'Winter Chill','A'),(9,'Peppermint Twist','A'),(10,'Icy Blast','A'),(11,'Menthol Crystals','A'),(12,'Snow Mint','A'),(13,'Menthol Fusion','A'),(14,'Glacier Mint','A'),(15,'Extreme Menthol','A'),(16,'Spearmint Chill','A'),(17,'Eucalyptus Menthol','A'),(18,'Crisp Mint','A'),(19,'Mint Fresh','A'),(20,'Cold Snap','A'),(21,'Refreshing Menthol','A'),(22,'Mint Menthol','A'),(23,'Deep Freeze','A'),(24,'Pure Menthol','A'),(25,'Herbal Mint','A');
/*!40000 ALTER TABLE `GZZ_CIGA_MENTOLADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZZ_PAISES`
--

DROP TABLE IF EXISTS `GZZ_PAISES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZZ_PAISES` (
  `PaiCod` int NOT NULL,
  `PaiNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PaiEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`PaiCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZZ_PAISES`
--

LOCK TABLES `GZZ_PAISES` WRITE;
/*!40000 ALTER TABLE `GZZ_PAISES` DISABLE KEYS */;
INSERT INTO `GZZ_PAISES` VALUES (1,'Argentina','A'),(2,'Brasil','A'),(3,'Chile','A'),(4,'Colombia','A'),(5,'Perú','A'),(6,'México','A'),(7,'España','A'),(8,'Francia','A'),(9,'Italia','A'),(10,'Alemania','A'),(11,'Reino Unido','A'),(12,'Estados Unidos','A'),(13,'Canadá','A'),(14,'Japón','A'),(15,'China','A'),(16,'India','A'),(17,'Australia','A'),(18,'Sudáfrica','A'),(19,'Rusia','A'),(20,'Egipto','A'),(21,'Nigeria','A'),(22,'Turquía','A'),(23,'Suecia','A'),(24,'Noruega','A'),(25,'Corea del Sur','A');
/*!40000 ALTER TABLE `GZZ_PAISES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZZ_REGION`
--

DROP TABLE IF EXISTS `GZZ_REGION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZZ_REGION` (
  `RegCod` int NOT NULL,
  `RegNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RegEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`RegCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZZ_REGION`
--

LOCK TABLES `GZZ_REGION` WRITE;
/*!40000 ALTER TABLE `GZZ_REGION` DISABLE KEYS */;
INSERT INTO `GZZ_REGION` VALUES (1,'América del Norte','A'),(2,'América Central','A'),(3,'América del Sur','A'),(4,'Europa Occidental','A'),(5,'Europa Oriental','A'),(6,'Asia Oriental','A'),(7,'Asia del Sur','A'),(8,'Sudeste Asiático','A'),(9,'Oceanía','A'),(10,'África del Norte','A'),(11,'África Occidental','A'),(12,'África Central','A'),(13,'África Oriental','A'),(14,'África Meridional','A'),(15,'Caribe','A'),(16,'Oriente Medio','A'),(17,'Europa del Norte','A'),(18,'Europa del Sur','A'),(19,'Asia Central','A'),(20,'Subcontinente Indio','A'),(21,'Islas del Pacífico','A'),(22,'América Anglosajona','A'),(23,'Europa Nórdica','A'),(24,'América Andina','A'),(25,'Eurasia','A');
/*!40000 ALTER TABLE `GZZ_REGION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZZ_ROL`
--

DROP TABLE IF EXISTS `GZZ_ROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZZ_ROL` (
  `RolCod` int NOT NULL,
  `RolNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RolEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`RolCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZZ_ROL`
--

LOCK TABLES `GZZ_ROL` WRITE;
/*!40000 ALTER TABLE `GZZ_ROL` DISABLE KEYS */;
INSERT INTO `GZZ_ROL` VALUES (1,'Administrador','A'),(2,'Supervisor','A'),(3,'Vendedor','A'),(4,'Contador','A'),(5,'Técnico de Soporte','A');
/*!40000 ALTER TABLE `GZZ_ROL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZZ_TABACO`
--

DROP TABLE IF EXISTS `GZZ_TABACO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZZ_TABACO` (
  `TabCod` int NOT NULL,
  `TabColHoj` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TabEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`TabCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZZ_TABACO`
--

LOCK TABLES `GZZ_TABACO` WRITE;
/*!40000 ALTER TABLE `GZZ_TABACO` DISABLE KEYS */;
INSERT INTO `GZZ_TABACO` VALUES (1,'Virginia','A'),(2,'Burley','A'),(3,'Oriental','A'),(4,'Perique','A'),(5,'Latakia','A'),(6,'Criollo','A'),(7,'Kentucky','A'),(8,'Brightleaf','A'),(9,'Dark Fired','A'),(10,'Cavendish','A'),(11,'Barley','A'),(12,'Yenidje','A'),(13,'Maryland','A'),(14,'Connecticut','A'),(15,'Sumatra','A'),(16,'Havana','A'),(17,'Maduro','A'),(18,'Basma','A'),(19,'Black Cavendish','A'),(20,'Dark Air Cured','A'),(21,'Broadleaf','A'),(22,'Gurkha','A'),(23,'Red Virginia','A'),(24,'White Burley','A'),(25,'Dark Virginia','A');
/*!40000 ALTER TABLE `GZZ_TABACO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GZZ_UBICACION_GEOGRAFICA`
--

DROP TABLE IF EXISTS `GZZ_UBICACION_GEOGRAFICA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GZZ_UBICACION_GEOGRAFICA` (
  `UbiGeoCod` int NOT NULL,
  `UbiGeoDepNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UbiGeoProNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UbiGeoEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `UbiGeoDisNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`UbiGeoCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GZZ_UBICACION_GEOGRAFICA`
--

LOCK TABLES `GZZ_UBICACION_GEOGRAFICA` WRITE;
/*!40000 ALTER TABLE `GZZ_UBICACION_GEOGRAFICA` DISABLE KEYS */;
INSERT INTO `GZZ_UBICACION_GEOGRAFICA` VALUES (1,'Lima','Lima','A','Miraflores'),(2,'Arequipa','Arequipa','A','Arequipa'),(3,'La Libertad','Trujillo','A','Trujillo'),(4,'Cusco','Cusco','A','Santo Tomas'),(5,'Piura','Piura','A','Piura'),(6,'Junín','Huancayo','A','Huancayo'),(7,'Puno','Puno','A','Puno'),(8,'Loreto','Iquitos','A','Iquitos'),(9,'Tacna','Tacna','A','Tacna'),(10,'Madre de Dios','Puerto Maldonado','A','Puerto Maldonado'),(11,'San Martín','Moyobamba','A','Moyobamba'),(12,'Amazonas','Chachapoyas','A','Chachapoyas'),(13,'Ancash','Huaraz','A','Huaraz'),(14,'Ucayali','Pucallpa','A','Calleria'),(15,'Lambayeque','Chiclayo','A','Chiclayo'),(16,'Ayacucho','Ayacucho','A','Huanta '),(17,'Huánuco','Huánuco','A','Huánuco'),(18,'Ica','Ica','A','Ica'),(19,'Tumbes','Tumbes','A','Tumbes'),(20,'Moquegua','Moquegua','A','Moquegua');
/*!40000 ALTER TABLE `GZZ_UBICACION_GEOGRAFICA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L1M_FABRICANTE`
--

DROP TABLE IF EXISTS `L1M_FABRICANTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L1M_FABRICANTE` (
  `FabCod` int NOT NULL,
  `FabNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FabDir` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FabEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`FabCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L1M_FABRICANTE`
--

LOCK TABLES `L1M_FABRICANTE` WRITE;
/*!40000 ALTER TABLE `L1M_FABRICANTE` DISABLE KEYS */;
INSERT INTO `L1M_FABRICANTE` VALUES (1,'Compañía de Tabacos S.A.','Calle Principal 123','A'),(2,'Tabacalera Nacional','Avenida Libertad 456','A'),(3,'Tabacos del Sur Ltda.','Carrera 7 # 89-23','A'),(4,'Tabacalera Moderna S.A.','Calle 10 # 34-56','A'),(5,'Fábrica de Cigarrillos El Dorado','Calle 5 # 12-34','A'),(6,'Industria de Tabacos Central','Carrera 12 # 45-67','A'),(7,'Tabacalera Imperial S.A.','Avenida Bolívar 789','A'),(8,'Tabacos del Norte S.A.','Calle 20 # 56-78','A'),(9,'Fábrica de Cigarrillos La Libertad','Carrera 3 # 10-12','A'),(10,'Tabacalera Oriental Ltda.','Calle 15 # 30-45','A'),(11,'Compañía Nacional de Tabacos','Avenida Principal 901','A'),(12,'Fábrica de Cigarrillos del Pacífico','Carrera 8 # 67-89','A'),(13,'Tabacalera del Centro S.A.','Calle 25 # 40-50','A'),(14,'Industria Tabacalera Unida','Avenida Libertadores 123','A'),(15,'Tabacos del Caribe Ltda.','Carrera 6 # 15-20','A');
/*!40000 ALTER TABLE `L1M_FABRICANTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L1M_SEDE`
--

DROP TABLE IF EXISTS `L1M_SEDE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L1M_SEDE` (
  `SedCod` int NOT NULL,
  `SedLoc` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SedEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `SedFabCod` int NOT NULL,
  `SedPaiCod` int DEFAULT NULL,
  PRIMARY KEY (`SedCod`,`SedFabCod`),
  KEY `IX_Relationship3` (`SedFabCod`),
  KEY `IX_Relationship4` (`SedPaiCod`),
  CONSTRAINT `Pais Rel` FOREIGN KEY (`SedPaiCod`) REFERENCES `GZZ_PAISES` (`PaiCod`),
  CONSTRAINT `Sede Rel` FOREIGN KEY (`SedFabCod`) REFERENCES `L1M_FABRICANTE` (`FabCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L1M_SEDE`
--

LOCK TABLES `L1M_SEDE` WRITE;
/*!40000 ALTER TABLE `L1M_SEDE` DISABLE KEYS */;
INSERT INTO `L1M_SEDE` VALUES (1,'Ciudad Capital','A',1,1),(2,'Zona Industrial','A',2,2),(3,'Centro Histórico','A',1,3),(4,'Barrio Comercial','A',3,1),(5,'Distrito Financiero','A',4,2),(6,'Parque Tecnológico','A',5,4),(7,'Zona Residencial','A',6,5),(8,'Puerto Comercial','A',7,6),(9,'Centro Logístico','A',8,7),(10,'Aeropuerto Internacional','A',9,8),(11,'Zona Agrícola','A',10,9),(12,'Parque Empresarial','A',11,10),(13,'Área Metropolitana','A',12,11),(14,'Zona Comercial','A',13,12),(15,'Centro Urbano','A',14,13),(16,'Zona Minera','A',15,14),(17,'Parque Industrial','A',1,15),(18,'Ciudad Universitaria','A',2,16),(19,'Área Rural','A',3,17),(20,'Zona Fronteriza','A',4,18),(21,'Centro de Distribución','A',5,19),(22,'Planta de Producción','A',6,20),(23,'Zona Portuaria','A',7,21),(24,'Distrito Comercial','A',8,22),(25,'Área de Servicio','A',9,23),(26,'Sector Turístico','A',10,24),(27,'Área Industrial','A',11,25);
/*!40000 ALTER TABLE `L1M_SEDE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L1T_COMPRAS_CIGARRILLOS`
--

DROP TABLE IF EXISTS `L1T_COMPRAS_CIGARRILLOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L1T_COMPRAS_CIGARRILLOS` (
  `ComCigCod` int NOT NULL,
  `ComCigCan` int DEFAULT NULL,
  `ComCigEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`ComCigCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L1T_COMPRAS_CIGARRILLOS`
--

LOCK TABLES `L1T_COMPRAS_CIGARRILLOS` WRITE;
/*!40000 ALTER TABLE `L1T_COMPRAS_CIGARRILLOS` DISABLE KEYS */;
INSERT INTO `L1T_COMPRAS_CIGARRILLOS` VALUES (1,500,'A'),(2,300,'A'),(3,700,'A'),(4,450,'A'),(5,650,'A'),(6,550,'A'),(7,400,'A'),(8,600,'A'),(9,750,'A'),(10,800,'A'),(11,350,'A'),(12,900,'A'),(13,1000,'A'),(14,200,'A'),(15,450,'A'),(16,1200,'A'),(17,950,'A'),(18,1100,'A'),(19,250,'A'),(20,300,'A'),(21,1300,'A'),(22,1400,'A'),(23,750,'A'),(24,550,'A'),(25,1600,'A');
/*!40000 ALTER TABLE `L1T_COMPRAS_CIGARRILLOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L1T_PEDIDO_CABECERA`
--

DROP TABLE IF EXISTS `L1T_PEDIDO_CABECERA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L1T_PEDIDO_CABECERA` (
  `PedCabCod` int NOT NULL,
  `PedCabFecAni` int DEFAULT NULL,
  `PedCabFecMes` int DEFAULT NULL,
  `PedCabFecDia` int DEFAULT NULL,
  `PedCabEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `PedCabEstCod` int NOT NULL,
  PRIMARY KEY (`PedCabCod`,`PedCabEstCod`),
  KEY `IX_Relationship18` (`PedCabEstCod`),
  CONSTRAINT `Pedido Rel` FOREIGN KEY (`PedCabEstCod`) REFERENCES `V2M_ESTANCOS` (`EstCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L1T_PEDIDO_CABECERA`
--

LOCK TABLES `L1T_PEDIDO_CABECERA` WRITE;
/*!40000 ALTER TABLE `L1T_PEDIDO_CABECERA` DISABLE KEYS */;
INSERT INTO `L1T_PEDIDO_CABECERA` VALUES (1,2023,7,1,'A',1),(2,2023,7,2,'A',2),(3,2023,7,3,'A',3),(4,2023,7,4,'A',4),(5,2023,7,5,'A',5),(6,2023,7,6,'A',6),(7,2023,7,7,'A',7),(8,2023,7,8,'A',8),(9,2023,7,9,'A',9),(10,2023,7,10,'A',10),(11,2023,7,11,'A',11),(12,2023,7,12,'A',12),(13,2023,7,13,'A',13),(14,2023,7,14,'A',14),(15,2023,7,15,'A',15),(16,2023,7,16,'A',16),(17,2023,7,17,'A',17),(18,2023,7,18,'A',18),(19,2023,7,19,'A',19),(20,2023,7,20,'A',20),(21,2023,7,21,'A',21),(22,2023,7,22,'A',22),(23,2023,7,23,'A',23),(24,2023,7,24,'A',24),(25,2023,7,25,'A',25);
/*!40000 ALTER TABLE `L1T_PEDIDO_CABECERA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L1T_PEDIDO_DETALLE`
--

DROP TABLE IF EXISTS `L1T_PEDIDO_DETALLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L1T_PEDIDO_DETALLE` (
  `PedDetCod` int NOT NULL,
  `PedDetCigCan` int DEFAULT NULL,
  `PedDetEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `PedDetPedCabCod` int NOT NULL,
  `PedDetCigCod` int NOT NULL,
  `PedDetPedCabEstCod` int NOT NULL,
  PRIMARY KEY (`PedDetCod`,`PedDetPedCabCod`,`PedDetCigCod`,`PedDetPedCabEstCod`),
  KEY `IX_Relationship16` (`PedDetPedCabCod`,`PedDetPedCabEstCod`),
  KEY `IX_Relationship17` (`PedDetCigCod`),
  CONSTRAINT `PedDetalle Cigarro Rel` FOREIGN KEY (`PedDetCigCod`) REFERENCES `L3M_CIGARRILLOS` (`CigCod`),
  CONSTRAINT `PedDetalle Rel` FOREIGN KEY (`PedDetPedCabCod`, `PedDetPedCabEstCod`) REFERENCES `L1T_PEDIDO_CABECERA` (`PedCabCod`, `PedCabEstCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L1T_PEDIDO_DETALLE`
--

LOCK TABLES `L1T_PEDIDO_DETALLE` WRITE;
/*!40000 ALTER TABLE `L1T_PEDIDO_DETALLE` DISABLE KEYS */;
INSERT INTO `L1T_PEDIDO_DETALLE` VALUES (1,100,'A',1,1,1),(2,120,'A',2,2,2),(3,150,'A',3,3,3),(4,80,'A',4,4,4),(5,110,'A',5,5,5),(6,130,'A',6,6,6),(7,90,'A',7,7,7),(8,100,'A',8,8,8),(9,140,'A',9,9,9),(10,160,'A',10,10,10),(11,70,'A',11,11,11),(12,95,'A',12,12,12),(13,125,'A',13,13,13),(14,85,'A',14,14,14),(15,105,'A',15,15,15),(16,115,'A',16,16,16),(17,135,'A',17,17,17),(18,150,'A',18,18,18),(19,165,'A',19,19,19),(20,75,'A',20,20,20),(21,85,'A',21,21,21),(22,105,'A',22,22,22),(23,120,'A',23,23,23),(24,130,'A',24,24,24),(25,140,'A',25,25,25);
/*!40000 ALTER TABLE `L1T_PEDIDO_DETALLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L1T_REGISTRO_COMPRAS`
--

DROP TABLE IF EXISTS `L1T_REGISTRO_COMPRAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L1T_REGISTRO_COMPRAS` (
  `RegComCod` int NOT NULL,
  `RegComCigCan` int DEFAULT NULL,
  `RegComCigFecAni` int DEFAULT NULL,
  `RegComCigFecMes` int DEFAULT NULL,
  `RegComCigFecDia` int DEFAULT NULL,
  `RegComCigEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `RegComCigCod` int NOT NULL,
  `RegComEstCod` int NOT NULL,
  `RegComComCigCod` int DEFAULT NULL,
  PRIMARY KEY (`RegComCod`,`RegComEstCod`,`RegComCigCod`),
  KEY `IX_Relationship13` (`RegComCigCod`),
  KEY `IX_Relationship8` (`RegComEstCod`),
  KEY `IX_Relationship31` (`RegComComCigCod`),
  CONSTRAINT `RegCompras Cigarro Rel` FOREIGN KEY (`RegComCigCod`) REFERENCES `L3M_CIGARRILLOS` (`CigCod`),
  CONSTRAINT `Relationship31` FOREIGN KEY (`RegComComCigCod`) REFERENCES `L1T_COMPRAS_CIGARRILLOS` (`ComCigCod`),
  CONSTRAINT `Relationship8` FOREIGN KEY (`RegComEstCod`) REFERENCES `V2M_ESTANCOS` (`EstCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L1T_REGISTRO_COMPRAS`
--

LOCK TABLES `L1T_REGISTRO_COMPRAS` WRITE;
/*!40000 ALTER TABLE `L1T_REGISTRO_COMPRAS` DISABLE KEYS */;
INSERT INTO `L1T_REGISTRO_COMPRAS` VALUES (1,500,2023,7,1,'A',1,1,1),(2,300,2023,7,2,'A',2,2,2),(3,700,2023,7,3,'A',3,3,3),(4,450,2023,7,4,'A',4,4,4),(5,650,2023,7,5,'A',5,5,5),(6,550,2023,7,6,'A',6,6,6),(7,400,2023,7,7,'A',7,7,7),(8,600,2023,7,8,'A',8,8,8),(9,750,2023,7,9,'A',9,9,9),(10,800,2023,7,10,'A',10,10,10),(11,350,2023,7,11,'A',11,11,11),(12,900,2023,7,12,'A',12,12,12),(13,1000,2023,7,13,'A',13,13,13),(14,200,2023,7,14,'A',14,14,14),(15,450,2023,7,15,'A',15,15,15),(16,1200,2023,7,16,'A',16,16,16),(17,950,2023,7,17,'A',17,17,17),(18,1100,2023,7,18,'A',18,18,18),(19,250,2023,7,19,'A',19,19,19),(20,300,2023,7,20,'A',20,20,20),(21,1300,2023,7,21,'A',21,21,21),(22,1400,2023,7,22,'A',22,22,22),(23,750,2023,7,23,'A',23,23,23),(24,550,2023,7,24,'A',24,24,24),(25,1600,2023,7,25,'A',25,25,25);
/*!40000 ALTER TABLE `L1T_REGISTRO_COMPRAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L3M_CIGARRILLOS`
--

DROP TABLE IF EXISTS `L3M_CIGARRILLOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L3M_CIGARRILLOS` (
  `CigCod` int NOT NULL,
  `CigNicCan` double DEFAULT NULL,
  `CigAlqCan` double DEFAULT NULL,
  `CigCanEmb` int DEFAULT NULL,
  `CigCanCar` int DEFAULT NULL,
  `CigEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `CigMenCod` int DEFAULT NULL,
  `CigTabCod` int DEFAULT NULL,
  `CigCigClaCod` int DEFAULT NULL,
  `CigMarCigCod` int DEFAULT NULL,
  `CigTipCod` int DEFAULT NULL,
  PRIMARY KEY (`CigCod`),
  KEY `IX_Relationship5` (`CigMenCod`),
  KEY `IX_Relationship6` (`CigTabCod`),
  KEY `IX_Relationship7` (`CigCigClaCod`),
  KEY `IX_Relationship8` (`CigMarCigCod`),
  KEY `IX_Relationship9` (`CigTipCod`),
  CONSTRAINT `Clase Rel` FOREIGN KEY (`CigCigClaCod`) REFERENCES `GZZ_CIGA_CLASE` (`CigClaCod`),
  CONSTRAINT `Marca Rel` FOREIGN KEY (`CigMarCigCod`) REFERENCES `GZM_CIGA_MARCA` (`MarCigCod`),
  CONSTRAINT `Mentolado Rel` FOREIGN KEY (`CigMenCod`) REFERENCES `GZZ_CIGA_MENTOLADO` (`CigMenCod`),
  CONSTRAINT `Tabaco Rel` FOREIGN KEY (`CigTabCod`) REFERENCES `GZZ_TABACO` (`TabCod`),
  CONSTRAINT `Tipo Cigarrillo Rel` FOREIGN KEY (`CigTipCod`) REFERENCES `GZM_CIGA_TIPO` (`CigTipCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L3M_CIGARRILLOS`
--

LOCK TABLES `L3M_CIGARRILLOS` WRITE;
/*!40000 ALTER TABLE `L3M_CIGARRILLOS` DISABLE KEYS */;
INSERT INTO `L3M_CIGARRILLOS` VALUES (1,0.8,10,20,200,'A',1,1,1,1,1),(2,0.6,8,20,200,'A',2,2,2,2,2),(3,1,12,20,200,'A',3,3,3,3,3),(4,0.7,9,20,200,'A',4,4,4,4,4),(5,0.9,11,20,200,'A',5,5,5,5,5),(6,0.5,7,20,200,'A',6,6,6,6,6),(7,1.1,13,20,200,'A',7,7,7,7,7),(8,0.4,6,20,200,'A',8,8,8,8,8),(9,0.3,5,20,200,'A',9,9,9,9,9),(10,1.2,14,20,200,'A',10,10,10,10,10),(11,0.8,10,20,200,'A',11,11,11,11,11),(12,0.6,8,20,200,'A',12,12,12,12,12),(13,1,12,20,200,'A',13,13,13,13,13),(14,0.7,9,20,200,'A',14,14,14,14,14),(15,0.9,11,20,200,'A',15,15,15,15,15),(16,0.5,7,20,200,'A',16,16,16,16,16),(17,1.1,13,20,200,'A',17,17,17,17,17),(18,0.4,6,20,200,'A',18,18,18,18,18),(19,0.3,5,20,200,'A',19,19,19,19,19),(20,1.2,14,20,200,'A',20,20,20,20,20),(21,0.8,10,20,200,'A',21,21,21,21,21),(22,0.6,8,20,200,'A',22,22,22,22,22),(23,1,12,20,200,'A',23,23,23,23,23),(24,0.7,9,20,200,'A',24,24,24,24,24),(25,0.9,11,20,200,'A',25,25,25,25,25);
/*!40000 ALTER TABLE `L3M_CIGARRILLOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L3T_ALMACEN`
--

DROP TABLE IF EXISTS `L3T_ALMACEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L3T_ALMACEN` (
  `AlmCod` int NOT NULL,
  `AlmCanCig` int DEFAULT NULL,
  `AlmCanMinCig` int DEFAULT NULL,
  `AlmCanMaxCig` int DEFAULT NULL,
  `AlmCanSegCig` int DEFAULT NULL,
  `AlmEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `AlmEstCod` int NOT NULL,
  PRIMARY KEY (`AlmCod`,`AlmEstCod`),
  KEY `IX_Relationship14` (`AlmEstCod`),
  CONSTRAINT `Almacen Rel` FOREIGN KEY (`AlmEstCod`) REFERENCES `V2M_ESTANCOS` (`EstCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L3T_ALMACEN`
--

LOCK TABLES `L3T_ALMACEN` WRITE;
/*!40000 ALTER TABLE `L3T_ALMACEN` DISABLE KEYS */;
INSERT INTO `L3T_ALMACEN` VALUES (1,10000,2000,12000,500,'A',1),(2,8000,1500,10000,400,'A',2),(3,12000,2500,15000,600,'A',3),(4,9000,1800,11000,450,'A',4),(5,11000,2200,13000,550,'A',5),(6,9500,1900,11500,480,'A',6),(7,10500,2100,12500,520,'A',7),(8,11500,2400,14000,580,'A',8),(9,13000,2700,16000,650,'A',9),(10,14000,2900,17000,700,'A',10),(11,8500,1600,10500,420,'A',11),(12,10000,2000,12000,500,'A',12),(13,9500,1900,11500,480,'A',13),(14,10500,2100,12500,520,'A',14),(15,12000,2500,15000,600,'A',15),(16,11000,2200,13000,550,'A',16),(17,11500,2400,14000,580,'A',17),(18,13000,2700,16000,650,'A',18),(19,14000,2900,17000,700,'A',19),(20,9000,1800,11000,450,'A',20),(21,10000,2000,12000,500,'A',21),(22,9500,1900,11500,480,'A',22),(23,10500,2100,12500,520,'A',23),(24,12000,2500,15000,600,'A',24),(25,11000,2200,13000,550,'A',25);
/*!40000 ALTER TABLE `L3T_ALMACEN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `L3T_STOCK`
--

DROP TABLE IF EXISTS `L3T_STOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `L3T_STOCK` (
  `StoCod` int NOT NULL,
  `StoCan` int DEFAULT NULL,
  `StoMinCan` int DEFAULT NULL,
  `StoEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `StoAlmCod` int NOT NULL,
  `StoAlmEstCod` int NOT NULL,
  `StoCigCod` int DEFAULT NULL,
  PRIMARY KEY (`StoCod`,`StoAlmCod`,`StoAlmEstCod`),
  KEY `IX_Relationship15` (`StoAlmCod`,`StoAlmEstCod`),
  KEY `IX_Relationship27` (`StoCigCod`),
  CONSTRAINT `Relationship27` FOREIGN KEY (`StoCigCod`) REFERENCES `L3M_CIGARRILLOS` (`CigCod`),
  CONSTRAINT `Stock Rel` FOREIGN KEY (`StoAlmCod`, `StoAlmEstCod`) REFERENCES `L3T_ALMACEN` (`AlmCod`, `AlmEstCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `L3T_STOCK`
--

LOCK TABLES `L3T_STOCK` WRITE;
/*!40000 ALTER TABLE `L3T_STOCK` DISABLE KEYS */;
INSERT INTO `L3T_STOCK` VALUES (1,800,200,'A',1,1,1),(2,600,150,'A',2,2,2),(3,1000,250,'A',3,3,3),(4,700,180,'A',4,4,4),(5,900,220,'A',5,5,5),(6,750,190,'A',6,6,6),(7,850,210,'A',7,7,7),(8,950,240,'A',8,8,8),(9,1100,270,'A',9,9,9),(10,1200,290,'A',10,10,10),(11,600,160,'A',11,11,11),(12,800,200,'A',12,12,12),(13,750,190,'A',13,13,13),(14,850,210,'A',14,14,14),(15,1000,250,'A',15,15,15),(16,900,220,'A',16,16,16),(17,950,240,'A',17,17,17),(18,1100,270,'A',18,18,18),(19,1200,290,'A',19,19,19),(20,700,180,'A',20,20,20),(21,800,200,'A',21,21,21),(22,750,190,'A',22,22,22),(23,850,210,'A',23,23,23),(24,1000,250,'A',24,24,24),(25,900,220,'A',25,25,25);
/*!40000 ALTER TABLE `L3T_STOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `V2M_ESTANCOS`
--

DROP TABLE IF EXISTS `V2M_ESTANCOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `V2M_ESTANCOS` (
  `EstCod` int NOT NULL,
  `EstNom` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EstNumExp` int DEFAULT NULL,
  `EstEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `EstUbiGeoCod` int DEFAULT NULL,
  `EstFabCod` int DEFAULT NULL,
  `EstNumIdeFis` int DEFAULT NULL,
  `EstRegCod` int DEFAULT NULL,
  `EstUsuCod` int DEFAULT NULL,
  PRIMARY KEY (`EstCod`),
  KEY `IX_Relationship10` (`EstUbiGeoCod`),
  KEY `IX_Relationship11` (`EstFabCod`),
  KEY `IX_Relationship2` (`EstRegCod`),
  KEY `IX_Relationship26` (`EstUsuCod`),
  CONSTRAINT `Fabricante Rel` FOREIGN KEY (`EstFabCod`) REFERENCES `L1M_FABRICANTE` (`FabCod`),
  CONSTRAINT `Relationship2` FOREIGN KEY (`EstRegCod`) REFERENCES `GZZ_REGION` (`RegCod`),
  CONSTRAINT `Relationship26` FOREIGN KEY (`EstUsuCod`) REFERENCES `GZM_USUARIO` (`UsuCod`),
  CONSTRAINT `Ubicacion Rel` FOREIGN KEY (`EstUbiGeoCod`) REFERENCES `GZZ_UBICACION_GEOGRAFICA` (`UbiGeoCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `V2M_ESTANCOS`
--

LOCK TABLES `V2M_ESTANCOS` WRITE;
/*!40000 ALTER TABLE `V2M_ESTANCOS` DISABLE KEYS */;
INSERT INTO `V2M_ESTANCOS` VALUES (1,'Estanco Central',1001,'A',1,1,123456789,1,1),(2,'Estanco Norte',1002,'A',2,2,987654321,2,2),(3,'Estanco Sur',1003,'A',3,3,111111111,3,3),(4,'Estanco Este',1004,'A',4,4,222222222,4,4),(5,'Estanco Oeste',1005,'A',5,5,333333333,5,5),(6,'Estanco Plaza',1006,'A',6,6,444444444,6,6),(7,'Estanco Mercado',1007,'A',7,7,555555555,7,7),(8,'Estanco Estación',1008,'A',8,8,666666666,8,8),(9,'Estanco Avenida',1009,'A',9,9,777777777,9,9),(10,'Estanco Barrio',1010,'A',10,10,888888888,10,10),(11,'Estanco Zona Franca',1011,'A',11,11,999999999,11,11),(12,'Estanco Centro',1012,'A',12,12,123123123,12,12),(13,'Estanco Comercial',1013,'A',13,13,456456456,13,13),(14,'Estanco Industrial',1014,'A',14,14,789789789,14,14),(15,'Estanco Residencial',1015,'A',15,15,101010101,15,15),(16,'Estanco Puerto',1016,'A',16,1,202020202,16,16),(17,'Estanco Aeropuerto',1017,'A',17,2,303030303,17,17),(18,'Estanco Parque',1018,'A',18,3,404040404,18,18),(19,'Estanco Universidad',1019,'A',19,4,505050505,19,19),(20,'Estanco Hospital',1020,'A',20,5,606060606,20,20),(21,'Estanco Teatro',1021,'A',15,6,707070707,21,21),(22,'Estanco Plaza Mayor',1022,'A',14,7,808080808,22,22),(23,'Estanco Monumento',1023,'A',13,8,909090909,23,23),(24,'Estanco Catedral',1024,'A',12,9,111213141,24,24),(25,'Estanco Museo',1025,'A',11,10,212223242,25,25);
/*!40000 ALTER TABLE `V2M_ESTANCOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `V2T_REGISTRO_VENTAS`
--

DROP TABLE IF EXISTS `V2T_REGISTRO_VENTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `V2T_REGISTRO_VENTAS` (
  `RegVenCod` int NOT NULL,
  `RegVenCigCan` int DEFAULT NULL,
  `RegVenFecAni` int DEFAULT NULL,
  `RegVenFecMes` int DEFAULT NULL,
  `RegVenFecDia` int DEFAULT NULL,
  `RegVenEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  `RegVenEstCod` int NOT NULL,
  `RegVenCigCod` int NOT NULL,
  `RegVenVenCigCod` int DEFAULT NULL,
  PRIMARY KEY (`RegVenCod`,`RegVenEstCod`,`RegVenCigCod`),
  KEY `IX_Relationship19` (`RegVenEstCod`),
  KEY `IX_Relationship21` (`RegVenCigCod`),
  KEY `IX_Relationship28` (`RegVenVenCigCod`),
  CONSTRAINT `Registro Ventas Rel` FOREIGN KEY (`RegVenEstCod`) REFERENCES `V2M_ESTANCOS` (`EstCod`),
  CONSTRAINT `RegVentas Cigarro Rel` FOREIGN KEY (`RegVenCigCod`) REFERENCES `L3M_CIGARRILLOS` (`CigCod`),
  CONSTRAINT `Relationship28` FOREIGN KEY (`RegVenVenCigCod`) REFERENCES `V2T_VENTAS_CIGARRILLOS` (`VenCigCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `V2T_REGISTRO_VENTAS`
--

LOCK TABLES `V2T_REGISTRO_VENTAS` WRITE;
/*!40000 ALTER TABLE `V2T_REGISTRO_VENTAS` DISABLE KEYS */;
INSERT INTO `V2T_REGISTRO_VENTAS` VALUES (1,400,2023,7,1,'A',1,1,1),(2,250,2023,7,2,'A',2,2,2),(3,600,2023,7,3,'A',3,3,3),(4,350,2023,7,4,'A',4,4,4),(5,500,2023,7,5,'A',5,5,5),(6,450,2023,7,6,'A',6,6,6),(7,300,2023,7,7,'A',7,7,7),(8,550,2023,7,8,'A',8,8,8),(9,700,2023,7,9,'A',9,9,9),(10,750,2023,7,10,'A',10,10,10),(11,200,2023,7,11,'A',11,11,11),(12,800,2023,7,12,'A',12,12,12),(13,900,2023,7,13,'A',13,13,13),(14,150,2023,7,14,'A',14,14,14),(15,350,2023,7,15,'A',15,15,15),(16,1000,2023,7,16,'A',16,16,16),(17,850,2023,7,17,'A',17,17,17),(18,950,2023,7,18,'A',18,18,18),(19,180,2023,7,19,'A',19,19,19),(20,250,2023,7,20,'A',20,20,20),(21,1100,2023,7,21,'A',21,21,21),(22,1200,2023,7,22,'A',22,22,22),(23,700,2023,7,23,'A',23,23,23),(24,500,2023,7,24,'A',24,24,24),(25,1400,2023,7,25,'A',25,25,25);
/*!40000 ALTER TABLE `V2T_REGISTRO_VENTAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `V2T_VENTAS_CIGARRILLOS`
--

DROP TABLE IF EXISTS `V2T_VENTAS_CIGARRILLOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `V2T_VENTAS_CIGARRILLOS` (
  `VenCigCod` int NOT NULL,
  `VenCigCan` int DEFAULT NULL,
  `VenCigEstReg` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'A',
  PRIMARY KEY (`VenCigCod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `V2T_VENTAS_CIGARRILLOS`
--

LOCK TABLES `V2T_VENTAS_CIGARRILLOS` WRITE;
/*!40000 ALTER TABLE `V2T_VENTAS_CIGARRILLOS` DISABLE KEYS */;
INSERT INTO `V2T_VENTAS_CIGARRILLOS` VALUES (1,400,'A'),(2,250,'A'),(3,600,'A'),(4,350,'A'),(5,500,'A'),(6,450,'A'),(7,300,'A'),(8,550,'A'),(9,700,'A'),(10,750,'A'),(11,200,'A'),(12,800,'A'),(13,900,'A'),(14,150,'A'),(15,350,'A'),(16,1000,'A'),(17,850,'A'),(18,950,'A'),(19,180,'A'),(20,250,'A'),(21,1100,'A'),(22,1200,'A'),(23,700,'A'),(24,500,'A'),(25,1400,'A');
/*!40000 ALTER TABLE `V2T_VENTAS_CIGARRILLOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `VistaComprasPorDia`
--

DROP TABLE IF EXISTS `VistaComprasPorDia`;
/*!50001 DROP VIEW IF EXISTS `VistaComprasPorDia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VistaComprasPorDia` AS SELECT 
 1 AS `CodigoCompra`,
 1 AS `NombreEstanco`,
 1 AS `CodigoCigarrillo`,
 1 AS `CantidadCigarrillosComprados`,
 1 AS `Anio`,
 1 AS `Mes`,
 1 AS `Dia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VistaVentasPorDia`
--

DROP TABLE IF EXISTS `VistaVentasPorDia`;
/*!50001 DROP VIEW IF EXISTS `VistaVentasPorDia`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VistaVentasPorDia` AS SELECT 
 1 AS `CodigoVenta`,
 1 AS `NombreEstanco`,
 1 AS `CodigoCigarrillo`,
 1 AS `CantidadCigarrillosVendidos`,
 1 AS `MarcaCigarrillo`,
 1 AS `Anio`,
 1 AS `Mes`,
 1 AS `Dia`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `VistaComprasPorDia`
--

/*!50001 DROP VIEW IF EXISTS `VistaComprasPorDia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VistaComprasPorDia` AS select `c`.`ComCigCod` AS `CodigoCompra`,`e`.`EstNom` AS `NombreEstanco`,`cig`.`CigCod` AS `CodigoCigarrillo`,sum(`rc`.`RegComCigCan`) AS `CantidadCigarrillosComprados`,`rc`.`RegComCigFecAni` AS `Anio`,`rc`.`RegComCigFecMes` AS `Mes`,`rc`.`RegComCigFecDia` AS `Dia` from (((`L1T_COMPRAS_CIGARRILLOS` `c` join `L1T_REGISTRO_COMPRAS` `rc` on((`c`.`ComCigCod` = `rc`.`RegComComCigCod`))) join `V2M_ESTANCOS` `e` on((`rc`.`RegComEstCod` = `e`.`EstCod`))) join `L3M_CIGARRILLOS` `cig` on((`rc`.`RegComComCigCod` = `cig`.`CigCod`))) where (`rc`.`RegComCigEstReg` = 'A') group by `c`.`ComCigCod`,`e`.`EstNom`,`cig`.`CigCod`,`rc`.`RegComCigFecAni`,`rc`.`RegComCigFecMes`,`rc`.`RegComCigFecDia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VistaVentasPorDia`
--

/*!50001 DROP VIEW IF EXISTS `VistaVentasPorDia`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VistaVentasPorDia` AS select `vc`.`VenCigCod` AS `CodigoVenta`,`e`.`EstNom` AS `NombreEstanco`,`c`.`CigCod` AS `CodigoCigarrillo`,sum(`rv`.`RegVenCigCan`) AS `CantidadCigarrillosVendidos`,`m`.`MarCigNom` AS `MarcaCigarrillo`,`rv`.`RegVenFecAni` AS `Anio`,`rv`.`RegVenFecMes` AS `Mes`,`rv`.`RegVenFecDia` AS `Dia` from ((((`V2T_VENTAS_CIGARRILLOS` `vc` join `V2T_REGISTRO_VENTAS` `rv` on((`vc`.`VenCigCod` = `rv`.`RegVenVenCigCod`))) join `V2M_ESTANCOS` `e` on((`rv`.`RegVenEstCod` = `e`.`EstCod`))) join `L3M_CIGARRILLOS` `c` on((`rv`.`RegVenCigCod` = `c`.`CigCod`))) join `GZM_CIGA_MARCA` `m` on((`c`.`CigMarCigCod` = `m`.`MarCigCod`))) where (`rv`.`RegVenEstReg` = 'A') group by `vc`.`VenCigCod`,`e`.`EstNom`,`c`.`CigCod`,`m`.`MarCigNom`,`rv`.`RegVenFecAni`,`rv`.`RegVenFecMes`,`rv`.`RegVenFecDia` */;
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

-- Dump completed on 2024-08-03 12:47:35
