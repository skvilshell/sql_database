-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
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
-- Table structure for table `заказы`
--

DROP TABLE IF EXISTS `заказы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заказы` (
  `код_заказа` int NOT NULL,
  `трудоёмкость` int NOT NULL,
  `уровень_качества` int NOT NULL,
  `клиенты_код` int NOT NULL,
  `материалы_код` int NOT NULL,
  `тип_одежды_код` int NOT NULL,
  `размеры_код` int NOT NULL,
  `скидки_код` int NOT NULL,
  PRIMARY KEY (`код_заказа`),
  KEY `fk_заказы_клиенты_idx` (`клиенты_код`),
  KEY `fk_заказы_материалы1_idx` (`материалы_код`),
  KEY `fk_заказы_тип_одежды1_idx` (`тип_одежды_код`),
  KEY `fk_заказы_размеры1_idx` (`размеры_код`),
  KEY `fk_заказы_скидки1_idx` (`скидки_код`),
  CONSTRAINT `fk_заказы_клиенты` FOREIGN KEY (`клиенты_код`) REFERENCES `клиенты` (`код_клиента`),
  CONSTRAINT `fk_заказы_материалы1` FOREIGN KEY (`материалы_код`) REFERENCES `материалы` (`код_материала`),
  CONSTRAINT `fk_заказы_размеры1` FOREIGN KEY (`размеры_код`) REFERENCES `размеры` (`код_размера`),
  CONSTRAINT `fk_заказы_скидки1` FOREIGN KEY (`скидки_код`) REFERENCES `скидки` (`код_скидки`),
  CONSTRAINT `fk_заказы_тип_одежды1` FOREIGN KEY (`тип_одежды_код`) REFERENCES `тип_одежды` (`код_типа`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказы`
--

LOCK TABLES `заказы` WRITE;
/*!40000 ALTER TABLE `заказы` DISABLE KEYS */;
INSERT INTO `заказы` VALUES (1,8,2,1,1,1,2,1),(2,4,4,2,2,2,4,1),(3,5,3,3,3,3,5,4),(4,3,5,4,4,4,3,1),(5,6,1,5,5,5,2,1);
/*!40000 ALTER TABLE `заказы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `клиенты`
--

DROP TABLE IF EXISTS `клиенты`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `клиенты` (
  `код_клиента` int NOT NULL,
  `фамилия` varchar(45) NOT NULL,
  `имя` varchar(45) NOT NULL,
  `отчество` varchar(45) NOT NULL,
  `номер_телефона` varchar(11) NOT NULL,
  PRIMARY KEY (`код_клиента`),
  UNIQUE KEY `номер_телефона_UNIQUE` (`номер_телефона`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `клиенты`
--

LOCK TABLES `клиенты` WRITE;
/*!40000 ALTER TABLE `клиенты` DISABLE KEYS */;
INSERT INTO `клиенты` VALUES (1,'Шубин','Гавриил','Валерьевич','80345345345'),(2,'Савин','Наум','Геннадиевич','89825115121'),(3,'Беляев','Макар','Артемович','89813215455'),(4,'Козлов','Абрам','Феликсович','89121542141'),(5,'Панов','Мартын','Юлианович','89812184121'),(6,'Карпов','Эрнест','Всеволодович','85616546546'),(7,'Вишняков','Борис','Яковлевич','89512152048'),(8,'Шилов','Ермак','Демьянович','89849548451');
/*!40000 ALTER TABLE `клиенты` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `мастера`
--

DROP TABLE IF EXISTS `мастера`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `мастера` (
  `код_мастера` int NOT NULL,
  `фамилия` varchar(45) NOT NULL,
  `имя` varchar(45) NOT NULL,
  `отчество` varchar(45) NOT NULL,
  `уровень_мастера` int NOT NULL,
  `дата_начала` date DEFAULT NULL,
  PRIMARY KEY (`код_мастера`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `мастера`
--

LOCK TABLES `мастера` WRITE;
/*!40000 ALTER TABLE `мастера` DISABLE KEYS */;
INSERT INTO `мастера` VALUES (1,'Пафёнов','Первец','Кабылович',5,'2018-05-15'),(2,'Давыдов','Кирилл','Павлов',4,'2019-01-13'),(3,'Общажников','Павел','Андреев',3,'2018-07-22'),(4,'Павцев','Михаил','Владиславович',2,'2020-11-10'),(5,'Лихачёв','Кондрат','Альбертович',4,'2018-02-26'),(6,'Беляков','Ибрагил','Матвеевич',2,'2019-09-29');
/*!40000 ALTER TABLE `мастера` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `мастера_AFTER_DELETE` AFTER DELETE ON `мастера` FOR EACH ROW BEGIN
	insert into `удаленные мастера` set
    код=old.код, фамилия= old.фамилия, имя=old.имя,
    отчество = old.отчество, уровень_мастера=old.уровень_мастера,
    дата_начала = old.дата_начала, дата_окончания = curdate();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `материалы`
--

DROP TABLE IF EXISTS `материалы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `материалы` (
  `код_материала` int NOT NULL,
  `количество` int NOT NULL,
  `качество` varchar(45) NOT NULL,
  `название` varchar(45) NOT NULL,
  `цена` double NOT NULL,
  PRIMARY KEY (`код_материала`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `материалы`
--

LOCK TABLES `материалы` WRITE;
/*!40000 ALTER TABLE `материалы` DISABLE KEYS */;
INSERT INTO `материалы` VALUES (1,1512,'высший','Брезент',465),(2,221,'Обычный','Габардин',250),(3,325,'высший','Войлок',14),(4,451,'Низкий','Габардин',2445),(5,562,'Низкий','Зефир',144),(6,56,'высший','Креп',651),(7,45,'Обычный','Лён',148),(8,8,'Обычный','Мохер',456);
/*!40000 ALTER TABLE `материалы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `работа`
--

DROP TABLE IF EXISTS `работа`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `работа` (
  `код_работы` int NOT NULL,
  `дата_начала` date NOT NULL,
  `заказы_код` int NOT NULL,
  `мастера_код` int NOT NULL,
  PRIMARY KEY (`код_работы`),
  KEY `fk_работа_заказы1_idx` (`заказы_код`),
  KEY `fk_работа_мастера1_idx` (`мастера_код`),
  CONSTRAINT `fk_работа_заказы1` FOREIGN KEY (`заказы_код`) REFERENCES `заказы` (`код_заказа`),
  CONSTRAINT `fk_работа_мастера1` FOREIGN KEY (`мастера_код`) REFERENCES `мастера` (`код_мастера`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `работа`
--

LOCK TABLES `работа` WRITE;
/*!40000 ALTER TABLE `работа` DISABLE KEYS */;
INSERT INTO `работа` VALUES (1,'2022-02-21',1,2),(2,'2022-09-15',2,1),(3,'2022-09-16',3,2),(4,'2022-10-11',4,3),(5,'2022-10-21',5,4);
/*!40000 ALTER TABLE `работа` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `работа_AFTER_UPDATE` AFTER UPDATE ON `работа` FOR EACH ROW BEGIN
	update работа
	set дата_начала = curdate();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `размеры`
--

DROP TABLE IF EXISTS `размеры`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `размеры` (
  `код_размера` int NOT NULL,
  `размер` int NOT NULL,
  PRIMARY KEY (`код_размера`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `размеры`
--

LOCK TABLES `размеры` WRITE;
/*!40000 ALTER TABLE `размеры` DISABLE KEYS */;
INSERT INTO `размеры` VALUES (1,40),(2,42),(3,44),(4,46),(5,48),(6,50);
/*!40000 ALTER TABLE `размеры` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `скидки`
--

DROP TABLE IF EXISTS `скидки`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `скидки` (
  `код_скидки` int NOT NULL,
  `название` varchar(45) DEFAULT NULL,
  `скидка` double DEFAULT NULL,
  PRIMARY KEY (`код_скидки`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `скидки`
--

LOCK TABLES `скидки` WRITE;
/*!40000 ALTER TABLE `скидки` DISABLE KEYS */;
INSERT INTO `скидки` VALUES (1,'начальная',0.05),(2,'стандарт',0.1),(3,'стандарт+',0.15),(4,'элитная',0.2),(5,'легендарная',0.25);
/*!40000 ALTER TABLE `скидки` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `тип_одежды`
--

DROP TABLE IF EXISTS `тип_одежды`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `тип_одежды` (
  `код_типа` int NOT NULL,
  `тип` varchar(45) NOT NULL,
  `сложность` int NOT NULL,
  PRIMARY KEY (`код_типа`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `тип_одежды`
--

LOCK TABLES `тип_одежды` WRITE;
/*!40000 ALTER TABLE `тип_одежды` DISABLE KEYS */;
INSERT INTO `тип_одежды` VALUES (1,'платье',7),(2,'футболка',3),(3,'худи',5),(4,'платок',1),(5,'штаны',4),(6,'куртка',9);
/*!40000 ALTER TABLE `тип_одежды` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `удаленные мастера`
--

DROP TABLE IF EXISTS `удаленные мастера`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `удаленные мастера` (
  `код` int DEFAULT NULL,
  `фамилия` varchar(45) DEFAULT NULL,
  `имя` varchar(45) DEFAULT NULL,
  `отчество` varchar(45) DEFAULT NULL,
  `уровень_мастера` int DEFAULT NULL,
  `дата_начала` date DEFAULT NULL,
  `дата_окончания` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `удаленные мастера`
--

LOCK TABLES `удаленные мастера` WRITE;
/*!40000 ALTER TABLE `удаленные мастера` DISABLE KEYS */;
INSERT INTO `удаленные мастера` VALUES (7,'шевченко','даниил','андреевич',2,'2022-12-06','2022-12-07');
/*!40000 ALTER TABLE `удаленные мастера` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'lesha'
--

--
-- Dumping routines for database 'lesha'
--
/*!50003 DROP FUNCTION IF EXISTS `день_недели` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `день_недели`(n int) RETURNS varchar(45) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	declare c varchar(45);
    set c = (select dayname(дата_начала) from работа where код_работы = n);
	return c ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `работа_мастера` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `работа_мастера`(n varchar(45)) RETURNS int
    DETERMINISTIC
BEGIN
	declare c int;
    set c = (select count(*) from работа where мастера_код=
		(select код_мастера from мастера where фамилия = n));
	return c ;
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
CREATE DEFINER=`root`@`localhost` FUNCTION `ФИО`(n int) RETURNS varchar(45) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
	declare c varchar(45);
    set c = (select concat(фамилия," ",имя," ",отчество) from клиенты where код_клиента = n);
	return c ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `заказ_клиент` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `заказ_клиент`(
 in s varchar(45),  
 in n varchar(45)
 )
BEGIN
	select count(*) from заказы 
    where клиенты_код = (select код_клиента from клиенты
		where фамилия=s and имя= n);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `изменение_цены` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `изменение_цены`(
	in n double,
    in `код_материала` int
 )
BEGIN
	update материалы 
    set цена = n
    where код_материала = `код_материала`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `новый_мастер` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `новый_мастер`(
 in `код` int, in a varchar(45), in b varchar(45), in c varchar(45),in `уровень` int
 )
BEGIN
	insert into мастера(код_мастера,фамилия,имя,отчество, уровень_мастера, дата_начала)
    value (`код`,a,b,c,`уровень`,curdate());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `новый_тип_одежды` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `новый_тип_одежды`(
 in `код` int, in a varchar(45), in `сложность` int
 )
BEGIN
	insert into тип_одежды(код_типа,тип,сложность)
    value (`код`,a,`сложность`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `сумма_заказов` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `сумма_заказов`(
	in s varchar(45)
 )
BEGIN
	select клиенты.фамилия,
	sum((материалы.цена*тип_одежды.сложность*заказы.уровень_качества*(1-скидки.скидка)))
	as сумма from заказы inner join тип_одежды 
	on заказы.тип_одежды_код = тип_одежды.код_типа inner join материалы
	on заказы.материалы_код = материалы.код_материала inner join скидки 
	on заказы.скидки_код = скидки.код_скидки inner join клиенты 
	on заказы.клиенты_код = клиенты.код_клиента
    where клиенты.фамилия = s group by клиенты.фамилия;
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

-- Dump completed on 2022-12-13 20:56:05
