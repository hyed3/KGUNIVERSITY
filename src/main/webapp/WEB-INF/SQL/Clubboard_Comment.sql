
DROP TABLE Clubboard_Comment;
CREATE TABLE Clubboard_Comment(
	contentNum      NUMBER,
    CBC_seq         NUMBER			PRIMARY KEY,
	userID		    VARCHAR2(20),
	userNickname	VARCHAR2(50),
	boardComment	NVARCHAR2(500),
	regDate		    VARCHAR2(30),
    commentPW       NVARCHAR2(8)
);
DROP SEQUENCE CBC_seq;
CREATE SEQUENCE CBC_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;
    
SELECT * FROM Clubboard_Comment
ORDER BY CBC_seq;
COMMIT;

