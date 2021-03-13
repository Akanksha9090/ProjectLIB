CREATE database BB;
use BB;
CREATE TABLE BOOKKS
 (
book_id VARCHAR(10),
book_title VARCHAR(40),
edition VARCHAR(40),
pub_name VARCHAR(40),
availability BOOL,
 num_of_copies INTEGER,
state VARCHAR(40),
catalog_number INTEGER,
ro_number INTEGER,
acttive BOOL,
created_by VARCHAR(40), 
update_by VARCHAR(40),
CONSTRAINT PK_books PRIMARY KEY (book_id)
);

INSERT INTO BOOKKS VALUES('D001','Zohra','2nd','NEYAT',1,2,'excellent',4,5,1,'DANIEL','DANIEL');
INSERT INTO BOOKKS VALUES('D002','Sherlock','3rd','WILLIAMSS',3,4,'excellent',5,4,1,'NORA','NORA');
INSERT INTO BOOKKS VALUES('D003','THE SHOW','4th','KYLA',3,3,'excellent',9,9,1,'BG','BG');
SELECT * FROM BOOKK;
CREATE TABLE borow__transaction 
(

borrow_transaction_id varchar(40),
librarian_id varchar(40),
book_id varchar(40),
member_id varchar(40),
borrowed_datetime DATETIME,
returned_datetime DATETIME,
borrowed_by VARCHAR(40),
returned_by VARCHAR(40),
date_due DATE,
is_returned BOOL,
CONSTRAINT PK_borrow_transaction PRIMARY KEY (borrow_transaction_id)
);
INSERT INTO borow__transaction VALUES('A01','L01','B001','M01','2011-02-02 10:03:01','2011-04-22 11:03:01','SANA','SANA','2011-03-09',1);
INSERT INTO borow__transaction VALUES('A02','L02','B002','M02','2010-02-03 12:03:01','2010-04-22 09:03:01','Soha','Soha','2010-03-09',1);
INSERT INTO borow__transaction VALUES('A03','L03','B003','M03','2013-09-02 10:03:02','2013-04-22 12:03:01','rama','rama','2011-03-09',1);
 CREATE TABLE libra_rian 
 (
librarian_id varchar(40),
 Nme VARCHAR(40),
user_name VARCHAR(40),
pass_word VARCHAR(40),
created_by VARCHAR(40),
updated_by VARCHAR(40),
ac_tive BOOL,
CONSTRAINT PK_librarian PRIMARY KEY (librarian_id)
);
INSERT INTO libra_rian VAlUES('L01','Story','abc','1234','DYEN','DYEN',1);
INSERT INTO libra_rian VAlUES('L02','Story','dsw','1224','LAREA','LAREA',1);
INSERT INTO libra_rian VAlUES('L03','Story','xyz','4321','RYNA','RYNA',1);
SELECT * FROM libra_rian;
CREATE TABLE mem_bers_
(
member_id VARCHAR(40),
external_id VARCHAR(40),
member_type VARCHAR(40),
member_name VARCHAR(40),
phone_number VARCHAR(40),
gender VARCHAR(40),
ac_tive BOOL,
created_by VARCHAR(40),
updated_by VARCHAR(40),
CONSTRAINT PK_members PRIMARY KEY (member_id)
);
INSERT INTO mem_bers_ VALUES('M01','E01','Permanent','HARI','9832011805','MALE',1,'SANA','SANA');
INSERT INTO mem_bers_ VALUES('M02','E02','Student','RAVI','9832211805','MALE',1,'HANA','HANA');
INSERT INTO mem_bers_ VALUES('M04','E03','Permanent','KIARA','9434456398','FEMALE',1,'ZARA','ZARA');
 CREATE TABLE member_ship
 (
librarian_id VARCHAR(40),
member_id VARCHAR(40),
registred_datetime DATETIME,
registered_by VARCHAR(40),
membership_status BOOL,
membership_expiry_date DATE,
PRIMARY KEY (librarian_id, member_id)
);
INSERT INTO member_ship VALUES('L01','M01','2016-06-03 10:04:02','September',1,'2016-07-03');
INSERT INTO member_ship VALUES('L02','M02','2016-08-03 12:04:02','October',1,'2017-07-03');
INSERT INTO member_ship VALUES('L03','M03','2012-06-03 11:04:02','August',1,'2012-07-03');
CREATE TABLE fined_transactionss
(
fined_transaction_id VARCHAR(40),
member_id VARCHAR(40),
librarian_id VARCHAR(40),
borrow_transaction_id VARCHAR(40),
amount_added VARCHAR(40),
amount_received VARCHAR(40),
created_by VARCHAR(40),
CONSTRAINT PK_fined_transactions PRIMARY KEY (fined_transaction_id)
);
INSERT INTO fined_transactionss VALUES('F01','M01','L01','B001','10,000','12,000','XARA');
INSERT INTO fined_transactionss VALUES('F02','M02','L02','B002','9,000','4,000','LARA');
INSERT INTO fined_transactionss VALUES('F03','M03','L03','B003','4000','12,000','BROOKS');
SELECT * FROM fined_transactionss;

ALTER TABLE borrow_transaction ADD CONSTRAINT books_borrow_transaction 
FOREIGN KEY (book_id) REFERENCES books(book_id);

ALTER TABLE borrow_transaction ADD CONSTRAINT librarian_borrow_transaction
FOREIGN KEY (librarian_id) REFERENCES librarian(librarian_id);

ALTER TABLE borrow_transaction ADD CONSTRAINT members_borrow_transaction
 FOREIGN KEY (member_id) REFERENCES members(member_id);

ALTER TABLE membership ADD CONSTRAINT librarian_membership
FOREIGN KEY (librarian_id) REFERENCES librarian(librarian_id);

ALTER TABLE fined_transactions ADD CONSTRAINT borrow_transaction_fined_transactions
FOREIGN KEY (borrow_transaction_id) REFERENCES borrow_transaction(borrow_transaction_id);

ALTER TABLE fined_transactions ADD CONSTRAINT members_fined_transactions 
FOREIGN KEY (member_id) REFERENCES members(member_id);


SELECT member_id,librarian_id,amount_added from fined_transactionss
WHERE amount_added>5;

SELECT member_type, member_name from mem_bers_ WHERE member_type!='student';

SELECT member_name,member_type,gender FROM mem_bers_ ORDER BY member_name DESC;

SELECT book_title, pub_name FROM BOOKKS WHERE pub_name LIKE '%NEYAT%';