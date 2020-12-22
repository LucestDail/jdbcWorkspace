SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS activity_encounter;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS member;




/* Create Tables */

CREATE TABLE activity_encounter
(
	board_num int(10) NOT NULL,
	member_id varchar(20) NOT NULL
);


CREATE TABLE board
(
	board_num int(10) NOT NULL,
	member_id varchar(20) NOT NULL,
	-- 0, �Ϲ�
	-- 1, ����
	board_notice_able int COMMENT '0, �Ϲ�
1, ����',
	board_subject varchar(100) DEFAULT 'NULL',
	board_content varchar(4000) DEFAULT 'NULL',
	board_attached_file varchar(2000) DEFAULT 'NULL',
	board_regdate datetime DEFAULT NULL,
	board_readcnt int(10) DEFAULT NULL,
	-- 0, ��ȭ ����
	-- 1, ���� ����
	-- 2, ���� �ٴ�
	-- 3, ���� ����
	-- 4, Ȱ�� ����
	board_type int COMMENT '0, ��ȭ ����
1, ���� ����
2, ���� �ٴ�
3, ���� ����
4, Ȱ�� ����',
	-- 0, Ȱ�� �غ�
	-- 1, Ȱ�� ��
	-- 2, Ȱ�� �Ϸ�
	-- 3, Ȱ�� ����
	activity_able int COMMENT '0, Ȱ�� �غ�
1, Ȱ�� ��
2, Ȱ�� �Ϸ�
3, Ȱ�� ����',
	activity_type varchar(2000),
	-- 0, ������
	-- 1, ����
	give_state int COMMENT '0, ������
1, ����',
	give_type int,
	-- 0, �Ϲ� ����
	-- 1, �̺�Ʈ
	-- 2, �û�ȸ
	-- 3, ��Ÿ
	information_type int COMMENT '0, �Ϲ� ����
1, �̺�Ʈ
2, �û�ȸ
3, ��Ÿ',
	-- 0 ~ 4 : ���� Ÿ��
	-- 5 ~ 9 : ���� Ÿ��
	give_information_type int COMMENT '0 ~ 4 : ���� Ÿ��
5 ~ 9 : ���� Ÿ��',
	area_name varchar(2000),
	area_xpoint varchar(20),
	area_ypoint varchar(20),
	area_name_specific varchar(2000),
	date_start_date datetime,
	date_end_date datetime,
	score_category_a int(3),
	score_category_b int(3),
	score_category_c int(3),
	score_category_d int(3),
	alert_count int(10),
	recommand_count int(20),
	not_recommand_count int(20),
	movie_subject varchar(200) NOT NULL,
	movie_id int(10),
	PRIMARY KEY (board_num)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE comment
(
	member_id varchar(20) NOT NULL,
	board_num int(10) NOT NULL,
	-- ���� �ð�
	comment_regdate time COMMENT '���� �ð�',
	comment_content varchar(200),
	alert_count int(10),
	recommand_count int(20),
	not_recommand_count int(20)
);


CREATE TABLE member
(
	member_id varchar(20) NOT NULL,
	-- 0, ������ �ƴ�
	-- 1, ������ ��
	member_is_admin int COMMENT '0, ������ �ƴ�
1, ������ ��',
	member_password varchar(20) NOT NULL,
	member_nickname varchar(20),
	member_gender int(2) DEFAULT NULL,
	member_age varchar(20) DEFAULT 'NULL',
	member_email varchar(100) DEFAULT 'NULL',
	-- 0, ���� ����
	-- 1, ���� �Ұ�
	member_email_receive_ok int COMMENT '0, ���� ����
1, ���� �Ұ�',
	member_picture varchar(200) DEFAULT 'NULL',
	member_introduction varchar(2000),
	member_movie_point int(20),
	member_information_point int(20),
	member_activity_point int(20),
	member_give_point int(20),
	member_theater_point int(20),
	PRIMARY KEY (member_id)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


CREATE TABLE movie
(
	member_id varchar(20) NOT NULL,
	movie_id int(10) NOT NULL,
	movie_subject varchar(200),
	movie_regdate datetime,
	-- 0, ������
	-- 1, ���ƿ�
	movie_like int COMMENT '0, ������
1, ���ƿ�',
	-- 0, �Ⱥ�
	-- 1, ��
	movie_watched int COMMENT '0, �Ⱥ�
1, ��',
	-- 0, ��̾���
	-- 1, �������
	movie_will_watch int COMMENT '0, ��̾���
1, �������'
);



/* Create Foreign Keys */

ALTER TABLE activity_encounter
	ADD FOREIGN KEY (board_num)
	REFERENCES board (board_num)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (board_num)
	REFERENCES board (board_num)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE activity_encounter
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE movie
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



