DROP TABLE Clubboard_List;
CREATE TABLE Clubboard_List(
    CBN_seq         NUMBER      PRIMARY KEY,
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

DROP SEQUENCE CBN_seq;
CREATE SEQUENCE CBN_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;

SELECT * FROM Clubboard_List
ORDER BY CBN_seq desc;
COMMIT;

