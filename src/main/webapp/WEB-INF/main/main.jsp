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
	<link rel="stylesheet" href="${ctp}/include/style.css">
	<!---->
</head>
<body>
	 <jsp:include page="/include/header.jsp"/>
	<p><br/></p>
	<div class="container">
		
	</div>
	<p><br/></p>
	<%-- <jsp:include page="/include/footer.jsp"/> --%>

</body>
</html>