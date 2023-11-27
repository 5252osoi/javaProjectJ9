show tables;

create table member(
	idx		int not null auto_increment primary key,
	mid		varchar(30) not null,
	pwd		varchar(100) not null,
	nickName varchar(20) not null,
	name	varchar(20) not null,
	email	varchar(60),
	tel		varchar(13),
	pr		text,
	userInfor char(3) default '공개',
	userDel char(2) default 'NO',
	post int default 0,
	follow int default 0,
	follower int default 0,
	unique(nickName)
);

desc member;
select * from member;
insert into member values(default,'admin@naver.com','1234','관리자','박관리','admin@naver.com','010-9999-1111','관리자입니다.',default,default,default,default,default);