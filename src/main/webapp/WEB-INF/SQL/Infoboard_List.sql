DROP TABLE Infoboard_List;
CREATE TABLE Infoboard_List(
    IBN_seq         NUMBER      PRIMARY KEY,
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

DROP SEQUENCE IBN_seq;
CREATE SEQUENCE IBN_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;

SELECT * FROM Infoboard_List
ORDER BY IBN_seq desc;
COMMIT;


