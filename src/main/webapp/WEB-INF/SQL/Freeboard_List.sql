DROP TABLE Freeboard_List;
CREATE TABLE Freeboard_List(
    FBN_seq         NUMBER      PRIMARY KEY,
    type            VARCHAR2(20),		-- 말머리
    title           NVARCHAR2(50),		-- 제목
    content         NVARCHAR2(1200),	-- 내용
    userID          VARCHAR2(20),		-- 작성자ID
    userNickname    NVARCHAR2(50),		-- 작성자닉네임
    regDate         VARCHAR2(30),		-- 등록일
    modifyDate      VARCHAR2(30),		-- 수정일
    hit             NUMBER(10),			-- 조회수
    commentCnt      NUMBER(10),			-- 댓글수
    contentPW       NVARCHAR2(8),		-- 글비밀번호
    imgName         VARCHAR2(300)		-- 등록된사진이름
);

DROP SEQUENCE FBN_seq;
CREATE SEQUENCE FBN_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;

SELECT * FROM Freeboard_List
ORDER BY FBN_seq desc;

COMMIT;


INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title1', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title2', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title3', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title4', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title5', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title6', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title7', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title8', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title9', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title10', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title11', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title12', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title13', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title14', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title15', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title16', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title17', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title18', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title19', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title20', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title21', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title22', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title23', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title24', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title25', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title26', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title27', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title28', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title29', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title30', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title31', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title32', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title33', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title34', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title35', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title36', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title37', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title38', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title39', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title40', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title41', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title42', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title43', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title44', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title45', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title46', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title47', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title48', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title49', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title50', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title51', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title52', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title53', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title54', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title55', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title56', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title57', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title58', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title59', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title60', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title61', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title62', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title63', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title64', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');
INSERT INTO Freeboard_List VALUES(FBN_seq.NEXTVAL, 'standard', 'title65', 'content1', '', '익명', TO_CHAR(SYSDATE, 'yy/mm/dd hh24:mi:ss'), '', 0, 0, '', '');

