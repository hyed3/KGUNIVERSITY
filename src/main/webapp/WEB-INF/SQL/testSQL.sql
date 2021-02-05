
DROP TABLE test;
CREATE TABLE test(
	flag		NUMBER(1),
	id			VARCHAR2(20)	PRIMARY KEY,
	pw			VARCHAR2(16),
	nickname	VARCHAR2(20),
	tel			VARCHAR2(13)
);
INSERT INTO test VALUES(1, 'imAdmin', 'admin1234', '관리자', '010-1111-2222');
INSERT INTO test VALUES(2, 'imStudent1', 'stu1234', '학생1', '010-3333-4444');
INSERT INTO test VALUES(2, 'imStudent2', 'stu4321', '학생2', '010-5555-6666');

SELECT * FROM test;
COMMIT;