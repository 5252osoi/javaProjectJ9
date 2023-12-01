<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<%@ include file = "/include/bs4.jsp" %>
	<title>personalPage</title>
	<script>
	</script>		
	<style>
		.personalPage{
			width:100%;
			height:100%;
			max-width:935px;
		}
		.personalPageProfile-pic{
			width: 150px;
		    height: 150px;
		    border-radius: 50%;
		    overflow: hidden;
		    padding: 3px;
		    background: linear-gradient(45deg, rgb(255, 230, 0), rgb(255, 0, 128) 80%);
		}
		.personalPageProfile-pic img{
			width: 100%;
		    height: 100%;
		    object-fit: cover;
		    border-radius: 50%;
		    border: 2px solid #fff;
		}
		.main{
			margin-left:20px;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>

<section class="main">
    <div class="container mt-3 personalPage">
        <!-- 프로필 정보 -->
        <div class="row">
            <div class="col-md-4 personalPageProfile-pic">
                <!-- 프로필 사진 -->
                <img src="#" alt="Profile Picture" >
            </div>
            <div class="col-md-8">
                <!-- 사용자 정보 (예: 이름, 아이디 등) -->
                <div class="row">
	                <h2>User Name</h2>
                </div>
                <div class="row">
	                <span>게시물 </span>
	                <span>팔로워 </span>
	                <span>팔로우 </span>
                </div>
                <div class="row">
                	<span>소개</span>
                </div>
            </div>
        </div>
		<div class="p-5 m-5"></div>
		<hr/>
        <!-- 게시물 목록 -->
        <div class="row mt-4">
            <div class="col-md-4">
                <!-- 첫 번째 게시물 -->
                <img src="#" alt="Post 1" class="img-fluid">
            </div>
            <div class="col-md-4">
                <!-- 두 번째 게시물 -->
                <img src="#" alt="Post 2" class="img-fluid">
            </div>
            <div class="col-md-4">
                <!-- 세 번째 게시물 -->
                <img src="#" alt="Post 3" class="img-fluid">
            </div>
        </div>

        <!-- 추가적인 게시물 목록 (페이징 등) -->

    </div>
</section>
	
</body>
</html>
