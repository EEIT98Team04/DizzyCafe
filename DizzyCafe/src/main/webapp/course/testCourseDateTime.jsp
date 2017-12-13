<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test maybe will be calendar</title>

<script src="js/jquery-1.12.3.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>

</head>
<jsp:include page="/HTML/Navbar.jsp" />
<div style="height: 100px"></div>
<body>
	<c:forEach var="courseDateTime" items="${courseDateTime}">
		<h3>${courseDateTime.num}</h3>
		<h3>${courseDateTime.courseId}</h3>
		<h3>${courseDateTime.courseDateTime}</h3>
		<h3>${courseDateTime.courseLength}</h3>
	</c:forEach>
</body>
</html>