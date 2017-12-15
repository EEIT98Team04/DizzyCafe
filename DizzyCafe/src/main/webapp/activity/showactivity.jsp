<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${activityBean.activityName }</title>
<style>
.info{
	width:500px;
	margin:auto;
}
</style>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<p class="alert alert-warning" style="padding-left:30%;padding-bottom:0px"><strong style="font-size:24px">活動專區</strong></p>
	<div class="info">
		<div>
			<img src="${pageContext.request.contextPath }/activity/${activityBean.activityNo }.jpg">
		</div>
		<h2>${activityBean.activityName }</h2>
		<div>
			<p>${activityBean.activityContent }</p>
			<br>
			<p>${activityBean.activityStart }~ ${activityBean.activityEnd }</p>
		</div>

	</div>
</body>
</html>