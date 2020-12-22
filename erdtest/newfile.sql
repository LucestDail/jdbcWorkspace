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
	-- 0, 일반
	-- 1, 공지
	board_notice_able int COMMENT '0, 일반
1, 공지',
	board_subject varchar(100) DEFAULT 'NULL',
	board_content varchar(4000) DEFAULT 'NULL',
	board_attached_file varchar(2000) DEFAULT 'NULL',
	board_regdate datetime DEFAULT NULL,
	board_readcnt int(10) DEFAULT NULL,
	-- 0, 영화 세상
	-- 1, 극장 마실
	-- 2, 정보 바다
	-- 3, 나눔 누리
	-- 4, 활동 마다
	board_type int COMMENT '0, 영화 세상
1, 극장 마실
2, 정보 바다
3, 나눔 누리
4, 활동 마다',
	-- 0, 활동 준비
	-- 1, 활동 중
	-- 2, 활동 완료
	-- 3, 활동 중지
	activity_able int COMMENT '0, 활동 준비
1, 활동 중
2, 활동 완료
3, 활동 중지',
	activity_type varchar(2000),
	-- 0, 진행중
	-- 1, 마감
	give_state int COMMENT '0, 진행중
1, 마감',
	give_type int,
	-- 0, 일반 정보
	-- 1, 이벤트
	-- 2, 시사회
	-- 3, 기타
	information_type int COMMENT '0, 일반 정보
1, 이벤트
2, 시사회
3, 기타',
	-- 0 ~ 4 : 나눔 타입
	-- 5 ~ 9 : 정보 타입
	give_information_type int COMMENT '0 ~ 4 : 나눔 타입
5 ~ 9 : 정보 타입',
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
	-- 현재 시간
	comment_regdate time COMMENT '현재 시간',
	comment_content varchar(200),
	alert_count int(10),
	recommand_count int(20),
	not_recommand_count int(20)
);


CREATE TABLE member
(
	member_id varchar(20) NOT NULL,
	-- 0, 관리자 아님
	-- 1, 관리자 임
	member_is_admin int COMMENT '0, 관리자 아님
1, 관리자 임',
	member_password varchar(20) NOT NULL,
	member_nickname varchar(20),
	member_gender int(2) DEFAULT NULL,
	member_age varchar(20) DEFAULT 'NULL',
	member_email varchar(100) DEFAULT 'NULL',
	-- 0, 수신 가능
	-- 1, 수신 불가
	member_email_receive_ok int COMMENT '0, 수신 가능
1, 수신 불가',
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
	-- 0, 무반응
	-- 1, 좋아요
	movie_like int COMMENT '0, 무반응
1, 좋아요',
	-- 0, 안봄
	-- 1, 봄
	movie_watched int COMMENT '0, 안봄
1, 봄',
	-- 0, 흥미없음
	-- 1, 흥미있음
	movie_will_watch int COMMENT '0, 흥미없음
1, 흥미있음'
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



