-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: desapego_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.13-MariaDB

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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderStatusId` int(10) unsigned NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `paymentMethodId` int(10) unsigned NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `orderStatusId` (`orderStatusId`),
  KEY `userId` (`userId`),
  KEY `paymentMethodId` (`paymentMethodId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orderStatusId`) REFERENCES `orderstatus` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentmethods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,1,6,'2021-02-17 10:13:49','2021-02-17 10:13:49'),(2,5,2,2,'2021-02-17 10:13:49','2021-02-17 10:13:49'),(3,5,2,1,'2021-02-17 10:13:49','2021-02-17 10:13:49'),(4,4,1,1,'2021-02-17 10:13:49','2021-02-17 10:13:49'),(5,5,2,4,'2021-02-17 10:13:49','2021-02-17 10:13:49'),(6,4,1,6,'2021-02-17 10:13:49','2021-02-17 10:13:49'),(7,5,1,4,'2021-02-17 10:13:50','2021-02-17 10:13:50'),(8,3,1,5,'2021-02-17 10:13:50','2021-02-17 10:13:50'),(9,3,2,2,'2021-02-17 10:13:50','2021-02-17 10:13:50'),(10,3,2,4,'2021-02-17 10:13:50','2021-02-17 10:13:50'),(11,5,1,5,'2021-02-17 10:13:50','2021-02-17 10:13:50'),(12,3,2,3,'2021-02-17 10:13:50','2021-02-17 10:13:50'),(13,4,2,4,'2021-02-17 10:13:50','2021-02-17 10:13:50'),(14,3,2,4,'2021-02-17 10:13:50','2021-02-17 10:13:50'),(15,3,2,5,'2021-02-17 10:13:50','2021-02-17 10:13:50'),(16,1,2,3,'2021-02-17 10:13:51','2021-02-17 10:13:51'),(17,1,2,5,'2021-02-17 10:13:51','2021-02-17 10:13:51'),(18,5,1,6,'2021-02-17 10:13:51','2021-02-17 10:13:51'),(19,1,2,3,'2021-02-17 10:13:51','2021-02-17 10:13:51'),(20,2,1,5,'2021-02-17 10:13:51','2021-02-17 10:13:51');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderstatus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'on cart'),(2,'paid'),(3,'delivered'),(4,'cancelled by buyer'),(5,'cancelled by seller');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethods`
--

DROP TABLE IF EXISTS `paymentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentmethods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethods`
--

