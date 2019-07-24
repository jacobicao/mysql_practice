USE sf;
CREATE TABLE `BOOK` (
  `BOOK_ID` int(10) DEFAULT NULL,
  `SORT` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `BOOK_NAME` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `WRITER` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `OUTPUT` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `PRICE` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `READER` (
  `READER_ID` int(3) DEFAULT NULL,
  `COMPANY` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `NAME` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `SEX` varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL,
  `GRADE` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ADDR` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE TABLE `BORROW` (
  `READER_ID` int(3) DEFAULT NULL,
  `BOOK_ID` int(10) DEFAULT NULL,
  `BORROW_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO BOOK VALUES(445501,'TP3/12','数据库导论','王强','科学出版社',17.90);
INSERT INTO BOOK VALUES(445502,'TP3/12','数据库导论','王强','科学出版社',17.90);
INSERT INTO BOOK VALUES(445503,'TP3/12','数据库导论','王强','科学出版社',17.90);
INSERT INTO BOOK VALUES(332211,'TP5/10','计算机基础','李伟','高等教育出版社',18.00);
INSERT INTO BOOK VALUES(112266,'TP3/12','FOXBASE','张三','电子工业出版社',23.60);
INSERT INTO BOOK VALUES(665544,'TS7/21','高等数学','刘明','高等教育出版社',20.00);
INSERT INTO BOOK VALUES(114455,'TR9/12','线性代数','孙业','北京大学出版社',20.80);
INSERT INTO BOOK VALUES(113388,'TR7/90','大学英语','胡玲','清华大学出版社',12.50);
INSERT INTO BOOK VALUES(446601,'TP4/13','数据库基础','马凌云','人民邮电出版社',22.50);
INSERT INTO BOOK VALUES(446602,'TP4/13','数据库基础','马凌云','人民邮电出版社',22.50);
INSERT INTO BOOK VALUES(446603,'TP4/13','数据库基础','马凌云','人民邮电出版社',22.50);
INSERT INTO BOOK VALUES(449901,'TP4/14','FOXPRO大全','周虹','科学出版社',32.70);
INSERT INTO BOOK VALUES(449902,'TP4/14','FOXPRO大全','周虹','科学出版社',32.70);
INSERT INTO BOOK VALUES(118801,'TP4/15','计算机网络','黄力钧','高等教育出版社',21.80);
INSERT INTO BOOK VALUES(118802,'TP4/15','计算机网络','黄力钧','高等教育出版社',21.80);
INSERT INTO READER VALUES(111,'信息系','王维利','女','教授','1号楼424');
INSERT INTO READER VALUES(112,'财会系','李  立','男','副教授','2号楼316');
INSERT INTO READER VALUES(113,'经济系','张  三','男','讲师','3号楼105');
INSERT INTO READER VALUES(114,'信息系','周华发','男','讲师','1号楼316');
INSERT INTO READER VALUES(115,'信息系','赵正义','男','工程师','1号楼224');
INSERT INTO READER VALUES(116,'信息系','李  明','男','副教授','1号楼318');
INSERT INTO READER VALUES(117,'计算机系','李小峰','男','助教','1号楼214');
INSERT INTO READER VALUES(118,'计算机系','许鹏飞','男','助工','1号楼216');
INSERT INTO READER VALUES(119,'计算机系','刘大龙','男','教授','1号楼318');
INSERT INTO READER VALUES(120,'国际贸易','李  雪','男','副教授','4号楼506');
INSERT INTO READER VALUES(121,'国际贸易','李  爽','女','讲师','4号楼510');
INSERT INTO READER VALUES(122,'国际贸易','王  纯','女','讲师','4号楼512');
INSERT INTO READER VALUES(123,'财会系','沈小霞','女','助教','2号楼202');
INSERT INTO READER VALUES(124,'财会系','朱  海','男','讲师','2号楼210');
INSERT INTO READER VALUES(125,'财会系','马英明','男','副教授','2号楼212');
INSERT INTO BORROW VALUES(112,445501,'2006-3-19');
INSERT INTO BORROW VALUES(125,332211,'2006-2-12');
INSERT INTO BORROW VALUES(111,445503,'2006-8-21');
INSERT INTO BORROW VALUES(112,112266,'2006-3-14');
INSERT INTO BORROW VALUES(114,665544,'2006-10-21');
INSERT INTO BORROW VALUES(120,114455,'2006-11-02');
INSERT INTO BORROW VALUES(120,118801,'2006-10-18');
INSERT INTO BORROW VALUES(119,446603,'2006-11-12');
INSERT INTO BORROW VALUES(112,449901,'2006-10-23');
INSERT INTO BORROW VALUES(115,449902,'2006-8-21');
INSERT INTO BORROW VALUES(118,118801,'2006-9-10');