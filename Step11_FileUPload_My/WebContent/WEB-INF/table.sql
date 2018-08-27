
CREATE TABLE board_file(
num NUMBER PRIMARY KEY, -- 파일번호
writer VARCHAR2(100), -- 작성자
title VARCHAR2(100), -- 제목
orgFileName VARCHAR2(100), -- 원본파일명
saveFileName VARCHAR2(100), -- 파일 시스템에 저장된 파일명
fileSize NUMBER, -- 파일의 크기(byte)
downCount NUMBER DEFAULT 0, -- 다운로드 횟수
regdate DATE -- 등록일 
);

CREATE SEQUENCE board_file_seq;


CREATE TABLE board_gallery(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100),
caption VARCHAR2(200),
imagePath VARCHAR2(100),
regdate DATE
);

CREATE SEQUENCE board_gallery_seq;

