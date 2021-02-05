drop table book CASCADE CONSTRAINTS PURGE;
drop table book_purchase CASCADE CONSTRAINTS PURGE;

--책 정보
CREATE TABLE BOOK(
book_num int not null,
book_picture varchar2(300),
book_name varchar2(100) primary key,
book_writer varchar2(50),
book_price int,
book_info clob,
book_mokcha clob,
book_inventory int
);


--구매정보
CREATE TABLE BOOK_PURCHASE(
purchase_num int not null primary key,
user_id varchar2(100),
book_picture varchar2(300),
book_name varchar2(100),
book_amount int,
purchase_date date default sysdate
);

drop SEQUENCE book_num_seq;
drop SEQUENCE purchase_num_seq;
create SEQUENCE book_num_seq start with 1;
create SEQUENCE purchase_num_seq start with 1;