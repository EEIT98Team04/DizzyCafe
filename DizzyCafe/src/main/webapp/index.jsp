<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href='<c:url value="/minghui/css/minghui.css" />'>
<title>DizzyCafe</title>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<jsp:include page="/minghui/secure/navi_loginSys.jsp"></jsp:include>
		<c:if test="${not empty user}">
			<div class="memberImg">
				<img style="float: right; width: 50px; height: 50px" src="<c:url value="${user.memberPhoto}" />" />
			</div>
		</c:if>
	<div style="height: 100px"></div>
	<div>
		<a
			href="${pageContext.request.contextPath}/course/course.controller?page=1">課程</a>

		<a
			href="${pageContext.request.contextPath}/activity.controller?nowPage=0">haha</a>

		<form action="<c:url value="/activity.controller" />" method="get">
			<input type="submit" value="press">
		</form>
		<a href="${pageContext.request.contextPath}/coupon/showcoupon.jsp">coupon</a>
	</div>
	<script src='<c:url value="/minghui/js/minghui.js" />'></script>
</body>
</html>