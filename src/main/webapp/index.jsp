<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Instagram clone login</title>
	<jsp:include page="/include/bs4.jsp"/>
		<!--아이콘,css-->
	<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
	<link rel="stylesheet" href="${ctp}/include/style.css">
	<!---->
	<style>
		 	/* 450px 이상이면 body 상단여백이 200px */
		@media ( min-width : 450px) {
			body {
				margin-top: 200px;
			}
		}
	    /* 875xp이하면 id="hidden"*/
	    /* id="860px의 최대 넓이가 400px로 변경됩니다."*/
		@media ( max-width : 875px) {
			#hidden {
				display: none;
			}
			#875px{
				max-width:400px;
			}
		}
		#download:hover{
			cursor:pointer;
		}
		
	</style>
</head>
<body>
	<div class="container-fluid p-0 justify-content-center">
		<div class="row mx-auto p-0" id="875px" style="max-width:800px">
			<div class="col mx-auto p-0 justify-content-center align-items-center " id="hidden" style="max-width: 400px; height: 500px;">
				<img src="${ctp}/images/loginimg.png"/>
			</div>
			
			<div class="col mx-auto p-0 m-0" style="max-width:400px; height:500px;">
				<div class="row border p-0 m-0 justify-content-center" style="width:350px; height:400px;">
					<!-- 로고 -->
					<div class="text-center pt-5" style="height:135px; width:100%">
						<img style="width:175px; vertical-align:middle;" src="${ctp}/images/instagram_text.png"/>
					</div>
					<!-- 로그인폼 -->
					<form name="myform" id="myform" method="post" action="memberLogin.mem">
						<div class="mx-auto p-0 m-0" style="width:270px;">
							<div class="row mx-auto p-0 mb-2">
								<div class="col mx-auto p-0 m-0">
									<input type="text" name="mid" id="mid" value="" placeholder="아이디를 입력해주세요." class="form-control" autofocus required />
								</div>
							</div>
							<div class="row mx-auto p-0 mb-3">
								<div class="col mx-auto p-0 m-0">
									<input type="password" name="pwd" id="pwd" value="" placeholder="비밀번호를 입력해주세요." class="form-control" required />
								</div>
							</div>
							<div class="row mx-auto p-0 mb-2">
								<div class="col mx-auto p-0 m-0">
									<input type="submit" value="로그인" class="btn btn-primary form-control" />
								</div>
							</div>
							<div class="row mx-auto p-0 mb-4">
								<div class="col mx-auto p-0 m-0 text-center">
									<div class="hr-sect"><b>또는</b></div>
								</div>
							</div>
							<div class="row mx-auto p-0 m-0">
								<div class="col mx-auto p-0 m-0 text-center">
									<a href="#"><b>비밀번호를 잊으셨나요?</b> </a>
								</div>
							</div>
						</div>
					</form>
					<!-- 로그인폼끝 -->
				</div>
				<div class="row m-2" style="width:350px;"></div>
				<div class="row border p-0 m-0 justify-content-center align-items-center " style="width:350px; height:60px;">
					<span> 계정이 없으신가요 ? <a href="#" class="text-primary"><b>가입하기</b></a> </span>
				</div>
				<div class="row m-2" style="width:350px;"></div>
				<div class="row p-0 m-0 justify-content-center align-items-center" style="width:350px;">
					<span>앱을 다운로드하세요</span>
				</div>
				<div class="row m-2" style="width:350px;"></div>
				<div class="row p-0 m-0 justify-content-center align-items-center" style="width:350px;">
					<span class="mr-2"><img src="${ctp}/images/googlePlayLink.png" id="download" style="height:40px;"/></span>
					<span><img src="${ctp}/images/msLink.png" id="download" style="height:40px;"/></span>
				</div>
			</div>
		</div>
<!-- 		<div class="container-fluid">
			<div class="mx-auto mt-5 bg-primary" style="max-width:600px"> 정보란1 </div>
			<div class="mx-auto bg-primary" style="max-width:600px"> 정보란2 </div>
		</div> -->
	</div>
</body>
</html>