DROP TABLE Infoboard_Comment;
CREATE TABLE Infoboard_Comment(
	contentNum      NUMBER,
    IBC_seq         NUMBER			PRIMARY KEY,
	userID		    VARCHAR2(20),
	userNickname	VARCHAR2(50),
	boardComment	NVARCHAR2(500),
	regDate		    VARCHAR2(30),
    commentPW       NVARCHAR2(8)
);
DROP SEQUENCE IBC_seq;
CREATE SEQUENCE IBC_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;
    
SELECT * FROM Infoboard_Comment
ORDER BY IBC_seq;
COMMIT;

