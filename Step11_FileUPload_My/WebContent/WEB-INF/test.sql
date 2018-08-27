SELECT * FROM MEMBER;

delete from board_gallery;

drop sequence board_gallery_seq;

delete from board_guest where writer is null;