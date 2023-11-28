<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Instagram clone</title>
	<jsp:include page="/include/bs4.jsp"/>
	<!--아이콘,css-->
	<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
	<jsp:include page="/include/style.jsp"/>
	<!---->
	<style>
	/*스토리 뜨는곳 625px(고정), 포스트 올라가는 곳 470px(고정), 우측푸터는 385px(1160px미만일때 없어짐) */
	</style>
</head>
<body>
	<jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		<div></div>
	</div>
	<p><br/></p>

</body>
</html>