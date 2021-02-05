
DROP TABLE Freeboard_Comment;
CREATE TABLE Freeboard_Comment(
	contentNum      NUMBER,
    FBC_seq         NUMBER			PRIMARY KEY,
	userID		    VARCHAR2(20),
	userNickname	VARCHAR2(50),
	boardComment	NVARCHAR2(500),
	regDate		    VARCHAR2(30),
    commentPW       NVARCHAR2(8)
);
DROP SEQUENCE FBC_seq;
CREATE SEQUENCE FBC_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;
    
SELECT * FROM Freeboard_Comment
ORDER BY FBC_seq;

COMMIT;

