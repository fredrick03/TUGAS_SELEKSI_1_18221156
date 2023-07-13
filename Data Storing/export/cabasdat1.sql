-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cabasdat1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cabasdat1` ;
-- -----------------------------------------------------
-- Schema cabasdat1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cabasdat1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cabasdat1` ;

-- -----------------------------------------------------
-- Table `cabasdat1`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`customer` (
  `id_customer` INT NOT NULL,
  `first_name` VARCHAR(15) NOT NULL,
  `last_name` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `phone_number` VARCHAR(12) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  PRIMARY KEY (`id_customer`),
  CONSTRAINT `chk_first_name` CHECK(LENGTH(`first_name`) >= 3),
  CONSTRAINT `chk_last_name` CHECK(LENGTH(`last_name`) >= 3),
  CONSTRAINT `chk_password` CHECK(LENGTH(`password`) >= 8),
  CONSTRAINT `chk_email_domain` CHECK(LOWER(SUBSTRING(`email`,LOCATE('@',`email`),6)) in ('@gmail','@yahoo'))
  -- CONSTRAINT `chk_date_of_birth` CHECK(YEAR(CURDATE())-YEAR(`date_of_birth`) >= 3)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `id_customer_UNIQUE` ON `cabasdat1`.`customer` (`id_customer` ASC) VISIBLE;

CREATE UNIQUE INDEX `email_UNIQUE` ON `cabasdat1`.`customer` (`email` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cabasdat1`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`address` (
  `id_customer` INT NOT NULL,
  `street` VARCHAR(30) NOT NULL,
  `sub_district` VARCHAR(30) NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `postal_code` CHAR(5) NOT NULL,
  PRIMARY KEY (`id_customer`),
  CONSTRAINT `address_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `cabasdat1`.`customer` (`id_customer`),
  CONSTRAINT `chk_postal_code` CHECK(`postal_code` REGEXP '^[0-9]+$' AND `postal_code` BETWEEN '10000' AND '99999')
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cabasdat1`.`brand_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`brand_details` (
  `brand` VARCHAR(50) NOT NULL,
  `creator` VARCHAR(100) NOT NULL,
  `origin` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`brand`),
  CONSTRAINT `chk_origin` CHECK(LENGTH(`origin`) >= 3)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `brand_UNIQUE` ON `cabasdat1`.`brand_details` (`brand` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cabasdat1`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`product` (
  `id_product` INT NOT NULL,
  `brand` VARCHAR(50) NOT NULL,
  `product_name` VARCHAR(100) NOT NULL,
  `size_ml` INT NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `old_price_idr` INT NOT NULL,
  `special_price_idr` INT NOT NULL,
  `discount_percentage` INT NOT NULL,
  PRIMARY KEY (`id_product`),
  CONSTRAINT `product_brand`
    FOREIGN KEY (`brand`)
    REFERENCES `cabasdat1`.`brand_details` (`brand`),
  CONSTRAINT `chk_type` CHECK(LENGTH(`type`) >= 3),
  CONSTRAINT `chk_old_price_idr` CHECK(`old_price_idr` >= 1000),
  CONSTRAINT `chk_special_price_idr` CHECK(`special_price_idr` >= 1000),
  CONSTRAINT `chk_discount_percentage` CHECK(`discount_percentage` > 0 AND `discount_percentage` <= 100)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `id_product_UNIQUE` ON `cabasdat1`.`product` (`id_product` ASC) VISIBLE;

CREATE UNIQUE INDEX `product_name_UNIQUE` ON `cabasdat1`.`product` (`product_name` ASC) VISIBLE;

CREATE INDEX `product_brand_idx` ON `cabasdat1`.`product` (`brand` ASC) VISIBLE;


INSERT INTO `product` VALUES
(1,'LOUIS VAREL','Louis Varel My Dream EDP 100 ml',100,'EDP',620000,434000,30),
(2,'KORLOFF','Miss Korloff EDP 88 ml',88,'EDP',1690000,1521000,10),
(3,'HUGO BOSS','Hugo Boss Scent Le Parfum Men 100 ml',100,'EDP',1680000,1293600,23),
(4,'OULLU','Oullu Umbra EDP 15 ml',15,'EDP',189000,160650,15),
(5,'CRISTIANO RONALDO','Cristiano Ronaldo CR7 Origins EDT 100 ml',100,'EDT',1180000,826000,30),
(6,'MONTBLANC','Montblanc Emblem EDT 100 ml',100,'EDT',1400000,1120000,20),
(7,'ST. HILAIRE','St. Hilaire Private Blue EDP 100 ml',100,'EDP',530000,371000,30),
(8,'PERFUME REPUBLIC','Perfume Republic Break A Leg EDT 100 ml',100,'EDT',249000,161850,35),
(9,'MARCO SERUSSI','Marco Serussi The Man Intense',100,'EDT',1030000,824000,20),
(10,'MUGLER','Mugler Alien Goddess EDP 60 ml',60,'EDP',1680000,1327200,21),
(11,'DOLCE & GABBANA','Dolce & Gabbana K EDT 100 ml',100,'EDT',1470000,1220100,17),
(12,'TOUS','Tous Love Me Onyx EDP 90 ml',90,'EDP',1750000,1575000,10),
(13,'MARINA DE BOURBON','Marina De Bourbon Symbol Royal EDP 100 ml',100,'EDP',1290000,1161000,10),
(14,'SALVATORE FERRAGAMO','Salvatore Ferragamo Uomo Casual Life For Men EDT 100 ml',100,'EDT',1210000,907500,25),
(15,'PASCAL MORABITO','Pascal Morabito Only Love EDP 100 ml',100,'EDP',570000,399000,30),
(16,'BEVERLYS SECRET','Beverly''s Secret Sweet Seduction Fragrance Mist 250 ml',250,'Fragrance Mist',150000,90000,40),
(17,'MAUBOUSSIN','Mauboussin In Red EDP 100 ml 
',100,'EDP',1470000,1249500,15),
(18,'AVICENNA','Avicenna Freedom (New) EDT 100 ml',100,'EDT',379000,284250,25),
(19,'YVES ROCHER','Yves Rocher Bois De Sauge EDT 100 ml ',100,'EDT',779000,545300,30),
(20,'VOYAGE ROYAL','Voyage Royal The Two Roses EDP 100 ml',100,'EDP',930000,651000,30),
(21,'SALVATORE FERRAGAMO','Salvatore Ferragamo Signorina Eleganza EDP 100 ml',100,'EDP',1670000,1285900,23),
(22,'YVES ROCHER','Yves Rocher Pleines Natures Garden Party EDP 100 ml ',100,'EDP',899000,629300,30),
(23,'BEVERLYS SECRET','Beverly''s Secret Exotic Dream Fragrance Mist 250 ml',250,'Fragrance Mist',150000,90000,40),
(24,'SOLINOTES','Solinotes Cerisier EDP 15 ml',15,'EDP',150000,120000,20),
(25,'MONTBLANC','Montblanc Legend Red EDP 100 ml',100,'EDP',1500000,1080000,28),
(26,'MARINA DE BOURBON','Marina De Bourbon Monsieur Le Prince Elegant EDP 100 ml',100,'EDP',990000,891000,10),
(27,'SOLINOTES','Solinotes Vanille EDP 15 ml',15,'EDP',150000,120000,20),
(28,'MARINA DE BOURBON','Marina De Bourbon Royal Style EDP 100 ml',100,'EDP',1030000,978500,5),
(29,'HUGO BOSS','Hugo Boss Bottled EDT 100 ml',100,'EDT',1370000,1054900,23),
(30,'MANDARINA DUCK','Mandarina The Duckers Resort Lovers EDT 100 ml',100,'EDT',790000,553000,30),
(31,'VIKTOR & ROLF','Viktor & Rolf Spice Bomb EDT 90 ml',90,'EDT',1430000,1144000,20),
(32,'AVICENNA','Avicenna La Femme (New) EDP 100 ml',100,'EDP',399000,299250,25),
(33,'SALVATORE FERRAGAMO','Salvatore Ferragamo Uomo Urban Feel EDT 100 ml',100,'EDT',1210000,931700,23),
(34,'POLICE','Police Contemporary Deep Blue EDT 100 ml',100,'EDT',540000,459000,15),
(35,'MERCEDES BENZ','Mercedes Benz Intense EDT 120 ml',120,'EDT',1080000,810000,25),
(36,'MERCEDES BENZ','Mercedes Benz Woman In Red EDP 90 ml',90,'EDP',1160000,893200,23),
(37,'GIORGIO ARMANI','Giorgio Armani Acqua Di Gio EDT 100 ml',100,'EDT',1390000,1112000,20),
(38,'CHARRIOL','Charriol Infinite Celtic Ultimate EDP 100 ml',100,'EDP',1690000,1352000,20),
(39,'AVICENNA','Avicenna VIP Woman EDP 50 ml',50,'EDP',259000,194250,25),
(40,'TOUS','Tous Gold EDP 90 ml',90,'EDP',1350000,1215000,10),
(41,'MAUBOUSSIN','Mauboussin Cristal Oud EDP 100 ml',100,'EDP',1320000,1122000,15),
(42,'DAVIDOFF','Davidoff Cool Water Woman EDT 100 ml',100,'EDT',1000000,720000,28),
(43,'KORLOFF','Korloff Korlove EDP 88 ml',88,'EDP',1350000,1215000,10),
(44,'SOLINOTES','Solinotes Grenade EDP 50 ml',50,'EDP',290000,232000,20),
(45,'POLICE','Police To Be Good Vibes Woman EDP 125 ml',125,'EDP',750000,637500,15),
(46,'MANOUSH','Manoush Sun EDT 100 ml',100,'EDT',830000,705500,15),
(47,'CALVIN KLEIN','Calvin Klein One EDT 200 ml',200,'EDT',1380000,993600,28),
(48,'OULLU','Oullu Zephyr EDP 50 ml',50,'EDP',389000,330650,15),
(49,'PASCAL MORABITO','Pascal Morabito Rose Addict EDP 95 ml',95,'EDP',570000,399000,30),
(50,'KORLOFF','Korloff Lady Intense EDP 88 ml',88,'EDP',1690000,1521000,10),
(51,'LUCIANO SOPRANI','Luciano Soprani Jolie Princess EDP 75 ml',75,'EDP',870000,696000,20),
(52,'SALVADOR DALI','Salvador Dali Dalia EDT 100 ml',100,'EDT',1290000,1032000,20),
(53,'PERFUME REPUBLIC','Perfume Republic Hang In There EDT 100 ml',100,'EDT',249000,161850,35),
(54,'LOUIS VAREL','Louis Varel Reflex Black EDT 100 ml',100,'EDT',570000,399000,30),
(55,'MARINA DE BOURBON','Marina De Bourbon Symbol For Lady EDP 100 ml',100,'EDP',1290000,1161000,10),
(56,'KORLOFF','Korloff Pour Homme EDP 88 ml',88,'EDP',1690000,1521000,10),
(57,'GIORGIO ARMANI','Giorgio Armani Aqua Di Gio Refillable EDP 125 ml',125,'EDP',1920000,1536000,20),
(58,'OULLU','Oullu Aether EDP 15 ml',15,'EDP',189000,160650,15),
(59,'SALVATORE FERRAGAMO','Salvatore Ferragamo Uomo 3 Signature Men EDP 100 ml',100,'EDP',1340000,1031800,23),
(60,'PASCAL MORABITO','Pascal Morabito Blossom Delight EDP 100 ml',100,'EDP',570000,399000,30),
(61,'BEVERLYS SECRET','Beverly''s Secret Vanilla Sparkle Fragrance Mist 250 ml',250,'Fragrance Mist',150000,90000,40),
(62,'PERFUME REPUBLIC','Perfume Republic Piece Of Cake EDT 100 ml',100,'EDT',249000,186750,25),
(63,'KORLOFF','Korloff So French EDP 88 ml',88,'EDP',1330000,1197000,10),
(64,'POLICE','Police To Be Bad Guy EDT 125 ml',125,'EDT',750000,637500,15),
(65,'NARCISO RODRIGUEZ','Narciso Noir Rose EDP 100 ml',100,'EDP',2260000,1740200,23),
(66,'SALVATORE FERRAGAMO','Salvatore Ferragamo Signorina Misteriosa EDP 100 ml',100,'EDP',1670000,1285900,23),
(67,'PASCAL MORABITO','Pascal Morabito Parisian Dream EDP 100 ml',100,'EDP',650000,455000,30),
(68,'YVES ROCHER','Yves Rocher Pleines Natures Sable Fauve EDP 100 ml ',100,'EDP',899000,629300,30),
(69,'BEVERLYS SECRET','Beverly''s Secret Cherry Blossom Fragrance Mist 250 ml',250,'Fragrance Mist',150000,90000,40),
(70,'MONTBLANC','Montblanc Legend EDP 100 ml',100,'EDP',1500000,1080000,28),
(71,'MARCO SERUSSI','Marco Serussi The Lady',90,'EDP',1030000,824000,20),
(72,'AVICENNA','Avicenna Wild (New) EDT 100 ml',100,'EDT',379000,284250,25),
(73,'JIMMY CHOO','Jimmy Choo Man Blue EDT 100ml',100,'EDT',1360000,1060800,22),
(74,'SOLINOTES','Solinotes Cotton EDP 50 ml',50,'EDP',290000,232000,20),
(75,'DOLCE & GABBANA','Dolce & Gabbana Light Blue Pour Homme EDT 200 ml',200,'EDT',1640000,1230000,25),
(76,'BLAUER','Blauer Journey Man EDP 80ml',80,'EDP',980000,784000,20),
(77,'LUCIANO SOPRANI','Luciano Soprani D Moi EDP 100 ml',100,'EDP',890000,712000,20),
(78,'ROCKFORD','Rockford Night Blue EDT 100 ml',100,'EDT',410000,287000,30),
(79,'AVICENNA','Avicenna VIP Men (New) EDT 100 ml',100,'EDT',399000,299250,25),
(80,'WEIL','Weil Greedy Essence EDP 100 ml',100,'EDP',620000,527000,15),
(81,'POLICE','Police Contemporary Sport EDT 100 ml',100,'EDT',540000,459000,15),
(82,'ARNO SOREL','Arno Sorel Royal Player EDP 100 ml',100,'EDP',380000,304000,20),
(83,'MARINA DE BOURBON','Marina De Bourbon Monsieur Le Prince Intense EDP 100 ml',100,'EDP',990000,891000,10),
(84,'SOLINOTES','Solinotes Grenade EDP 15 ml',15,'EDP',150000,120000,20),
(85,'AVICENNA','Avicenna Sincere EDP 50 ml',50,'EDP',259000,194250,25),
(86,'HALLOWEEN','Halloween Man X EDT 125 ml',125,'EDT',1250000,1062500,15),
(87,'ARMAND BASI','Armand Basi Scent Of Kiss My Heart EDT 50 ml',50,'EDT',550000,385000,30),
(88,'DAVIDOFF','Davidoff Horizon EDT 125 ml',125,'EDT',1040000,780000,25),
(89,'AVICENNA','Avicenna Miracle (New) EDP 100 ml',100,'EDP',399000,299250,25),
(90,'SOLINOTES','Solinotes The Blanc EDP 50 ml',50,'EDP',290000,232000,20),
(91,'POLICE','Police Potion Power Man EDP 100 ml',100,'EDP',890000,756500,15),
(92,'SOLINOTES','Solinotes Yuzu EDP 15 ml',15,'EDP',150000,120000,20),
(93,'MERCEDES BENZ','Mercedes Benz Men Ultimate EDP 120 ml',120,'EDP',1120000,862400,23),
(94,'MARINA DE BOURBON','Marina De Bourbon Golden Dynastie EDP 100 ml',100,'EDP',990000,891000,10),
(95,'WEIL','Weil Passion Essence EDP 100 ml',100,'EDP',620000,496000,20),
(96,'TOUS','Tous Man Intense EDT 100 ml',100,'EDT',1280000,1152000,10),
(97,'ROCKFORD','Rockford Wild Black EDT 100 ml',100,'EDT',410000,287000,30),
(98,'YVES ROCHER','Yves Rocher La Collection Voile D''Ocre EDP 100 ml',100,'EDP',899000,629300,30),
(99,'SOLINOTES','Solinotes Fleur De Figuier EDT 50 ml',50,'EDT',290000,174000,40),
(100,'ANGEL SCHLESSER','Angel Schlesser Instant Absolu Sensual Patchouli EDP 100 ml',100,'EDP',1490000,1192000,20),
(101,'YVES ROCHER','Yves Rocher Body & Hair Mist - Vanilla 100 ml',100,'Body & Hair Mist',219000,164250,25),
(102,'TOUS','Tous Man Chill EDT 100 ml',100,'EDT',1280000,1152000,10),
(103,'DOLCE & GABBANA','Dolce & Gabbana Intenso EDP 125 ml',125,'EDP',1560000,1170000,25),
(104,'OULLU','Oullu Arcana EDP 50 ml',50,'EDP',389000,330650,15),
(105,'SOLINOTES','Solinotes Vanille EDP 50 ml',50,'EDP',290000,232000,20),
(106,'PERFUME REPUBLIC','Perfume Republic Out in Bloom EDT 100 ml',100,'EDT',249000,186750,25),
(107,'YVES ROCHER','Yves Rocher Body & Hair Mist - Olive 100 ml',100,'Body & Hair Mist',219000,164250,25),
(108,'DOLCE & GABBANA','Dolce & Gabbana The One Gold Intense For Her EDP 75ml',75,'EDP',1880000,1560400,17),
(109,'CALVIN KLEIN','Calvin Klein Eternity For Men EDT 100 ml',100,'EDT',1300000,936000,28),
(110,'OULLU','Oullu Solar Rays EDP 15 ml',15,'EDP',189000,160650,15),
(111,'BERDOUES','Berdoues Vanille & Safran EDT 100 ml',100,'EDT',570000,456000,20),
(112,'KORLOFF','Korloff In White Intense EDP 88 ml',88,'EDP',1690000,1521000,10),
(113,'CALVIN KLEIN','Calvin Klein Everyone EDT 200 ml',200,'EDT',1380000,1104000,20),
(114,'MAUBOUSSIN','Mauboussin Promise Me Intense EDP 90 ml',90,'EDP',1440000,1224000,15),
(115,'CRISTIANO RONALDO','Cristiano Ronaldo CR7 EDT 100 ml',100,'EDT',980000,686000,30),
(116,'YVES ROCHER','Yves Rocher Ambre Noir EDT 100 ml',100,'EDT',779000,545300,30),
(117,'RALPH LAUREN','Ralph Lauren Polo Deep Blue Parfum EDP 125 ml',125,'EDP',1280000,1024000,20),
(118,'YVES ROCHER','Yves Rocher La Collection Verveine EDT 100 ml',100,'EDT',449000,314300,30),
(119,'ARMAND BASI','Armand Basi Scent of Kiss Poplove EDT 50 ml',50,'EDT',550000,385000,30),
(120,'BURBERRY','Burberry Mr. Burberry EDT 100 ml',100,'EDT',1330000,1024100,23),
(121,'OULLU','Oullu Arcana EDP 15 ml',15,'EDP',189000,160650,15),
(122,'POLICE','Police To Be Super Pure EDT 125 ml',125,'EDT',750000,675000,10),
(123,'ANGEL SCHLESSER','Angel Schlesser Essential For Men EDT 100 ml',100,'EDT',1270000,1016000,20),
(124,'GATTINONI','Gattinoni Armonia EDP 75 ml',75,'EDP',850000,680000,20),
(125,'SALVADOR DALI','Salvador Dali La Belle Et l''Ocelot EDT 100 ml',100,'EDT',1200000,960000,20),
(126,'JASON WU','Jason Wu Velvet Rouge EDP 90 ml',90,'EDP',2080000,1872000,10),
(127,'POLICE','Police Contemporary Gentleman EDT 100 ml',100,'EDT',540000,459000,15),
(128,'SOLINOTES','Solinotes Blanc EDP 15 ml',15,'EDP',150000,120000,20),
(129,'CALVIN KLEIN','Calvin Klein Everyone U EDP 200 ml',200,'EDP',1540000,1108800,28),
(130,'MARINA DE BOURBON','Marina De Bourbon Dynastie Mademoiselle EDP 100 ml',100,'EDP',990000,891000,10),
(131,'SOLINOTES','Solinotes Rose EDP 15 ml',15,'EDP',150000,120000,20),
(132,'MARINA DE BOURBON','Marina De Bourbon Princess Style EDP 100 ml',100,'EDP',1030000,978500,5),
(133,'ARMAND BASI','Armand Basi L''Eau Pour Homme Vetiver EDT 125 ml',125,'EDT',1290000,903000,30),
(134,'AVICENNA','Avicenna VIP Women (New) EDP 100 ml',100,'EDP',399000,299250,25),
(135,'ISSEY MIYAKE','Issey Miyake L''Eau Super Majeure D''Issey EDT 100 ml',100,'EDT',1360000,1020000,25),
(136,'POLICE','Police Potion Love Woman EDP 100 ml',100,'EDP',890000,756500,15),
(137,'YVES ROCHER','Yves Rocher Comme Une Evidence Homme EDT 100 ml',100,'EDT',779000,545300,30),
(138,'RALPH LAUREN','Ralph Lauren Polo Ralph''s Club EDP 100 ml',100,'EDP',1430000,1144000,20),
(139,'DOLCE & GABBANA','Dolce & Gabbana Light Blue EDT 100 ml',100,'EDT',1520000,1140000,25),
(140,'OULLU','Oullu Solar Rays EDP 50 ml',50,'EDP',389000,330650,15),
(141,'AVICENNA','Avicenna Miracle EDP 50 ml',50,'EDP',259000,194250,25),
(142,'TOUS','Tous Man Sport EDT 100 ml',100,'EDT',1280000,1152000,10),
(143,'MARINA DE BOURBON','Marina De Bourbon My Dynastie Princess EDP 100 ml',100,'EDP',990000,891000,10),
(144,'DAVIDOFF','Davidoff Cool Water Man EDT 125 ml',125,'EDT',1090000,784800,28),
(145,'YVES ROCHER','Yves Rocher Quelques D''Amour EDP 50 ml New',50,'EDP',769000,538300,30),
(146,'SOLINOTES','Solinotes Yuzu EDP 50 ml',50,'EDP',290000,232000,20),
(147,'POLICE','Police To Be Good Vibes Man EDT 125ml',125,'EDT',750000,637500,15),
(148,'YVES ROCHER','Yves Rocher Body & Hair Mist - Mango 100 ml',100,'Body & Hair Mist',219000,164250,25),
(149,'MANOUSH','Manoush Musk EDT 100 ml',100,'EDT',830000,705500,15),
(150,'CALVIN KLEIN','Calvin Klein Eternity For Women EDP 100 ml',100,'EDP',1390000,1000800,28),
(151,'OULLU','Oullu Umbra EDP 50 ml',50,'EDP',389000,330650,15),
(152,'BERDOUES','Berdoues Ylang & Fleur EDT 100 ml',100,'EDT',570000,456000,20),
(153,'PASCAL MORABITO','Pascal Morabito Purple Ruby EDP 95 ml',95,'EDP',570000,399000,30),
(154,'LOUIS VAREL','Louis Varel Extreme Rose EDP 100 ml',100,'EDP',620000,434000,30),
(155,'PASCAL MORABITO','Pascal Morabito Perle Precieuse EDP 100 ml',100,'EDP',570000,399000,30),
(156,'AVICENNA','Avicenna Euphoric (New) EDP 100 ml',100,'EDP',379000,284250,25),
(157,'BERDOUES GRAND CRUS','Grand Crus Peng Lai EDP 100 ml',100,'EDP',1830000,1281000,30),
(158,'ENGELSRUFER','Engelsrufer Heaven EDP 100 ml',100,'EDP',1190000,1071000,10),
(159,'ST. HILAIRE','St. Hilaire Private Red EDP 100 ml',100,'EDP',490000,343000,30),
(160,'VOYAGE ROYAL','Voyage Royal Pope Daughter EDP 100 ml',100,'EDP',930000,651000,30),
(161,'POLICE','Police To Be EDT 125 ml',125,'EDT',690000,586500,15),
(162,'SALVATORE FERRAGAMO','Salvatore Ferragamo Amo Per Lei EDP 100 ml',100,'EDP',1660000,1278200,23),
(163,'MARYAJ','Maryaj M EDP 90 ml',90,'EDP',300000,270000,10),
(164,'ANGEL SCHLESSER','Angel Schlesser Instant Vibrant Sandalwood EDT 100 ml',100,'EDT',990000,792000,20),
(165,'RUE PERGOLESE','Rue Pergolese Black Pour Homme EDT 100 ml',100,'EDT',420000,336000,20),
(166,'AVICENNA','Avicenna Blossom (New) EDP 100 ml',100,'EDP',379000,284250,25),
(167,'ARMAND BASI','Armand Basi Scent Of Kiss EDT 50 ml',50,'EDT',550000,385000,30),
(168,'ENGELSRUFER','Engelsrufer Aurora EDP 100 ml',100,'EDP',1190000,1071000,10),
(169,'LUCIANO SOPRANI','Luciano Soprani D Moi EDP 50 ml',50,'EDP',600000,300000,50),
(170,'LA MARTINA','La Martina Blue Gardenia EDC 80 ml',80,'EDC',1450000,870000,40),
(171,'BYBLOS','Byblos In Black EDP 100 ml',100,'EDP',950000,760000,20),
(172,'MARCO SERUSSI','Marco Serussi Harmony Intense EDP 100 ml',100,'EDP',990000,792000,20),
(173,'MARYAJ','Maryaj Inspire EDP 90 ml',90,'EDP',300000,270000,10),
(174,'ANGEL SCHLESSER','Angel Schlesser Instant Intimate White Flower EDT 100 ml',100,'EDT',990000,940500,5),
(175,'ROCKFORD','Rockford Wild White EDT 100 ml',100,'EDT',410000,287000,30),
(176,'AVICENNA','Avicenna Eclat (New) EDT 100 ml',100,'EDT',399000,299250,25),
(177,'PASCAL MORABITO','Pascal Morabito Mediterranee EDT 100 ml',100,'EDT',570000,399000,30),
(178,'ARNO SOREL','Arno Sorel Royal Gold EDT 100 ml',100,'EDT',330000,264000,20),
(179,'AVICENNA','Avicenna Starburst EDP 100 ml',100,'EDP',399000,299250,25),
(180,'MARINA DE BOURBON','Marina De Bourbon Royal Marina Diamond EDP 100 ml',100,'EDP',1110000,999000,10),
(181,'BERDOUES GRAND CRUS','Grand Crus Guaria Morada EDP 100 ml',100,'EDP',1830000,1281000,30),
(182,'MARYAJ','Maryaj Blue Force EDP 100 ml',100,'EDP',350000,315000,10),
(183,'HUGO BOSS','Hugo Boss Femme EDP 75 ml',75,'EDP',1590000,1224300,23),
(184,'MANDARINA DUCK','Mandarina The Duckers Freedomland EDT 100 ml',100,'EDT',790000,553000,30),
(185,'SALVATORE FERRAGAMO','Salvatore Ferragamo FERRAGAMO Intense Leather EDP 100 ml',100,'EDP',1440000,1108800,23),
(186,'AVICENNA','Avicenna Legend (New) EDT 100 ml',100,'EDT',379000,284250,25),
(187,'BERDOUES GRAND CRUS','Grand Crus Azur Riviera EDP 100 ml',100,'EDP',1830000,1281000,30),
(188,'KAVIAR GAUCHE','Kaviar Gauche EDP 90 ml',90,'EDP',2140000,1712000,20),
(189,'ST. HILAIRE','St. Hilaire Private Grey EDP 100 ml',100,'EDP',490000,343000,30),
(190,'VOYAGE ROYAL','Voyage Royal Dracula EDP 100 ml',100,'EDP',930000,651000,30),
(191,'BURBERRY','Burberry Hero EDT 150 ml',150,'EDT',1740000,1339800,23),
(192,'MONTBLANC','Montblanc Explorer EDP 100 ml',100,'EDP',1580000,1216600,23),
(193,'BLAUER','Blauer UN1T3D For Man EDT 100ml',100,'EDT',1050000,630000,40),
(194,'JIMMY CHOO','Jimmy Choo I Want Choo EDP 100 ml',100,'EDP',1840000,1435200,22),
(195,'SALVATORE FERRAGAMO','Salvatore Ferragamo Uomo For Men EDT 100 ml',100,'EDT',1210000,907500,25),
(196,'PASCAL MORABITO','Pascal Morabito Beautiful Girl EDP 100 ml',100,'EDP',570000,399000,30),
(197,'ARMAND BASI','Armand Basi L''Eau Pour Homme EDT 125 ml',125,'EDT',1290000,903000,30),
(198,'PERFUME REPUBLIC','Perfume Republic On Point EDT 100 ml',100,'EDT',249000,186750,25),
(199,'MARCO SERUSSI','Marco Serussi The Lady Intense EDP 90 ml',90,'EDP',1030000,824000,20),
(200,'AVICENNA','Avicenna Supreme Advanced (New) EDT 100 ml',100,'EDT',379000,284250,25),
(201,'JIMMY CHOO','Jimmy Choo Urban Hero EDP 100 ml',100,'EDP',1310000,1021800,22),
(202,'SCALPERS','Scalpers Club EDP 125 ml',125,'EDP',1250000,1062500,15),
(203,'JIMMY CHOO','Jimmy Choo Man Iced EDT 100 ml',100,'EDT',1360000,1060800,22),
(204,'BLAUER','Blauer Journey Woman EDP 80ml',80,'EDP',980000,784000,20),
(205,'SALVATORE FERRAGAMO','Salvatore Ferragamo Signorina EDP 100 ml',100,'EDP',1670000,1285900,23),
(206,'PASCAL MORABITO','Pascal Morabito Aimer EDP 100 ml',100,'EDP',650000,455000,30),
(207,'YVES ROCHER','Yves Rocher Pleines Natures Sel D''Azur EDP 100 ml ',100,'EDP',899000,629300,30),
(208,'BEVERLYS SECRET','Beverly''s Secret Sparkling Beauty Fragrance Mist 250 ml',250,'Fragrance Mist',150000,90000,40),
(209,'EMANUEL UNGARO','Emanuel Ungaro For Him EDT 100 ml',100,'EDT',720000,576000,20),
(210,'FACONNABLE','Faconnable Riviera EDP 90 ml',90,'EDP',990000,841500,15),
(211,'VOYAGE ROYAL','Voyage Royal The Conqueror EDP 100 ml',100,'EDP',930000,651000,30),
(212,'LUCIANO SOPRANI','Luciano Soprani Uomo EDT 100 ml',100,'EDT',890000,712000,20),
(213,'YVES ROCHER','Yves Rocher Cuir Vetiver EDT 100 ml new',100,'EDT',779000,545300,30),
(214,'MARYAJ','Maryaj Deuce Femme EDP 100 ml',100,'EDP',300000,270000,10),
(215,'BEVERLYS SECRET','Beverly''s Secret Exotic Bloom Fragrance Mist 250 ml',250,'Fragrance Mist',150000,90000,40),
(216,'ANGEL SCHLESSER','Angel Schlesser Instant Absolu Deep Leather EDP 100 ml',100,'EDP',1490000,1192000,20),
(217,'JIMMY CHOO','Jimmy Choo Fever EDP 100 ml',100,'EDP',1450000,1131000,22),
(218,'CHARRIOL','Charriol Infinite Celtic Women EDT 100 ml',100,'EDT',1590000,1272000,20),
(219,'DUNHILL','Dunhill Desire Silver EDT 100 ml',100,'EDT',990000,742500,25),
(220,'HUGO BOSS','Hugo Boss Ma Vie EDP 75 ml',75,'EDP',1780000,1370600,23),
(221,'MERCEDES BENZ','Mercedes Benz The Move EDT 100 ml',100,'EDT',870000,652500,25),
(222,'HUGO BOSS','Hugo Boss Bottled Tonic EDT 100 ml',100,'EDT',1370000,1054900,23),
(223,'MARCO SERUSSI','Marco Serussi The Man Trust EDT 100 ml',100,'EDT',1030000,824000,20),
(224,'ISSEY MIYAKE','Issey L''Eau Majeure D''Issey EDT 100 ml',100,'EDT',1220000,939400,23),
(225,'HUGO BOSS','Hugo Boss Unlimited EDT 100 ml',100,'EDT',1370000,1054900,23),
(226,'MAUBOUSSIN','Mauboussin Private Club EDP 100 ml',100,'EDP',1320000,1122000,15),
(227,'SALVADOR DALI','Salvador Dali Eau De Rubylips EDT 100 ml',100,'EDT',1130000,904000,20),
(228,'ARMAND BASI','Armand Basi Night Blue EDT 100 ml',100,'EDT',1290000,1032000,20),
(229,'HUGO BOSS','Hugo Boss Selection EDT 90 ml',90,'EDT',1150000,885500,23),
(230,'HUGO BOSS','Hugo Boss Nuit EDP 75 ml',75,'EDP',1480000,1139600,23);


-- -----------------------------------------------------
-- Table `cabasdat1`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`orders` (
  `id_customer` INT NOT NULL,
  `id_order` INT NOT NULL,
  `id_product` INT NOT NULL,
  `quantity` INT NOT NULL,
  `shipping_fee` INT NOT NULL,
  `order_status` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_customer`, `id_order`),
  CONSTRAINT `orders_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `cabasdat1`.`customer` (`id_customer`),
  CONSTRAINT `orders_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `cabasdat1`.`product` (`id_product`),
  CONSTRAINT `chk_order_status` CHECK(LOWER(`order_status`) in ('complete','on-going'))
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `orders_product_idx` ON `cabasdat1`.`orders` (`id_product` ASC) VISIBLE;

CREATE INDEX `payment_order_idx` ON `cabasdat1`.`orders` (`id_order` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cabasdat1`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`payment` (
  `id_customer` INT NOT NULL,
  `id_order` INT NOT NULL,
  `id_payment` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `method` VARCHAR(20) NOT NULL,
  `status` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_customer`, `id_order`, `id_payment`),
  CONSTRAINT `payment_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `cabasdat1`.`customer` (`id_customer`),
  CONSTRAINT `payment_order`
    FOREIGN KEY (`id_order`)
    REFERENCES `cabasdat1`.`orders` (`id_order`),
    CONSTRAINT `chk_method` CHECK(`method` IN ('debit_credit_card','bank_transfer','electronic_card')),
  CONSTRAINT `chk_payment_status` CHECK(LOWER(`status`) IN ('success','waiting'))
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `payment_order_idx` ON `cabasdat1`.`payment` (`id_order` ASC) VISIBLE;

CREATE INDEX `history_payment_idx` ON `cabasdat1`.`payment` (`id_payment` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cabasdat1`.`bank_transfer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`bank_transfer` (
  `id_customer` INT NOT NULL,
  `id_order` INT NOT NULL,
  `id_payment` INT NOT NULL,
  `bank_name` VARCHAR(15) NOT NULL,
  `virtual_account` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_customer`, `id_order`, `id_payment`),
  CONSTRAINT `tf_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `cabasdat1`.`customer` (`id_customer`),
  CONSTRAINT `tf_order`
    FOREIGN KEY (`id_order`)
    REFERENCES `cabasdat1`.`orders` (`id_order`),
  CONSTRAINT `tf_payment`
    FOREIGN KEY (`id_payment`)
    REFERENCES `cabasdat1`.`payment` (`id_payment`),
  CONSTRAINT `chk_bank_name` CHECK(LENGTH(`bank_name`) >= 3)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `tf_order_idx` ON `cabasdat1`.`bank_transfer` (`id_order` ASC) VISIBLE;

CREATE INDEX `tf_payment_idx` ON `cabasdat1`.`bank_transfer` (`id_payment` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cabasdat1`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`cart` (
  `id_customer` INT NOT NULL,
  `id_product` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id_customer`, `id_product`),
  CONSTRAINT `cart_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `cabasdat1`.`customer` (`id_customer`),
  CONSTRAINT `cart_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `cabasdat1`.`product` (`id_product`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `cart_product_idx` ON `cabasdat1`.`cart` (`id_product` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cabasdat1`.`debit_credit_card`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`debit_credit_card` (
  `id_customer` INT NOT NULL,
  `id_order` INT NOT NULL,
  `id_payment` INT NOT NULL,
  `bank_name` VARCHAR(15) NOT NULL,
  `card_number` INT NOT NULL,
  `first_name` VARCHAR(15) NOT NULL,
  `last_name` VARCHAR(15) NOT NULL,
  `cvv` INT NOT NULL,
  `expired_date` DATE NOT NULL,
  PRIMARY KEY (`id_customer`, `id_order`, `id_payment`),
  CONSTRAINT `debit_credit_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `cabasdat1`.`customer` (`id_customer`),
  CONSTRAINT `debit_credit_order`
    FOREIGN KEY (`id_order`)
    REFERENCES `cabasdat1`.`orders` (`id_order`),
  CONSTRAINT `debit_credit_payment`
    FOREIGN KEY (`id_payment`)
    REFERENCES `cabasdat1`.`payment` (`id_payment`),
  CONSTRAINT `chk_bank_debit_credit` CHECK(LENGTH(`bank_name`) >= 3),
  CONSTRAINT `chk_first_name_debit_credit` CHECK(LENGTH(`first_name`) >= 3),
  CONSTRAINT `chk_last_name_debit_credit` CHECK(LENGTH(`last_name`) >= 3),
  CONSTRAINT `chk_card_number` CHECK(LENGTH(CAST(`card_number` AS CHAR(16))) = 16),
  CONSTRAINT `chk_cvv` CHECK(`cvv` >= 100 AND `cvv` <= 999)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `debit_credit_order_idx` ON `cabasdat1`.`debit_credit_card` (`id_order` ASC) VISIBLE;

CREATE INDEX `debit_credit_payment_idx` ON `cabasdat1`.`debit_credit_card` (`id_payment` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cabasdat1`.`electronic_money`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`electronic_money` (
  `id_customer` INT NOT NULL,
  `id_order` INT NOT NULL,
  `id_payment` INT NOT NULL,
  `type` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_customer`, `id_order`, `id_payment`),
  CONSTRAINT `emoney_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `cabasdat1`.`customer` (`id_customer`),
  CONSTRAINT `emoney_order`
    FOREIGN KEY (`id_order`)
    REFERENCES `cabasdat1`.`orders` (`id_order`),
  CONSTRAINT `emoney_payment`
    FOREIGN KEY (`id_payment`)
    REFERENCES `cabasdat1`.`payment` (`id_payment`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `emoney_order_idx` ON `cabasdat1`.`electronic_money` (`id_order` ASC) VISIBLE;

CREATE INDEX `emoney_payment_idx` ON `cabasdat1`.`electronic_money` (`id_payment` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cabasdat1`.`history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`history` (
  `id_customer` INT NOT NULL,
  `id_payment` INT NOT NULL,
  PRIMARY KEY (`id_customer`, `id_payment`),
  CONSTRAINT `history_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `cabasdat1`.`customer` (`id_customer`),
  CONSTRAINT `history_payment`
    FOREIGN KEY (`id_payment`)
    REFERENCES `cabasdat1`.`payment` (`id_payment`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `history_payment_idx` ON `cabasdat1`.`history` (`id_payment` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `cabasdat1`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cabasdat1`.`wishlist` (
  `id_customer` INT NOT NULL,
  `id_product` INT NOT NULL,
  PRIMARY KEY (`id_customer`, `id_product`),
  CONSTRAINT `wishlist_customer`
    FOREIGN KEY (`id_customer`)
    REFERENCES `cabasdat1`.`customer` (`id_customer`),
  CONSTRAINT `wishlist_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `cabasdat1`.`product` (`id_product`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `wishlist_product_idx` ON `cabasdat1`.`wishlist` (`id_product` ASC) VISIBLE;

USE `cabasdat1`;

DELIMITER $$
USE `cabasdat1`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `cabasdat1`.`customer_BEFORE_INSERT`
BEFORE INSERT ON `cabasdat1`.`customer`
FOR EACH ROW
BEGIN
  declare phone_length int;
  set phone_length = length(new.phone_number);
	if new.phone_number REGEXP '^[0-9]+$' AND phone_length >= 10 AND substring(new.phone_number,1,2) = '08'
		then set new.phone_number =substring(new.phone_number,2,length(new.phone_number)-1);
	else
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number must start with 08 and be at least 10 digits long.';
  END IF;
END$$

USE `cabasdat1`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `cabasdat1`.`customer_BEFORE_UPDATE`
BEFORE UPDATE ON `cabasdat1`.`customer`
FOR EACH ROW
BEGIN
  declare phone_length int;
  set phone_length = length(new.phone_number);
	if new.phone_number REGEXP '^[0-9]+$' AND phone_length >= 10 AND substring(new.phone_number,1,2) = '08'
		then set new.phone_number =substring(new.phone_number,2,length(new.phone_number)-1);
	else
    set new.phone_number = old.phone_number;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Phone number must start with 08 and be at least 10 digits long.';
  END IF;
END$$

USE `cabasdat1`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `cabasdat1`.`debit_credit_card_BEFORE_INSERT`
BEFORE INSERT ON `cabasdat1`.`debit_credit_card`
FOR EACH ROW
BEGIN
	if new.expired_date = DATE_SUB(CURDATE(),INTERVAL 1 DAY)
		then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Card is expired.';
  END IF;
END$$

USE `cabasdat1`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `cabasdat1`.`debit_credit_card_BEFORE_UPDATE`
BEFORE UPDATE ON `cabasdat1`.`debit_credit_card`
FOR EACH ROW
BEGIN
	if new.expired_date = DATE_SUB(CURDATE(),INTERVAL 1 DAY)
		then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Card is expired.';
  else
    set new.expired_date = old.expired_date;
  END IF;
END$$

USE `cabasdat1`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `cabasdat1`.`birth_BEFORE_INSERT`
BEFORE INSERT ON `cabasdat1`.`customer`
FOR EACH ROW
BEGIN
  DECLARE year_diff INT;
  SET year_diff = YEAR(CURDATE()) - YEAR(new.date_of_birth);

  if year_diff >= 3
    then set new.date_of_birth = new.date_of_birth;
  else
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fragrances are for age 3+';
  END IF;
END$$

USE `cabasdat1`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `cabasdat1`.`birth_BEFORE_UPDATE`
BEFORE UPDATE ON `cabasdat1`.`customer`
FOR EACH ROW
BEGIN
  DECLARE year_diff INT;
  SET year_diff = YEAR(CURDATE()) - YEAR(new.date_of_birth);

	if year_diff < 3 then
		set new.date_of_birth = old.date_of_birth;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fragrances are for age 3+';
  else
    set new.date_of_birth = new.date_of_birth;
  END IF;
END$$

USE `cabasdat1`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `cabasdat1`.`shipping_fee_trigger`
BEFORE INSERT ON `cabasdat1`.`orders`
FOR EACH ROW
BEGIN
    SET NEW.shipping_fee = 10000;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;