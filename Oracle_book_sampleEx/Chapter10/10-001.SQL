CREATE TABLE TEST13 (
  LEV    VARCHAR2(02) NOT NULL,
  FPOINT NUMBER       NOT NULL,
  TPOINT NUMBER       NOT NULL,
  GIFT   VARCHAR2(40) NOT NULL,
  CONSTRAINT TEST13_PK PRIMARY KEY (LEV)
);
INSERT INTO TEST13 VALUES ('01',         0,     10000,'엽서');
INSERT INTO TEST13 VALUES ('02',     10001,     50000,'볼펜');
INSERT INTO TEST13 VALUES ('03',     50001,    100000,'공중전화카드');
INSERT INTO TEST13 VALUES ('04',    100001,    200000,'머그컵');
INSERT INTO TEST13 VALUES ('05',    200001,    300000,'손전등');
INSERT INTO TEST13 VALUES ('06',    300001,    500000,'찾잔세트');
INSERT INTO TEST13 VALUES ('07',    500001,    700000,'휴대용가스버너');
INSERT INTO TEST13 VALUES ('08',    700001,   1000000,'도서상품권');
INSERT INTO TEST13 VALUES ('09',   1000001,   1500000,'녹차세트');
INSERT INTO TEST13 VALUES ('10',   1500001,   2000000,'소형청소기');
INSERT INTO TEST13 VALUES ('11',   2000001,   3000000,'옷걸이');
INSERT INTO TEST13 VALUES ('12',   3000001,   5000000,'구두상품권');
INSERT INTO TEST13 VALUES ('13',   5000001,   7000000,'콘도이용권');
INSERT INTO TEST13 VALUES ('14',   7000001,  10000000,'PCS무료가입권');
INSERT INTO TEST13 VALUES ('15',  10000001,  20000000,'갈비세트');
INSERT INTO TEST13 VALUES ('16',  20000001,  30000000,'굴비세트');
INSERT INTO TEST13 VALUES ('17',  30000001,  50000000,'의류교환권');
INSERT INTO TEST13 VALUES ('18',  50000001,  70000000,'TV');
INSERT INTO TEST13 VALUES ('19',  70000001, 100000000,'AUDIO');
INSERT INTO TEST13 VALUES ('20', 100000001, 200000000,'COMPUTER');
CREATE TABLE TEST14 (
  CUST   VARCHAR2(14) NOT NULL,
  POINT  NUMBER       NOT NULL,
  CONSTRAINT TEST14_PK PRIMARY KEY (CUST)
);
INSERT INTO TEST14 VALUES('721101-2144952',    809910);
INSERT INTO TEST14 VALUES('721109-2144952',   1439688);
INSERT INTO TEST14 VALUES('710125-1144951',   3608860);
INSERT INTO TEST14 VALUES('701212-1143211',   8996280);
INSERT INTO TEST14 VALUES('650207-1765152',  20239650);
INSERT INTO TEST14 VALUES('672102-2123452',  40935040);
INSERT INTO TEST14 VALUES('500823-1132762',  75636408);
INSERT INTO TEST14 VALUES('771201-2233445', 129855120);
INSERT INTO TEST14 VALUES('680801-1234455',  10059470);
INSERT INTO TEST14 VALUES('620908-2121232', 123674200);
COMMIT;

