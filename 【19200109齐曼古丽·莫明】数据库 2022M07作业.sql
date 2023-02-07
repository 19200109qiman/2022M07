CREATE TABLE book
(bnumber CHAR(13) NOT NULL PRIMARY KEY,
bnameVARCHAR(50) NOT NULL,
btypenumber CHAR(7) NOT NULL,
badithor CHAR (10) NOT NULL,
bedition CHAR(30),
bprice MONEY NOT NULL CHECK (bprice>'0' ),
CONSTRAINT Book_Borrow_fkflh FOREIGN KEY(btypenumber) REFERENCES booktype(btypenumber)
)

CREATE TABLE booktype
(btypenumber CHAR(7) NOT NULL PRIMARY KEY,
btypenameCHAR(20) NOT NULL,
bmiaoshuVARCHAR(50)
)

CREATE TABLE reader
( zhengjianhao CHAR (10 ) NOT NULL PRIMARY KEY,
duzhename CHAR(8) NOT NULL,
zhengjianzhuangtai CHAR(4) NOT NULL CHECK(zhengjianzhuangtai IN('可用' , '失效')
lianxi CHAR(11)
)

CREATE TABLE jieyue
（   zhengjianhao CHAR(10) NOT NULL,
      bnumber CHAR(13) NOT NULL,
      jieyuedate DATE NOT NULL,
     yinghuandate DATE NOT NULL,
     guihuandate DATE,
     fakuanjin MONEY NOT NULL DEFAULT '0.0’CHECK ( fakuanjin >= '0.0')，
CONSTRAINT Book_Borrow_pkzjsh PRIMARY KEY ( zhengjianhao , bnumber, jieyuedate )，
CONSTRAINT Book_Borrow_fkzjh FORETGN KEY ( zhengjianhao ) REFERENCES reader( zhengjianhao),
CONSTRAINT Book_Borrow_fktsbh FOREIGN KEY ( bnumber ) REFERENCES book( bnumber )
)

ALTER TABLE reader ALTER COLUMN zhengjianzhuangtai SET DEFAULT ('可用');
ALTER TABLE reader ADD COLUMN phone CHAR(12);
ALTER TABLE reader DROP COLUMN lianxi ;
ALTER TABLE book ALTER COLUMN bname TYPE VARCHAR(50);
DROP TABLE booktype CASCADE;


SELECT book. bnumber,
     book.bname,
     book.btypenumber,
     book.badithor,
     book.bedition,
     book.bprice,
     booktype.btypename
  FROM book,
    booktype
 WHERE book.btypenumber = booktype.btypenumber 

CREATE VIEW duzhejieshuqingkuang(zhengjianhao ,duzhename，bname，jieyuedate)
AS
         SELECT reader.zhengjianhao ,reader.duzhename , book. bname,jieyue.jieyuedate
         FROM reader , book,jieyue
         WHERE reader .zhengjianhao=jieyue.zhengjianhao
                   AND book. bnumber=jieyue. bnumber;

