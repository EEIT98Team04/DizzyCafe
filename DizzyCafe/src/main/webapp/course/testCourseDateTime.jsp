<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset=UTF-8>
<title>test maybe will be calendar</title>

<link type="text/css" rel="stylesheet"
	href='<c:url value="/js/fullcalendar-3.7.0/fullcalendar.css" />'>
<link type="text/css" rel="stylesheet"
	href='<c:url value="/js/fullcalendar-3.7.0/fullcalendar.print.css" />'>




</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<div id="calendar"></div>


	<c:forEach var="courseDateTime" items="${courseDateTime}">
		<h3>${courseDateTime.num}</h3>
		<h3>${courseDateTime.courseId}</h3>
		<h3>${courseDateTime.courseDateTime}</h3>
		<h3>${courseDateTime.courseLength}</h3>
	</c:forEach>
	
	
	
	
	
	
	
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/lib/jquery-ui.min.js" />'></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/lib/moment.min.js" />'></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/fullcalendar.js" />'></script>

	<script>
		$('#calendar').fullCalendar();
	</script>
</body>
</html>