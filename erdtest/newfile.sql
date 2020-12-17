SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE board
(
	-- �Խù� ��ȣ �⺻Ű
	num int NOT NULL COMMENT '�Խù� ��ȣ �⺻Ű',
	name varchar(30),
	subject varchar(200),
	content varchar(2000),
	id varchar(10) NOT NULL,
	PRIMARY KEY (num)
);


CREATE TABLE member
(
	id varchar(10) NOT NULL,
	pass varchar(20),
	nickname varchar(20),
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES member (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



