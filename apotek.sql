/*
SQLyog Community
MySQL - 10.4.17-MariaDB : Database - apotek
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`apotek` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

/*Table structure for table `month` */

DROP TABLE IF EXISTS `month`;

CREATE TABLE `month` (
  `month_num` int(2) NOT NULL,
  `month_name` varchar(20) NOT NULL,
  PRIMARY KEY (`month_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `month` */

insert  into `month`(`month_num`,`month_name`) values 
(1,'Januari'),
(2,'Februari'),
(3,'Maret'),
(4,'April'),
(5,'Mei'),
(6,'Juni'),
(7,'Juli'),
(8,'Agustus'),
(9,'September'),
(10,'Oktober'),
(11,'November'),
(12,'Desember');

/*Table structure for table `table_cat` */

DROP TABLE IF EXISTS `table_cat`;

CREATE TABLE `table_cat` (
  `id_kat` int(3) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(30) NOT NULL,
  `des_kat` text NOT NULL,
  PRIMARY KEY (`id_kat`),
  UNIQUE KEY `kategori` (`nama_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

/*Data for the table `table_cat` */

insert  into `table_cat`(`id_kat`,`nama_kategori`,`des_kat`) values 
(201,'Anti Radang','Melegakan peradangan'),
(207,'Antioksidan','Mencegah penuaan dini'),
(208,'Anti Depresan','Mengurangi depresi'),
(209,'Vitamin','Suplemen'),
(216,'Stimulan','Menstimulasi hewan'),
(217,'Antibiotik','bakteriostatik'),
(222,'Hemolitika','Menghentikan pendarahan');

/*Table structure for table `table_invoice` */

DROP TABLE IF EXISTS `table_invoice`;

CREATE TABLE `table_invoice` (
  `id_tagihan` int(5) NOT NULL AUTO_INCREMENT,
  `ref` varchar(10) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `banyak` int(3) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `nama_pembeli` varchar(40) NOT NULL,
  `tgl_beli` date NOT NULL,
  `grandtotal` int(11) NOT NULL,
  PRIMARY KEY (`id_tagihan`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

/*Data for the table `table_invoice` */

insert  into `table_invoice`(`id_tagihan`,`ref`,`nama_obat`,`harga_jual`,`banyak`,`subtotal`,`nama_pembeli`,`tgl_beli`,`grandtotal`) values 
(80,'JMBSErmmo0','Adona',15000,1,15000,'Melinda','2018-08-09',29000),
(81,'JMBSErmmo0','Asam Mefenamat',4000,1,4000,'Melinda','2018-08-09',29000),
(82,'JMBSErmmo0','Salbutamol',10000,1,10000,'Melinda','2018-08-09',29000),
(87,'xl23Q6whsP','Salbutamol',10000,3,30000,'Melinda','2018-01-10',30000),
(90,'9ab7RcZHma','Adrome',15000,6,90000,'Doni','2018-02-14',90000),
(91,'fAMEjr9rA0','Ambroxol',22000,5,110000,'Amirullah','2018-03-14',110000),
(92,'so5518T1vI','Salbutamol',10000,6,60000,'Doni','2018-04-18',60000),
(97,'VS27jjD5Ze','Ambroxol',22000,1,22000,'Pitaloka','2018-07-18',32000),
(98,'VS27jjD5Ze','Stimuno',10000,1,10000,'Pitaloka','2018-07-18',32000),
(99,'nyptFm9i43','Stimuno',10000,3,30000,'Andi','2018-06-13',30000),
(101,'e7QgBweE8X','Adrome',15000,1,15000,'Andi','2018-09-15',15000),
(105,'zPpAfLsmd7','Adrome',15000,1,15000,'Amila','2018-05-16',25000),
(106,'zPpAfLsmd7','Amoxilin',10000,1,10000,'Amila','2018-05-16',25000),
(119,'FfndSkUmh6','Asam Mefenamat',4000,2,8000,'Alina','2018-09-24',12000),
(120,'FfndSkUmh6','Vitamin E',4000,1,4000,'Alina','2018-09-24',12000);

/*Table structure for table `table_med` */

DROP TABLE IF EXISTS `table_med`;

CREATE TABLE `table_med` (
  `id_obat` int(4) NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(30) NOT NULL,
  `penyimpanan` varchar(30) NOT NULL,
  `stok` int(3) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `nama_kategori` varchar(30) NOT NULL,
  `kedaluwarsa` date NOT NULL,
  `des_obat` text NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `nama_pemasok` varchar(30) NOT NULL,
  `gambar` varchar(40) NOT NULL,
  PRIMARY KEY (`id_obat`),
  UNIQUE KEY `nama_obat` (`nama_obat`),
  KEY `med_unit` (`unit`),
  KEY `med_cat` (`nama_kategori`),
  KEY `med_sup` (`nama_pemasok`),
  CONSTRAINT `med_cat` FOREIGN KEY (`nama_kategori`) REFERENCES `table_cat` (`nama_kategori`) ON UPDATE CASCADE,
  CONSTRAINT `med_sup` FOREIGN KEY (`nama_pemasok`) REFERENCES `table_sup` (`nama_pemasok`) ON UPDATE CASCADE,
  CONSTRAINT `med_unit` FOREIGN KEY (`unit`) REFERENCES `table_unit` (`unit`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=utf8;

/*Data for the table `table_med` */

insert  into `table_med`(`id_obat`,`nama_obat`,`penyimpanan`,`stok`,`unit`,`nama_kategori`,`kedaluwarsa`,`des_obat`,`harga_beli`,`harga_jual`,`nama_pemasok`,`gambar`) values 
(1008,'Asam Mefenamat','Gudang',11,'Semprot','Antioksidan','2020-07-20','Untuk meringankan gejala nyeri',4000,4000,'Bina Jaya Apotek',''),
(1016,'Salbutamol','Gudang',4,'Sirup','Antioksidan','2020-07-20','Tidak ada',6000,10000,'Bina Jaya Apotek',''),
(1018,'Adrome','Gudang',6,'Kapsul','Stimulan','2020-08-20','Tidak untuk kucing',12000,15000,'Kenanga Apotek',''),
(1023,'Ambroxol','Lemari 1',6,'Semprot','Anti Radang','2014-08-20','',20000,22000,'Kenanga Apotek',''),
(1025,'Amoxilin','Rak 1',9,'Semprot','Anti Radang','2018-12-14','',7000,10000,'Tina Farma',''),
(1026,'Cetirizen','Rak 1',0,'Tablet','Anti Radang','2020-01-20','',2000,3000,'Kenanga Apotek',''),
(1027,'Corovit','Gudang',10,'Tablet','Antioksidan','2018-09-28','',2000,3000,'Kimia Farma',''),
(1033,'Vitamin E','Rak 1',8,'Tablet','Vitamin','2019-01-23','',3000,4000,'Bina Jaya Apotek',''),
(1036,'Vitamin A','Rak 2',10,'Tablet','Vitamin','2013-02-20','',3000,4000,'Bina Jaya Apotek','');

/*Table structure for table `table_purchase` */

DROP TABLE IF EXISTS `table_purchase`;

CREATE TABLE `table_purchase` (
  `id_pembelian` int(5) NOT NULL AUTO_INCREMENT,
  `ref` varchar(10) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `banyak` int(3) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `nama_pemasok` varchar(40) NOT NULL,
  `tgl_beli` date NOT NULL,
  `grandtotal` int(11) NOT NULL,
  PRIMARY KEY (`id_pembelian`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `table_purchase` */

insert  into `table_purchase`(`id_pembelian`,`ref`,`nama_obat`,`harga_beli`,`banyak`,`subtotal`,`nama_pemasok`,`tgl_beli`,`grandtotal`) values 
(3,'L8BvtCyFDZ','Salbutamol',6000,3,18000,'Bina Jaya Apotek','2018-08-11',24000),
(4,'L8BvtCyFDZ','Stimuno',6000,1,6000,'Bina Jaya Apotek','2018-08-11',24000),
(8,'pwoaFcmGVs','Asam Mefenamat',4000,12,48000,'Bina Jaya Apotek','2018-02-22',48000),
(9,'96kHYMepS9','Salbutamol',6000,7,42000,'Bina Jaya Apotek','2018-03-21',42000),
(10,'Tbb6pLVCJr','Ambroxol',20000,4,80000,'Bina Jaya Apotek','2018-01-24',80000),
(11,'fdMGrBa4nS','Stimuno',6000,16,96000,'Bina Jaya Apotek','2018-04-18',96000),
(12,'aDxtUA0rsc','Adrome',12000,6,72000,'Bina Jaya Apotek','2018-05-09',72000),
(14,'KCZxZ1MqID','Ambroxol',20000,2,40000,'Bina Jaya Apotek','2018-07-18',40000),
(15,'Ar9235n1ny','Adrome',12000,3,36000,'Kenanga Apotek','2018-06-06',56000),
(16,'Ar9235n1ny','Ambroxol',20000,1,20000,'Kenanga Apotek','2018-06-06',56000),
(25,'q8ke6ToBMo','Cetirizen',2000,3,6000,'Kenanga Apotek','2018-09-24',6000);

/*Table structure for table `table_sup` */

DROP TABLE IF EXISTS `table_sup`;

CREATE TABLE `table_sup` (
  `id_pem` int(3) NOT NULL AUTO_INCREMENT,
  `nama_pemasok` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(30) NOT NULL,
  PRIMARY KEY (`id_pem`),
  UNIQUE KEY `nama_supplier` (`nama_pemasok`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

/*Data for the table `table_sup` */

insert  into `table_sup`(`id_pem`,`nama_pemasok`,`alamat`,`telepon`) values 
(101,'Bina Jaya Apotek','Jalan Kaliurang KM 7','089693330253'),
(103,'Kimia Farma','Jalan Kaliurang','02574555'),
(104,'Tina Farma','Jalan Kaliurang','08775544'),
(105,'Kenanga Apotek','Jalan Magelang','08965555'),
(108,'Surya Farmasi','Jalan Magelang KM 9','08546677790');

/*Table structure for table `table_unit` */

DROP TABLE IF EXISTS `table_unit`;

CREATE TABLE `table_unit` (
  `id_unit` int(2) NOT NULL AUTO_INCREMENT,
  `unit` varchar(20) NOT NULL,
  PRIMARY KEY (`id_unit`),
  UNIQUE KEY `unit` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `table_unit` */

insert  into `table_unit`(`id_unit`,`unit`) values 
(1,'Kapsul'),
(2,'Semprot'),
(3,'Sirup'),
(4,'Tablet');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
