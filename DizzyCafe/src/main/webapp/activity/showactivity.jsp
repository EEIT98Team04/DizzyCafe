<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${activityBean.activityName }</title>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<h2>${activityBean.activityName }</h2>
	<div>
		<!-- 	private int activityNo; -->
		<!-- 	private String activityName; -->
		<!-- 	private java.sql.Date activityStart; -->
		<!-- 	private java.sql.Date activityEnd; -->
		<!-- 	private String activityContent; -->
		<!-- 	private byte[] activityPicture; -->
		<p>${activityBean.activityContent }</p>
		<br>
		<p>${activityBean.activityStart }~ ${activityBean.activityEnd }</p>
	</div>
</body>
</html>