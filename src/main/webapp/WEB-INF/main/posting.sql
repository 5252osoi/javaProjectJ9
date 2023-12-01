show tables;

create table posting (
	idx		int not null auto_increment,	/*게시글고유번호*/
	mid		varchar(60) not null,			/*글쓴이(세션아이디*/
	fName	varchar(200) not null,			/*업로드시 파일명*/
	fSName	varchar(200) not null,			/*서버 저장시 파일명*/
	fSize	int not null,					/*업로드 한 파일사이즈*/
	content text not null,					/*글 내용*/
	hostIp	varchar(50) not null,			/*작성자IP*/
	openSw	char(6) default	'공개',			/*게시글 공개설정*/
	likes	int default 0,					/*좋아요 수*/
	wDate	datetime default now(),			/*작성일*/
	primary key(idx)
);
desc posting;
select * from posting order by idx desc;

/* 게시판에 댓글 달기 */
create table postReply (
	idx     	int not null auto_increment,	/* 댓글의 고유번호 */
	postIdx		int not null,					/* 원본글(부모글)의 고유번호(외래키로 설정) */
	mid			varchar(30) not null,			/* 댓글 올린이의 아이디 */
	nickName	varchar(30) not null,			/* 댓글 올린이의 닉네임 */
	wDate		datetime default now(),			/* 댓글 올린 날짜 */
	hostIp		varchar(50) not null,			/* 댓글 올린 PC의 고유 IP */
	content		text not null,					/* 댓글 내용 */  
	primary key(idx),
	foreign key(postIdx) references posting(idx)
	on update cascade							/* 부모필드를 수정하면 함께 영향을 받는다. */
	on delete restrict							/* 부모필를 함부로 삭제할수 없다. */
);
desc postReply;