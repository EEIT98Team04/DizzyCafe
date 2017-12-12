<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
</head>
<body>

	<a href="${pageContext.request.contextPath}/course/course.controller?page=1">課程</a>

	<a href="${pageContext.request.contextPath}/activity.controller?nowPage=0">haha</a>

	<form action="<c:url value="/activity.controller" />" method="get">
		<input type="submit" value="press">
	</form>
	<a href="${pageContext.request.contextPath}/coupon/showcoupon.jsp">coupon</a>

</body>
</html>