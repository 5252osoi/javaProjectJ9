<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins&display=swap');
*{
    font-family: 'poppins', sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    list-style: none;
    text-decoration: none;
}
body{
    letter-spacing: 0.5px;
}
footer {
    position: fixed;
    height: 50px;
    bottom: 0;
    width: 100%;
}
::-webkit-scrollbar{
    width: 8px;
}
::-webkit-scrollbar-track{
	background-color: #dddddd;
}
::-webkit-scrollbar-thumb{
	background-color: #888888;
}
:root{
    --gradient: linear-gradient(to right, #e2336b, #fcac46);
}
.sidebar {
    position: fixed;
    width: 245px;
    height: 100vh;
    padding: 20;
    z-index: 1000;
   /*  background-color: grey; */
    border-right: 1px solid #ddd;
}
.logo img{
	position:absolute;
    width:105px;
    margin-top: 2.3rem;
    margin-left: 1.6rem;
}
.logoicon i{
	position:absolute;
    margin-top: 2rem;
    margin-left: 1.6rem;
}
.profile{
    display: flex;
    align-items: center;
    flex-direction: column;
    justify-content: center;
    margin-top: 1.4rem;
}
.profile-img{
    display: flex;
    align-items: center;
    justify-content: center;
/*     border-radius: 50%;
    width: 25px;
    height: 25px;
    border: 2px solid #e2336b;  */
}
.profile-img img{
    width: 25px;
    height: 25px;
    object-fit: cover;
    border-radius: 50%;
    object-position: center;
}
.name{
    display: flex;
    align-items: center;
    margin: 1rem 0 0.4rem;
}
.name h1{
    font-size: 1.1rem;
}
.name img{
    margin-left: 4px;
    width: 20px;
    object-fit: cover;
}
.navbar{
	margin-top:100px;
	width:100%;
}
.navbar-nav{
	width:100%
}
.nav-item{
	width:100%
}
.nav-item button{
	background-color:white;
	border:none;
	height:45px;
	width:97%;
	margin: 0 auto;
	margin-bottom:10px;
}

/*버튼 내부 폰트 사이즈*/

.btntext{
	font-size:11pt;
}
i {
	font-size:22pt;
}
.sidebar .bottom-nav{
	position:fixed;
	bottom:0;
	max-width: 245px;
}
/*hr태그안에 글쓰기*/
.hr-sect {
	display: flex;
	flex-basis: 100%;
	align-items: center;
	color: rgba(0, 0, 0, 0.35);
	font-size: 12px;
	margin: 8px 0px;
}
.hr-sect::before,
.hr-sect::after {
	content: "";
	flex-grow: 1;
	background: rgba(0, 0, 0, 0.35);
	height: 1px;
	font-size: 0px;
	line-height: 0px;
	margin: 0px 16px;
}


</style>