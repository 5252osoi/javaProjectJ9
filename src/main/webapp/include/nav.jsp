<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%
	int level= session.getAttribute("sLevel") == null ? 99 :(int) session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!--아이콘,css-->
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
<link rel="stylesheet" href="${ctp}/include/style.css">
<!---->
<script>

</script>

	<div class="sidebar">
		<a href="#" class="logo">
			<img src="${ctp}/images/instagram_text.png" alt="logo">
		</a>
		<div class="profile">
			<div class="profile-img">
				<img src="#" alt="profile-img">
			</div>
			<div class="name">
				<h1>yourID(Name)</h1>
				<!--인증받은 계정이면 뜸-->
				<img src="${ctp}/images/" alt="verify">
			</div>
			<span>@yourID(Name)</span>
		</div>
		<div class="about">
		</div>
		<nav class="navbar">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="#">홈<img src="#" alt=""></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">찾기<img src="#" alt=""></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">탐색<img src="#" alt=""></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">릴스<img src="#" alt=""></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">메시지<img src="#" alt=""></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">알림<img src="#" alt=""></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">글쓰기<img src="#" alt=""></a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">프로필<img src="#" alt=""></a>
				</li>
			</ul>
		</nav>
	</div>




	