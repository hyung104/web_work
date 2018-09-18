CREATE TABLE friend (
 num NUMBER PRIMARY KEY,
 name VARCHAR2(20),
 phone VARCHAR2(20),
 regdate DATE
);

CREATE SEQUENCE friend_seq;


INSERT INTO friend(num, name, phone, regdate) VALUES (friend_seq.NEXTVAL, '김구라', '010-1111-2222', SYSDATE);
INSERT INTO friend(num, name, phone, regdate) VALUES (friend_seq.NEXTVAL, '해골', '010-3333-4444', SYSDATE);
INSERT INTO friend(num, name, phone, regdate) VALUES (friend_seq.NEXTVAL, '원숭이', '010-5555-6666', SYSDATE);


SELECT num,name,phone,regdate
FROM friend
ORDER BY num DESC;
