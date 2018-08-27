CREATE TABLE board_cafe(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER, 
regdate DATE
);

CREATE SEQUENCE board_cafe_seq;

-- 댓글 정보를 저장할 테이블
CREATE TABLE board_cafe_comment(
	num NUMBER PRIMARY KEY,		-- 댓글의 글번호
	writer VARCHAR2(100),		-- 댓글 작성자
	content VARCHAR2(500),		-- 댓글 내용
	target_id VARCHAR2(100),	-- 댓글의 대상이 되는 아이디(글작성자)
	ref_group NUMBER,			-- 댓글 그룹번호
	comment_group NUMBER,		-- 원글에 달린 댓글 내에서의 그룹번호
	regdate DATE				-- 등록일
	, deldate date				-- 삭제일
);

-- sequece 안만들고 bard_cafe_seq  같이 사용함.  CREATE SEQUENCE board_cafe_comment_seq;
drop table board_recommend;

alter table board_cafe_comment drop deleteYn;

alter table board_cafe_comment add ( deldate date);


-- sequence를 하나로 사용해서 가능함.
CREATE TABLE board_recommend(
	num NUMBER NOT NULL,			-- 글번호
	recommender VARCHAR2(100)  NOT NULL,		-- 추천자
	regdate	DATE					-- 추천일
);

ALTER TABLE board_recommend ADD  CONSTRAINT pk_board_recommend  PRIMARY KEY (num, recommender);

select * from board_cafe_comment;

select  num, writer, 
		LAG(num,1,0) OVER (ORDER BY num DESC) AS prevNum,
		LEAD(num,1,0) OVER (ORDER BY num DESC) AS nextNum
from board_cafe
order by num desc


select * 
from (
	select  num, writer, 
			LAG(num,1,0) OVER (ORDER BY num DESC) AS prevNum,
			LEAD(num,1,0) OVER (ORDER BY num DESC) AS nextNum
	from board_cafe
	order by num desc
) a
where num=8;


select  num, writer, 
		LAG(num,1,0) OVER (ORDER BY num DESC) AS prevNum,
		LEAD(num,1,0) OVER (ORDER BY num DESC) AS nextNum
from board_cafe
where num=8;


select * from board_cafe_comment;


SELECT board_cafe_seq.NEXTVAL 
		FROM   DUAL;
		
SELECT num, writer, content, target_id, ref_group, comment_group, 
	   TO_CHAR(regdate, 'YYYY.MM.DD HH24:MI') AS regdate,
	   (SELECT MAX(ROWNUM) FROM board_recommend X WHERE X.num= b.num) AS recommendCnt
FROM   board_cafe_comment b		
where b.num=41
ORDER BY comment_group ASC, num ASC
;


delete from board_gallery where num=32;