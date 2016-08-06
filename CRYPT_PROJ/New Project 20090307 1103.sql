-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.24a-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema account
--

CREATE DATABASE IF NOT EXISTS account;
USE account;

--
-- Definition of table `account`.`admin`
--

DROP TABLE IF EXISTS `account`.`admin`;
CREATE TABLE  `account`.`admin` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `account`.`admin` (`id`,`username`,`password`) VALUES 
 (1,'admin','123456');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `account`.`member`
--

DROP TABLE IF EXISTS `account`.`member`;
CREATE TABLE  `account`.`member` (
  `id` varchar(20) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `year` varchar(5) NOT NULL,
  `month` varchar(5) NOT NULL,
  `date` varchar(5) NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(15) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `edit_id` varchar(20) NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`member`
--

/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `account`.`member` (`id`,`userid`,`pwd`,`name`,`gender`,`year`,`month`,`date`,`address`,`email`,`phone`,`edit_id`) VALUES 
 ('1','king','159','chenchih','1','1','2','2','jkhadfkhbdf','aaaa','545465','2008-09-01 10:52:48'),
 ('2','popo','555','±i¤T','0','1','1','1','64646464','555','5656','2008-07-11 20:00:06'),
 ('20080523190036','wwww','852963','kingofking','1','3','2','20','','lee@j',';k;\'k','0000-00-00 00:00:00'),
 ('20080523190211','loop','741852','王','1','2','3','9','tqai[o','hwhfkwnf','','0000-00-00 00:00:00'),
 ('20080523190704','ss','85pp','lee','1','2','2','20','','ddd','','0000-00-00 00:00:00'),
 ('20080523190938','aa56','aalop','kj','1','1','2','5','fsf','kk@hotm.com','','0000-00-00 00:00:00'),
 ('20080523191459','kingkong','abc888','khoh','1','1','1','5','kjhwer','ff@hotmail.com','','0000-00-00 00:00:00'),
 ('20080523192011','king','159','chenchih','1','2','2','2','jkhadfkhbdf','aaaa','','2008-09-01 10:52:48'),
 ('20080523192234','www','852963','dd','1','2','3','7','','dd@ho.com','','0000-00-00 00:00:00'),
 ('20080620135502','495636101','aaa999','sss','1','1950','1','2','hj gjl/b','kkk@jj.com','','0000-00-00 00:00:00');
INSERT INTO `account`.`member` (`id`,`userid`,`pwd`,`name`,`gender`,`year`,`month`,`date`,`address`,`email`,`phone`,`edit_id`) VALUES 
 ('20080620141330','ggg888','888999','fffff','1','1955','1','2','sfsfsfsf','dfsff@dd.com','','0000-00-00 00:00:00'),
 ('20080620141639','111111','0000','fffff','1','1955','1','2','sfsfsfsf','dfsff@dd.com','','0000-00-00 00:00:00'),
 ('20080706163745','themanin','okokok',',fnknn','1','1950','1','3','nmn','aa@yahoo.com','','0000-00-00 00:00:00'),
 ('20080706165106','apllepop','poppop','kdnjdkn','1','1950','1','5',',dndkn','gtott@hoo.com','','0000-00-00 00:00:00'),
 ('20080706165107','aaa','fsfsfsf','vvffaaa','1','1999','1','1','hkllnl','dd@h.com','4444','0000-00-00 00:00:00'),
 ('20080901165107','user','123456','user','1','0','0','0','www','dd@yahoo.com','444','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


--
-- Definition of table `account`.`message`
--

DROP TABLE IF EXISTS `account`.`message`;
CREATE TABLE  `account`.`message` (
  `topic_id` int(11) NOT NULL auto_increment,
  `type` varchar(45) NOT NULL,
  `topic` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL,
  `posttime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `poster` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`message`
--

/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `account`.`message` (`topic_id`,`type`,`topic`,`content`,`posttime`,`poster`,`ip`,`hits`) VALUES 
 (1,'普通','test1','test1','2008-10-10 10:06:57','qq','127.0.0.1',7),
 (3,'資安','test2008','eee','2008-10-30 18:52:42','admin','127.0.0.1',7);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;


--
-- Definition of table `account`.`newsdata`
--

DROP TABLE IF EXISTS `account`.`newsdata`;
CREATE TABLE  `account`.`newsdata` (
  `news_id` int(11) NOT NULL auto_increment,
  `news_date` date NOT NULL default '0000-00-00',
  `news_type` varchar(45) NOT NULL,
  `news_title` varchar(45) NOT NULL,
  `news_editor` varchar(45) NOT NULL,
  `news_content` text NOT NULL,
  PRIMARY KEY  (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`newsdata`
--

/*!40000 ALTER TABLE `newsdata` DISABLE KEYS */;
INSERT INTO `account`.`newsdata` (`news_id`,`news_date`,`news_type`,`news_title`,`news_editor`,`news_content`) VALUES 
 (1,'2008-09-09','公告','資料上傳成功','admin','新資料已上傳成功'),
 (2,'2008-09-09','ddd','website','admin','file are succesful update');
/*!40000 ALTER TABLE `newsdata` ENABLE KEYS */;


--
-- Definition of table `account`.`remessage`
--

DROP TABLE IF EXISTS `account`.`remessage`;
CREATE TABLE  `account`.`remessage` (
  `re_id` int(11) NOT NULL auto_increment,
  `topic_id` int(11) NOT NULL,
  `re_content` text NOT NULL,
  `re_posttime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `re_poster` varchar(45) NOT NULL,
  `re_ip` varchar(45) NOT NULL,
  `re_hits` int(11) NOT NULL default '0',
  `re_topic` varchar(45) NOT NULL,
  PRIMARY KEY  (`re_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`remessage`
--

/*!40000 ALTER TABLE `remessage` DISABLE KEYS */;
INSERT INTO `account`.`remessage` (`re_id`,`topic_id`,`re_content`,`re_posttime`,`re_poster`,`re_ip`,`re_hits`,`re_topic`) VALUES 
 (2,1,'qeqwqwe712123','2008-10-10 09:24:31','qeeqw','127.0.0.1',0,'eeqqqew'),
 (3,1,'adsasda','2008-10-10 10:07:06','ewqea','127.0.0.1',0,'ee'),
 (4,1,'qweqwe','2008-10-10 10:07:15','qewqwe','127.0.0.1',0,'qwewae');
/*!40000 ALTER TABLE `remessage` ENABLE KEYS */;


--
-- Definition of table `account`.`retopic`
--

DROP TABLE IF EXISTS `account`.`retopic`;
CREATE TABLE  `account`.`retopic` (
  `re_id` int(10) unsigned NOT NULL auto_increment,
  `topic_id` varchar(45) NOT NULL,
  `re_topic` varchar(45) NOT NULL,
  `re_face` varchar(45) NOT NULL,
  `re_content` text NOT NULL,
  `re_posttime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `re_poster` varchar(45) NOT NULL,
  `re_ip` varchar(45) NOT NULL,
  `re_hits` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`re_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`retopic`
--

/*!40000 ALTER TABLE `retopic` DISABLE KEYS */;
INSERT INTO `account`.`retopic` (`re_id`,`topic_id`,`re_topic`,`re_face`,`re_content`,`re_posttime`,`re_poster`,`re_ip`,`re_hits`) VALUES 
 (1,'1','er125','03.jpg','rwwe','2008-10-10 08:49:56','f','127.0.0.1',0),
 (2,'1','eeqqqew','02.jpg','qeqwqwe','2008-10-10 09:19:32','ccc','127.0.0.1',0);
/*!40000 ALTER TABLE `retopic` ENABLE KEYS */;


--
-- Definition of table `account`.`score`
--

DROP TABLE IF EXISTS `account`.`score`;
CREATE TABLE  `account`.`score` (
  `id` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `score` varchar(45) NOT NULL default '0',
  `type` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`score`
--

/*!40000 ALTER TABLE `score` DISABLE KEYS */;
/*!40000 ALTER TABLE `score` ENABLE KEYS */;


--
-- Definition of table `account`.`suggestion`
--

DROP TABLE IF EXISTS `account`.`suggestion`;
CREATE TABLE  `account`.`suggestion` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(15) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `comment` varchar(45) NOT NULL,
  `date_id` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`suggestion`
--

/*!40000 ALTER TABLE `suggestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggestion` ENABLE KEYS */;


--
-- Definition of table `account`.`terms`
--

DROP TABLE IF EXISTS `account`.`terms`;
CREATE TABLE  `account`.`terms` (
  `term` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `term_chi` varchar(25) NOT NULL,
  `id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`id`,`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`terms`
--

/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `account`.`terms` (`term`,`description`,`term_chi`,`id`) VALUES 
 ('Asymmetric Encryption','使用兩把不同金鑰來加密和解密，一把鑰稱為公開金鑰， 另一把鑰稱為私密金鑰。 這種加密方式也稱為「公開金鑰加密」。','非對稱加密',1),
 ('Authentication','用來查驗資料傳送人(尤其是訊息)完整性的程序。','認證',2),
 ('Authernticator','附在訊息的額外資訊，讓使用者可以查驗訊息的可靠並接受訊息。認證元可以與訊息內容無關(例如任意數或來源識別子)，亦可由訊息內容決定。','認證元',3),
 ('Block Cipher','一種同步加密演算法，可以將大範圍的明文元(通常是64位元)，轉換成相同長度的密文區塊。','區塊加密',4),
 ('Cipher','一種加密、解密演算法，會將明文中的一個元素，置換成另一個物件，可以隱藏資訊的含意。置換規則通常是由祕密金鑰控制。','加密法',5),
 ('Ciphertext','加密演算法的輸出，是加密過的資訊或資料。','密文',6),
 ('Cryptanalysis','密碼技術的一支，用以破解密文、還原資訊，或假造可被接受的加密資訊。','密碼析解',7);
INSERT INTO `account`.`terms` (`term`,`description`,`term_chi`,`id`) VALUES 
 ('Cryptography','密碼技術的一支，用以設計家密、解密演算法來確保資訊的機密與正確。','密碼學',8),
 ('Decryption','將加密文字或資料(也就是密文)轉換成原的文字或資料(也就是明文)；也稱為「解譯」。','解密',9),
 ('Digital signature','讓訊息產生者將「數碼」附在訊息的認證機制；而「數碼」即為數位簽章。簽章可以保證來原以及訊息的完整性。','數為簽章',10),
 ('Encryption','以轉譯表或演算法將明文惰資料轉換成無法理解的形式(而且還可以再還原成原本的明文或資料)；也稱為enciphering。','加密',11),
 ('Hash Function','將可變長度資料區塊或訊息對應到固定長度數值(稱為雜溱嗎)的函數。這個函數在受到保護的情況下，可以是為資料或訊息的認證子。雜溱函數也稱為訊息摘要。','雜溱函數',12),
 ('Kerberos ','婭雅典娜計畫認證服務的專案代表。','Kerberos ',13),
 ('Master Key','金鑰分發中心與委託人為傅送加密連線金鑰兒長期特有的金鑰。主金鑰通常不以密碼學的方法分送。主金鑰也稱為 key-encrypting key(加密金鑰的金鑰)。','主金鑰',14);
INSERT INTO `account`.`terms` (`term`,`description`,`term_chi`,`id`) VALUES 
 ('Plaintext','加密方法輸入或解密方法輸出。','明文',15),
 ('Private Key','非對稱加密系統使用兩把金鑰的其中一把.為了安全通訊,應該只有私密金鑰的產生者得以特有待有。','私密金鑰',16),
 ('Public Key','非對稱加密系統使用兩把金鑰的其中一把。這把金鑰是公開的, 並且應該與對應的私密金鑰聯合使用。','公開金鑰',17),
 ('Secret Key','用在對稱加密系統的金鑰。參與的雙方必須共用相同金鑰,而且這把金鑰必須保特私密以保護通訊安全。','祕密金鑰',18),
 ('Session Key','用在通訊雙方的臨時加密金鑰。','會期金鑰',19),
 ('Stream Cipher','會從串流明文的輸入產生串流文的對稱式加密演算法;串流金密文的意思,，是指產生的密文是一的元接著一的位元，,或者是一個位元組接著一個位元組。','串流加密',20),
 ('Symmetric Encryption','加密和解密都使用相同金鑰的密碼系統，也稱為轉統加密。','對稱式加密',21),
 ('DES (Data Encryption Standard )','為美國國家標準局於1976年公佈的加密標準，屬於對稱式加密法，DES主要用於業界及美國政府當局的非機密(unclassified)應用。DES的鑰匙長64位元，但因其中每個位元組皆取1位元作為同位(parity)核對，故有效鍵長56位元，DES的基本運算是以連續16次的位元代換及移位及與Key相運算。','數據加密標準',22);
INSERT INTO `account`.`terms` (`term`,`description`,`term_chi`,`id`) VALUES 
 ('PKI (Public Key Infrastructure)','PKI是一種基礎建設內含對稱及非對稱性密碼技術、軟體和網路服務的整合技術，主要是用來提供保障網路通訊和企業電子交易的安全。\r\nPKI為一種支援憑證的軟體、標準和協定的安全性整合服務。\r\n','公開金鑰基礎建設',23),
 ('SSL (Secure Socket Layer)','是Netscape所提出來的資料保密協定，採用了RC4、MD5，以及RSA等加密演算法。如果您想登入的網站具有SSL功能，而且您是使用較新版的瀏覽器，那麼您與網站之間所傳的資料都可以使用SSL協定來保密，除非能破解傳輸密碼，否則其他任何人都無法得到這些機密資料。','數位憑證',24),
 ('AES (Advanced Encryption Standard)','美國國家標準居(NIST)於1997年1向界微求下一代的區塊加密系統，主要的目的是為了要保護較為敏感但非列為機要的聯邦資料，其第二個用意則是要取代舊日使用的 DES (Data Encryption Standard) 加密系統。 AES為一秘密加密演算法；AES為一區塊加密演算法；AES為進行加密之區塊最小為128位元；AES秘密金鑰之長度是變動的，可以為128、192或 256位元；\r\n可以同時由硬體及軟體來實作。\r\n','高級加密標準',25);
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;


--
-- Definition of table `account`.`topic`
--

DROP TABLE IF EXISTS `account`.`topic`;
CREATE TABLE  `account`.`topic` (
  `topic_id` int(10) unsigned NOT NULL auto_increment,
  `type` varchar(45) NOT NULL,
  `topic` varchar(45) NOT NULL,
  `face` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `posttime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `poster` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account`.`topic`
--

/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `account`.`topic` (`topic_id`,`type`,`topic`,`face`,`content`,`posttime`,`poster`,`ip`,`hits`) VALUES 
 (1,'??','qqq','08.jpg','qq','2008-10-18 16:11:47','kdhk','127.0.0.1',24),
 (3,'??','fffffff','01.jpg','ffffff','2008-08-04 19:16:20','king','127.0.0.1',1),
 (4,'qs','dd','dd','dd','2008-09-04 19:16:20','dd','127.0.0.1',0),
 (15,'普通','qq','01.jpg','sss','2008-10-08 19:06:47','aa','127.0.0.1',0),
 (16,'資安','eee','01.jpg','dsadas','2008-10-08 19:14:46','king','127.0.0.1',1),
 (17,'資安','test2008','anger.gif','testtest','2008-10-18 16:11:59','king','127.0.0.1',0),
 (18,'資安','test2008','anger.gif','testtest','2008-10-18 16:34:29','king','127.0.0.1',3);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
