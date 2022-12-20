/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.30-log : Database - bookshopsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookshopsystem` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `bookshopsystem`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(255) DEFAULT NULL,
  `adminPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `copies` int(11) DEFAULT NULL,
  `coverImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `books` */

insert  into `books`(`bookId`,`isbn`,`title`,`author`,`genre`,`price`,`copies`,`coverImage`) values 
(1,'765B','Java','DS','Mk',6000,6,'b1.png'),
(2,'76A','Python','SS','MN',766,5,'b2.png'),
(3,'kkk','jaava66','uuuu','55jkkj',7,65,'books.jpg'),
(4,'K19','Ubentu','Kites','kk',2000,7,'b4.png');

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `bookId` int(11) DEFAULT NULL,
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`historyId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `history` */

insert  into `history`(`bookId`,`historyId`,`title`,`author`) values 
(1,1,'Java','DS'),
(1,2,'Java','Java'),
(1,3,'Java','Java'),
(1,4,'Java','DS'),
(1,5,'Java','DS');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  `userAge` int(11) DEFAULT NULL,
  `userPhone` varchar(255) DEFAULT NULL,
  `userAddress` varchar(255) DEFAULT NULL,
  `userBalance` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`userEmail`,`userPassword`,`userAge`,`userPhone`,`userAddress`,`userBalance`) values 
(1,'danish','danish@gmail.com','danish123',22,'8776','UAE',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
