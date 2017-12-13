<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<a href="<c:url value="/merchandise.controller"/>">商品</a>
	</h1>
</body>
=======
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
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height:100px"></div>
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
</body>
>>>>>>> branch 'master' of https://github.com/EEIT98Team04/DizzyCafe.git
</html>