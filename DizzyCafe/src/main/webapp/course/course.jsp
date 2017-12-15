<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe課程</title>
<style type="text/css">
	.img{
		height: 60px;
		width: 60px;
	}
	div{
		margin: 20px auto;
		width: 70%;
	}
</style>

</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height:100px"></div>
	<h3>test</h3>
	<div>
		<table>

			<thead>
				<tr>
					<th>courseImg</th>
					<th>courseName</th>
					<th>courseIntro</th>
					<th>courseCost</th>
					<th>courseBegin</th>
					<th>courseEnd</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="course" items="${courseList}">
					<tr>

						<td><a
							href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">
							<img class="img" src="${pageContext.request.contextPath}/image/course/${course.courseImg}" /></a></td>
						<td><a
							href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">${course.courseName}</a></td>
						<td>${course.courseIntro}</td>
						<td>${course.courseCost}</td>
						<td>${course.courseBegin}</td>
						<td>${course.courseEnd}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
		<ul class="pagination">
			<c:forEach var="pages" begin="1" end="${TotalPages}">
				<li class="page-item"><a  class="page-link" href="${pageContext.request.contextPath}/course/course.controller?page=${pages}">${pages}</a></li>
			</c:forEach>
		</ul>
	</div>
	
	
	<div>
		<a href="${pageContext.request.contextPath}/course/courseNew.jsp"><button>新增</button></a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/course/CourseCalendar.jsp">
		<button>test show course date time</button></a>
	</div>
</body>
</html>
