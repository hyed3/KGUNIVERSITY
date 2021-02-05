DROP TABLE member;

CREATE TABLE member(
    userId varchar2(20) primary key,
    userPw varchar2(255) not null,
    userName varchar2(20) not null,
    email varchar2(200) not null unique,
    nickname varchar2(50) unique,
    major varchar2(255),
    joinDate date default sysdate,
    verification number(1) default 0   -- 0:인증X 1:인증O
);

INSERT INTO member (userId, userPw, userName, email, nickname, verification) VALUES ('aaa','111','김가희','gahee3839@naver.com','김김김',1);
INSERT INTO member (userId, userPw, userName, email, nickname,verification) VALUES ('bbb','222','김가영','ga3839@naver.com','영영영',0);
select * from member ORDER BY joinDate DESC;

commit;
