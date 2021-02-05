DROP TABLE Notice_Comment;
CREATE TABLE Notice_Comment(
	contentNum      NUMBER,
    NTC_seq         NUMBER			PRIMARY KEY,
	userID		    VARCHAR2(20),
	userNickname	VARCHAR2(50),
	boardComment	NVARCHAR2(500),
	regDate		    VARCHAR2(30),
    commentPW       NVARCHAR2(8)
);
DROP SEQUENCE NTC_seq;
CREATE SEQUENCE NTC_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE;
    
SELECT * FROM Notice_Comment
ORDER BY NTC_seq;
COMMIT;

