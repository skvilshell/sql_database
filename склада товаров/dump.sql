-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jora
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `магазин`
--

DROP TABLE IF EXISTS `магазин`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `магазин` (
  `код` int NOT NULL AUTO_INCREMENT,
  `наименование` varchar(45) DEFAULT NULL,
  `адрес` varchar(100) DEFAULT NULL,
  `телефон` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`код`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `магазин`
--

LOCK TABLES `магазин` WRITE;
/*!40000 ALTER TABLE `магазин` DISABLE KEYS */;
INSERT INTO `магазин` VALUES (1,'Ромашка','Смоленская ул., 18','89706130002'),(2,'Абсолют','Киевская ул., 12А','89540865302'),(3,'Титан','Киевская ул., д. 5','89612594631'),(4,'Лента','Заозёрная ул., 3 к2','89549101785'),(5,'Магнит','Московский пр-т., 79Б','89826631665'),(6,'Магнит','Парфёновская ул., 7к1','89156954525'),(7,'Пятерочка','БЦ \"Ломаная 5\", Ломаная ул., 5А','89935378835'),(8,'Лента','Черниговская ул., 12-а','89451499674'),(9,'Ромашка','Смоленская ул., 18','89706130002'),(10,'Ромашка','Смоленская ул., 18','89706130002');
/*!40000 ALTER TABLE `магазин` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `поставщик`
--

DROP TABLE IF EXISTS `поставщик`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `поставщик` (
  `код` int NOT NULL AUTO_INCREMENT,
  `наименование` varchar(45) DEFAULT NULL,
  `адрес` varchar(100) DEFAULT NULL,
  `телефон` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`код`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `поставщик`
--

LOCK TABLES `поставщик` WRITE;
/*!40000 ALTER TABLE `поставщик` DISABLE KEYS */;
INSERT INTO `поставщик` VALUES (1,'wb','Смоленская ул., 18','89451499674'),(2,'гном','Киевская ул., 12А','89612594631'),(3,'клава','Киевская ул., д. 5','89156954525'),(4,'листок','Заозёрная ул., 3 к2','89935378835'),(5,'карта','Московский пр-т., 79Б','89706130002');
/*!40000 ALTER TABLE `поставщик` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `приход`
--

DROP TABLE IF EXISTS `приход`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `приход` (
  `код` int NOT NULL AUTO_INCREMENT,
  `количество` int DEFAULT NULL,
  `дата` date DEFAULT NULL,
  `поставщик` int NOT NULL,
  `товар` int NOT NULL,
  `сотрудник` int NOT NULL,
  PRIMARY KEY (`код`,`поставщик`,`товар`,`сотрудник`),
  KEY `fk_приход_поставщик_idx` (`поставщик`),
  KEY `fk_приход_товар1_idx` (`товар`),
  KEY `fk_приход_сотрудник1_idx` (`сотрудник`),
  CONSTRAINT `fk_приход_поставщик` FOREIGN KEY (`поставщик`) REFERENCES `поставщик` (`код`),
  CONSTRAINT `fk_приход_сотрудник1` FOREIGN KEY (`сотрудник`) REFERENCES `сотрудник` (`код`),
  CONSTRAINT `fk_приход_товар1` FOREIGN KEY (`товар`) REFERENCES `товар` (`код`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `приход`
--

LOCK TABLES `приход` WRITE;
/*!40000 ALTER TABLE `приход` DISABLE KEYS */;
INSERT INTO `приход` VALUES (1,10,'2022-02-25',1,1,1),(2,12,'2022-03-11',2,2,1),(3,11,'2021-12-31',3,3,2),(4,15,'2022-02-14',4,4,2),(5,35,'2022-01-06',1,5,1),(6,185,'2022-02-28',2,6,1),(7,25,'2022-03-24',1,7,1),(8,1,'2021-12-13',3,8,2),(9,6,'2022-03-08',5,1,1);
/*!40000 ALTER TABLE `приход` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `расход`
--

DROP TABLE IF EXISTS `расход`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `расход` (
  `код` int NOT NULL AUTO_INCREMENT,
  `количество` int DEFAULT NULL,
  `дата` date DEFAULT NULL,
  `наценка` decimal(10,2) DEFAULT NULL,
  `скидка` int DEFAULT NULL,
  `товар` int NOT NULL,
  `сотрудник` int NOT NULL,
  `магазин` int NOT NULL,
  PRIMARY KEY (`код`,`товар`,`сотрудник`,`магазин`),
  KEY `fk_расход_скидка1_idx` (`скидка`),
  KEY `fk_расход_товар1_idx` (`товар`),
  KEY `fk_расход_сотрудник1_idx` (`сотрудник`),
  KEY `fk_расход_магазин1_idx` (`магазин`),
  CONSTRAINT `fk_расход_магазин1` FOREIGN KEY (`магазин`) REFERENCES `магазин` (`код`),
  CONSTRAINT `fk_расход_скидка1` FOREIGN KEY (`скидка`) REFERENCES `скидка` (`код`),
  CONSTRAINT `fk_расход_сотрудник1` FOREIGN KEY (`сотрудник`) REFERENCES `сотрудник` (`код`),
  CONSTRAINT `fk_расход_товар1` FOREIGN KEY (`товар`) REFERENCES `товар` (`код`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `расход`
--

LOCK TABLES `расход` WRITE;
/*!40000 ALTER TABLE `расход` DISABLE KEYS */;
INSERT INTO `расход` VALUES (5,12,'2022-03-05',1.50,1,1,3,1),(6,45,'2022-01-18',1.60,NULL,2,4,1),(7,23,'2022-02-28',2.00,2,3,1,3),(8,45,'2022-01-29',1.70,NULL,4,2,4),(9,12,'2021-12-23',2.10,1,5,5,5),(10,12,'2021-12-22',1.70,3,6,1,6);
/*!40000 ALTER TABLE `расход` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `расход_AFTER_UPDATE` AFTER UPDATE ON `расход` FOR EACH ROW BEGIN
 update `склад` set количество = склад.количество - 
	(new.количество - old.количество)
    where склад.товар = new.товар;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `скидка`
--

DROP TABLE IF EXISTS `скидка`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `скидка` (
  `код` int NOT NULL AUTO_INCREMENT,
  `название` varchar(45) DEFAULT NULL,
  `скидка` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`код`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `скидка`
--

LOCK TABLES `скидка` WRITE;
/*!40000 ALTER TABLE `скидка` DISABLE KEYS */;
INSERT INTO `скидка` VALUES (1,'маленька',0),(2,'средняя',0),(3,'большая',0);
/*!40000 ALTER TABLE `скидка` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `склад`
--

DROP TABLE IF EXISTS `склад`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `склад` (
  `код` int NOT NULL AUTO_INCREMENT,
  `количество` int DEFAULT NULL,
  `дата_изменения` date DEFAULT NULL,
  `товар` int NOT NULL,
  PRIMARY KEY (`код`,`товар`),
  KEY `fk_склад_товар1_idx` (`товар`),
  CONSTRAINT `fk_склад_товар1` FOREIGN KEY (`товар`) REFERENCES `товар` (`код`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `склад`
--

LOCK TABLES `склад` WRITE;
/*!40000 ALTER TABLE `склад` DISABLE KEYS */;
INSERT INTO `склад` VALUES (1,545,'2022-02-05',1),(2,16544,'2022-04-07',2),(3,11654,'2022-04-08',3),(4,1564,'2022-09-08',4),(5,12,'2022-08-09',5),(6,5,'2022-11-11',6),(7,564,'2022-04-10',7),(8,1564,'2022-05-04',8);
/*!40000 ALTER TABLE `склад` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `сотрудник`
--

DROP TABLE IF EXISTS `сотрудник`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `сотрудник` (
  `код` int NOT NULL AUTO_INCREMENT,
  `фамилия` varchar(45) NOT NULL,
  `имя` varchar(45) NOT NULL,
  `отчество` varchar(45) NOT NULL,
  `паспорт` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`код`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `сотрудник`
--

LOCK TABLES `сотрудник` WRITE;
/*!40000 ALTER TABLE `сотрудник` DISABLE KEYS */;
INSERT INTO `сотрудник` VALUES (1,'Поляков ','Роман ','Глебович','8116604778'),(2,'Маслов ','Кассиан ','Дмитрьевич','8116745191'),(3,'Афанасьев ','Мартин ','Дамирович','8116904839'),(4,'Панов ','Любомир ','Якунович','8116681371'),(5,'Фёдорова ','Диодора ','Юлиановна','8116900627'),(6,'Романова ','Биргит ','Федоровна','8116469662'),(7,'Волкова ','Снежана ','Геннадиевна','8116915658'),(8,'Потапова ','Илзе ','Игоревна','8116444652'),(9,'филатов','сергей','николаевич','811675392');
/*!40000 ALTER TABLE `сотрудник` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `товар`
--

DROP TABLE IF EXISTS `товар`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `товар` (
  `код` int NOT NULL AUTO_INCREMENT,
  `наименование` varchar(45) NOT NULL,
  `цена` int NOT NULL,
  PRIMARY KEY (`код`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `товар`
--

LOCK TABLES `товар` WRITE;
/*!40000 ALTER TABLE `товар` DISABLE KEYS */;
INSERT INTO `товар` VALUES (1,'кола',100),(2,'ковер',500),(3,'мышь',1000),(4,'тетрадь',10),(5,'машина',999999),(6,'игрушка',456),(7,'телефон',10000),(8,'утюг',5000),(9,'лампочка',55);
/*!40000 ALTER TABLE `товар` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jora'
--

--
-- Dumping routines for database 'jora'
--
/*!50003 DROP FUNCTION IF EXISTS `наличие_сотрудника` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `наличие_сотрудника`(s varchar(45)) RETURNS varchar(45) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	declare cod int;
    declare a varchar(45);
    set cod = (select код from сотрудник where фамилия = s);
     if(cod is not null) then set a = ("сотрудник существует");
    else set a =("сотрудник несуществует");
    end if;
RETURN a;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `товар_сотрудник` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `товар_сотрудник`(s varchar(45)) RETURNS varchar(45) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
declare a varchar(45);
set a = (select фамилия from сотрудник where код = 
	(select сотрудник from расход where товар = 
    (select код from товар where наименование = s)));

RETURN a;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `ФИО` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `ФИО`(c int) RETURNS varchar(120) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	declare a varchar(120);
	set a = (select concat(фамилия," ",имя," ",отчество) 
    from сотрудник where код = c );
RETURN a;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `количество_сотрудников` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `количество_сотрудников`()
BEGIN
	select count(*)as количество from сотрудник; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `количество_цена_товара` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `количество_цена_товара`(in n varchar(45))
BEGIN
	select *, (select количество from склад where товар = 
    (select код from товар where наименование = n)) as количество
    from товар where наименование = n;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `наличие_товара` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `наличие_товара`(in n varchar(45))
BEGIN
	declare count int;
    set count = (select количество from склад where товар = 
    (select код from товар where наименование = n));
    if(count is not null) then select("в наличии");
    else select("товара нет");
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `новый_сотрудник` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `новый_сотрудник`(in a varchar(45),in b varchar(45),in c varchar(45),in d varchar(45))
BEGIN
	insert into сотрудник (фамилия,имя,отчество,паспорт)
    values (a,b,c,d);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `новый_товар` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `новый_товар`(in n varchar(45), in price int)
BEGIN
	insert into товар(наименование, цена)
    values (n, price);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-11  1:01:08