LOCK TABLES `paymentmethods` WRITE;
/*!40000 ALTER TABLE `paymentmethods` DISABLE KEYS */;
INSERT INTO `paymentmethods` VALUES (1,'cash'),(2,'debit'),(3,'credit'),(4,'mercado pago'),(5,'bank transfer'),(6,'bitcoin');
/*!40000 ALTER TABLE `paymentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` int(10) unsigned NOT NULL,
  `productId` int(10) unsigned NOT NULL,
  `itemPrice` int(10) unsigned NOT NULL,
  `quantity` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `product_order_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `product_order_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
INSERT INTO `product_order` VALUES (1,7,28,2273,4),(2,9,49,13056,3),(3,15,25,5254,5),(4,5,33,15232,5),(5,14,26,7760,4),(6,14,15,2145,4),(7,18,39,14472,4),(8,1,29,18288,3),(9,2,37,15336,4),(10,17,1,949,4),(11,14,8,8295,3),(12,18,22,4378,3),(13,3,22,19521,4),(14,19,4,8688,3),(15,16,27,16740,1),(16,18,31,8378,2),(17,8,43,1902,1),(18,16,25,3118,4),(19,17,20,17783,3),(20,4,5,7621,5);
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productcategories`
--

DROP TABLE IF EXISTS `productcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productcategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productcategories`
--

LOCK TABLES `productcategories` WRITE;
/*!40000 ALTER TABLE `productcategories` DISABLE KEYS */;
INSERT INTO `productcategories` VALUES (1,'Alimentos y bebidas'),(2,'Antiguedades'),(3,'Arte, Libreria y Merceria'),(4,'Automotores'),(5,'Bebes'),(6,'Belleza y Cuidado Personal'),(7,'Camaras y Accesorios'),(8,'Celulares y Telefonos'),(9,'Computacion'),(10,'Consolas y Videojuegos'),(11,'Deportes y Fitness'),(12,'Electrodomesticos'),(13,'Electronica, Audio y Video'),(14,'Herramientas y Construccion'),(15,'Hogar, Muebles y Jardin'),(16,'Instrumentos Musicales'),(17,'Joyas y Relojes'),(18,'Juegos y Jueguetes'),(19,'Libros, Revistas y Comics'),(20,'Musica, Peliculas y Series'),(21,'Ropa y Accesorios'),(22,'Souvenirs, Cotillon y Fiestas'),(23,'Varios');
/*!40000 ALTER TABLE `productcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` int(10) unsigned NOT NULL,
  `description` varchar(1500) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `stock` smallint(5) unsigned NOT NULL,
  `isBanned` tinyint(3) unsigned NOT NULL,
  `productCategoryId` int(10) unsigned NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `productCategoryId` (`productCategoryId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productCategoryId`) REFERENCES `productcategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Versatainer Nc - 8288',19090,'sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum','Mhlume','AtNibh.png',2,0,7,'2021-02-17 10:13:42','2021-02-17 10:13:42'),(2,'Ham - Cooked Bayonne Tinned',10442,'vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla','Mianduhe','JustoAliquam.jpeg',8,1,22,'2021-02-17 10:13:42','2021-02-17 10:13:42'),(3,'Cheese - Brie, Cups 125g',8077,'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at','Tiarei','NonInterdum.tiff',6,1,15,'2021-02-17 10:13:42','2021-02-17 10:13:42'),(4,'Crab Brie In Phyllo',19364,'in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi','CÃ¡chira','Amet.jpeg',4,0,22,'2021-02-17 10:13:42','2021-02-17 10:13:42'),(5,'Propel Sport Drink',4493,'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent','Xinqiaohe','IntegerTinciduntAnte.png',6,1,7,'2021-02-17 10:13:42','2021-02-17 10:13:42'),(6,'Longos - Assorted Sandwich',11975,'gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec','Almelo','VelEnimSit.png',5,1,17,'2021-02-17 10:13:42','2021-02-17 10:13:42'),(7,'Bread - Malt',18207,'placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut','Kut Chap','LuctusTincidunt.png',10,0,14,'2021-02-17 10:13:42','2021-02-17 10:13:42'),(8,'Soup - French Onion',13398,'penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec','Arlington','Mauris.jpeg',10,0,1,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(9,'Crab - Dungeness, Whole, live',1897,'sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius','Xianzong','ConvallisDuisConsequat.jpeg',8,1,17,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(10,'Tequila - Sauza Silver',11586,'ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed','Guanting','Sit.png',2,0,7,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(11,'Truffle - Whole Black Peeled',18730,'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec','Krajan','TinciduntIn.tiff',3,1,9,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(12,'Cabbage - Nappa',16397,'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst','Arroyo Seco','EtiamFaucibusCursus.tiff',10,1,1,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(13,'Wine - Carmenere Casillero Del',2912,'in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed','Fenghuang','MorbiNonQuam.png',10,1,22,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(14,'Buffalo - Tenderloin',3165,'gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis','Notranje Gorice','IdLuctus.jpeg',6,1,10,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(15,'Wine - Ej Gallo Sierra Valley',2296,'est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum','Bindura','Ridiculus.jpeg',7,1,11,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(16,'Beef - Flank Steak',18727,'et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor','Nalinggou','Tempor.gif',10,0,1,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(17,'Turkey - Whole, Fresh',18605,'turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi','Bordeaux','PurusAliquetAt.gif',9,1,14,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(18,'Wine - Cave Springs Dry Riesling',6140,'ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium','Kolomak','QuisquePortaVolutpat.tiff',3,1,8,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(19,'Napkin - Dinner, White',9719,'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus','Presidente EpitÃ¡cio','LiberoRutrumAc.gif',3,1,13,'2021-02-17 10:13:43','2021-02-17 10:13:43'),(20,'Spice - Pepper Portions',661,'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in','Staraya Mayna','QuamSapienVarius.jpeg',1,1,10,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(21,'Hinge W Undercut',19253,'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et','Karasuk','APede.gif',5,0,20,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(22,'Brandy Cherry - Mcguinness',5772,'vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo','Longhe','ImperdietNullamOrci.jpeg',5,0,19,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(23,'Beer - Molson Excel',6677,'eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget','Lingyang','Risus.tiff',6,0,12,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(24,'Tilapia - Fillets',16362,'augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in','Zaqatala','Id.gif',4,1,7,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(25,'Muffin Carrot - Individual',10083,'augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales','Fenghuang','QuisqueId.tiff',6,1,18,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(26,'Sword Pick Asst',18035,'non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede','Kuâ€˜aydinah','EratVolutpatIn.tiff',1,1,10,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(27,'Bread Roll Foccacia',14189,'integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean','Bozoum','ParturientMontes.tiff',3,1,8,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(28,'Truffle Cups Green',1673,'donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante','Karma','AdipiscingElitProin.gif',6,1,22,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(29,'Pepsi - 600ml',10536,'sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam','Tuy PhÆ°Æ¡Ì?c','VestibulumQuamSapien.tiff',5,0,8,'2021-02-17 10:13:44','2021-02-17 10:13:44'),(30,'Lid - 0090 Clear',15499,'eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam','Jiamiao','EtiamFaucibusCursus.jpeg',5,0,9,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(31,'Cheese - Wine',4589,'eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis','Argivai','Mauris.png',9,1,22,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(32,'Artichokes - Knobless, White',3276,'nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est','Placer','SodalesSed.jpeg',5,0,20,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(33,'Gherkin - Sour',11212,'nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam','Frutillar','NullaSedVel.png',5,1,7,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(34,'Pie Shell - 5',8571,'consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum','Karangsari','SitAmet.gif',3,1,13,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(35,'Spice - Peppercorn Melange',16309,'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien','Linamon','DapibusDuis.tiff',1,1,23,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(36,'Tarragon - Primerba, Paste',8240,'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue','Layog','Massa.tiff',4,1,8,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(37,'Container Clear 8 Oz',5211,'morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat','Bentar','LobortisSapien.png',6,0,16,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(38,'Canadian Emmenthal',17361,'orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac','Sibulan','Pede.gif',3,0,14,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(39,'Anchovy In Oil',12829,'volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio','Al á¸¨arÄ?k','Dapibus.tiff',9,1,23,'2021-02-17 10:13:45','2021-02-17 10:13:45'),(40,'Beer - Guiness',12938,'lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl','Ngedhusuba','Condimentum.tiff',1,1,5,'2021-02-17 10:13:46','2021-02-17 10:13:46'),(41,'Onions - Cippolini',12613,'dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti','Gunungangka','CurabiturInLibero.gif',1,1,1,'2021-02-17 10:13:46','2021-02-17 10:13:46'),(42,'Tomatoes - Hot House',1337,'congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum','Santo Amaro','Sed.tiff',2,0,18,'2021-02-17 10:13:46','2021-02-17 10:13:46'),(43,'Straws - Cocktale',2620,'amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque','Qobu','Lectus.jpeg',8,1,5,'2021-02-17 10:13:46','2021-02-17 10:13:46'),(44,'Nantucket Orange Juice',7304,'praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede','Tais','Ultrices.tiff',5,1,1,'2021-02-17 10:13:46','2021-02-17 10:13:46'),(45,'Buffalo - Striploin',9126,'nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum','Azurva','Odio.png',9,0,2,'2021-02-17 10:13:46','2021-02-17 10:13:46'),(46,'Beef - Cooked, Corned',596,'suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate','Hamilton','Lobortis.png',6,0,2,'2021-02-17 10:13:47','2021-02-17 10:13:47'),(47,'Grapes - Green',528,'in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam','Buliran','VestibulumSedMagna.gif',4,1,1,'2021-02-17 10:13:47','2021-02-17 10:13:47'),(48,'Apple - Royal Gala',12162,'orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed','Mersa Matruh','MagnaBibendum.tiff',4,0,8,'2021-02-17 10:13:47','2021-02-17 10:13:47'),(49,'Kaffir Lime Leaves',18283,'accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet','Resplendor','MiInteger.gif',8,0,10,'2021-02-17 10:13:47','2021-02-17 10:13:47');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercategories`
--

DROP TABLE IF EXISTS `usercategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usercategories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercategories`
--

LOCK TABLES `usercategories` WRITE;
/*!40000 ALTER TABLE `usercategories` DISABLE KEYS */;
INSERT INTO `usercategories` VALUES (1,'admin'),(2,'customer');
/*!40000 ALTER TABLE `usercategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(30) NOT NULL,
  `street` varchar(50) NOT NULL,
  `houseNumber` smallint(5) unsigned NOT NULL,
  `floor` varchar(2) DEFAULT NULL,
  `apartment` varchar(3) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `userCategoryId` int(10) unsigned NOT NULL,
  `isBanned` tinyint(3) unsigned NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `userCategoryId` (`userCategoryId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`userCategoryId`) REFERENCES `usercategories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Giana','Maliphant','gmaliphant0@ebay.com','NVHkryudE','Saint Louis','Missouri','Park Meadow',6404,'6','A','314-384-3956','NuncProinAt.tiff',1,0,'2021-02-17 10:13:40','2021-02-17 10:13:40'),(2,'Delmore','Hansana','dhansana1@last.fm','WpO1GGrq','San Antonio','Texas','Cordelia',380,'20','B','210-562-4264','Odio.tiff',2,0,'2021-02-17 10:13:40','2021-02-17 10:13:40'),(3,'Reinhard','Wederell','rwederell2@jigsy.com','JryhJlA','New Castle','Pennsylvania','Village',14716,'10','C','724-376-9424','Aenean.tiff',2,1,'2021-02-17 10:13:40','2021-02-17 10:13:40'),(4,'Heath','Tincombe','htincombe3@engadget.com','4gBEvlI9mxNd','Arlington','Virginia','Del Mar',7494,'12','D','703-530-9202','AliquetAtFeugiat.tiff',2,0,'2021-02-17 10:13:40','2021-02-17 10:13:40'),(5,'Virgilio','Leverentz','vleverentz4@topsy.com','kKVimU','Savannah','Georgia','Dixon',2,'14','A','912-398-3613','Nunc.jpeg',1,1,'2021-02-17 10:13:40','2021-02-17 10:13:40'),(6,'Nona','Fladgate','nfladgate5@opensource.org','x8k8asZ','Laredo','Texas','Warner',5120,NULL,NULL,'956-298-2610','CurabiturConvallisDuis.tiff',1,1,'2021-02-17 10:13:40','2021-02-17 10:13:40'),(7,'Findlay','Stookes','fstookes6@wisc.edu','hzdKM33Iv7','Pasadena','California','Farragut',23,'8','F','626-775-4300','LoremIntegerTincidunt.gif',2,1,'2021-02-17 10:13:40','2021-02-17 10:13:40'),(8,'Skelly','Filippov','sfilippov7@diigo.com','O4vUMx2i','Grand Rapids','Michigan','Oak',71,'14','B','616-949-3774','ConsequatLectus.tiff',1,1,'2021-02-17 10:13:40','2021-02-17 10:13:40'),(9,'Sheila-kathryn','Lippini','slippini8@cbc.ca','gDm3B5','Phoenix','Arizona','Gerald',552,'7','C','602-151-2611','Velit.tiff',1,1,'2021-02-17 10:13:40','2021-02-17 10:13:40'),(10,'Sauveur','Gadie','sgadie9@newsvine.com','fplQHB3rdzC6','Austin','Texas','5th',8,'1','A','512-179-6710','Lobortis.jpeg',1,1,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(11,'Ivory','Croser','icrosera@vk.com','pBySWRoXRJ','Worcester','Massachusetts','Dorton',48842,NULL,NULL,'508-613-2107','AmetSapienDignissim.jpeg',1,1,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(12,'Jan','Brownell','jbrownellb@lulu.com','X4jXuK08F','Orlando','Florida','Di Loreto',7,'1','D','321-409-7996','AmetNuncViverra.tiff',2,1,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(13,'Kippy','Pettingall','kpettingallc@is.gd','VWT4xqejQ','Louisville','Kentucky','Sutteridge',9569,'15','B','502-584-1046','PotentiInEleifend.jpeg',1,0,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(14,'Georgine','Gilhouley','ggilhouleyd@woothemes.com','bjEq6Voc3nXq','Jefferson City','Missouri','Sugar',7,'11','C','573-253-1721','NibhFusceLacus.jpeg',2,0,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(15,'Waverley','Warlawe','wwarlawee@opensource.org','njdPaxCPV','Greenville','South Carolina','Menomonie',697,NULL,NULL,'864-493-9940','UtDolor.tiff',1,0,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(16,'Kenneth','Pilsbury','kpilsburyf@soundcloud.com','nr2tyXf','Aurora','Colorado','Bultman',25,'11','B','303-616-3160','Nulla.tiff',1,1,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(17,'Merlina','Goggen','mgoggeng@wunderground.com','6rylqA1gqvAF','Charleston','West Virginia','Donald',421,'15','D','304-676-2051','AnteIpsum.jpeg',1,0,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(18,'Jeannie','Geertz','jgeertzh@de.vu','vWjqisPhg4','Boynton Beach','Florida','Shopko',82,'4','B','561-930-9190','InFaucibusOrci.jpeg',1,0,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(19,'Arman','Leneve','alenevei@scribd.com','QCqGzR','Lexington','Kentucky','Colorado',42110,'12','A','859-210-2078','Morbi.jpeg',1,0,'2021-02-17 10:13:41','2021-02-17 10:13:41'),(20,'Caroline','Harkins','charkinsj@51.la','kusSXfB0h','South Bend','Indiana','Parkside',20,'12','C','574-875-6366','QuisAugueLuctus.tiff',1,1,'2021-02-17 10:13:41','2021-02-17 10:13:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'desapego_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-17 10:14:18
