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
