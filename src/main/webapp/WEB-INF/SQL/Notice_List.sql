DROP TABLE Notice_List;
CREATE TABLE Notice_List(
    NTN_seq         NUMBER      PRIMARY KEY,
    type            VARCHAR2(20),
    title           NVARCHAR2(50),
    content         NVARCHAR2(1200),
    userID          VARCHAR2(20),
    userNickname    NVARCHAR2(50),
    regDate         VARCHAR2(30),
    modifyDate      VARCHAR2(30),
    hit             NUMBER(10),
    commentCnt      NUMBER(10),
    contentPW       NVARCHAR2(8),
    imgName         VARCHAR2(300)
);

DROP SEQUENCE NTN_seq;
CREATE SEQUENCE NTN_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;

SELECT * FROM Notice_List
ORDER BY NTN_seq desc;
COMMIT;

