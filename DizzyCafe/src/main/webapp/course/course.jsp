<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe課程</title>
<jsp:include page="/HTML/TitleIcon.jsp" />
<link rel="stylesheet" href="/js/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.css" type="text/css" media="screen" />
<style type="text/css">
	.img{
		height: 60px;
		width: 60px;
	}
	.list{
		margin: 20px auto;
		width: 70%;
	}
	.page{
		margin: 20px auto;
		width: 50%;
	}
	.list td{
		padding:0 20px;
	}
</style>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height:100px"></div>
	<div class="list">
		<table style="text-align: center">

			<thead>
				<tr>
					<th>圖片</th>
					<th>課程名稱</th>
					<th>課程簡介</th>
					<th>課程價格</th>
					<th>開始時間</th>
					<th>結束時間</th>
					<th>現在人數</th>
<!-- 					<th>管理</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="course" items="${courseList}" varStatus="status">
					<tr>
					<!--<a
					 href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">
							<img class="img" src="${pageContext.request.contextPath}${course.courseImg}" /></a>-->
						<td>
							<a href="javascript: openCourse();">
							<img class="img" src="${pageContext.request.contextPath}${course.courseImg}" /></a>
							</td>
						<td><a
							href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">${course.courseName}</a></td>
						<td>${course.courseIntro}</td>
						<td>${course.courseCost}</td>
						<td>${course.courseBegin}</td>
						<td>${course.courseEnd}</td>
						<td>${course.courseNowPeople} / ${course.courseLimit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<ul class="pagination page">
				<c:forEach var="pages" begin="1" end="${TotalPages}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/course/course.controller?page=${pages}">${pages}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath}/course/CourseCalendar.jsp">
		<button>test show course date time</button></a>
	</div>
	
<script src='<c:url value="/js/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.pack.js" />'></script>
<script src='<c:url value="/js/jquery.fancybox-1.3.4/fancybox/jquery.easing-1.3.pack.js" />'></script>
<script src='<c:url value="/js/jquery.fancybox-1.3.4/fancybox/jquery.fancybox-1.3.4.js" />'></script>
<script src='<c:url value="/js/jquery.fancybox-1.3.4/fancybox/jquery.mousewheel-3.0.4.pack.js" />'></script>
<script type="text/javascript">
function openCourse()
{
	//javascript: openCourse(/DizzyCafe,1008); return false;
	debugger;
	$(this).fancybox({
		'width'				: 580,
		'height'			: 350,
		'padding'			: 0,
		'autoScale'			: false,
		'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'href'				: 'http://localhost:8080/DizzyCafe/course/courseShow.controller?course=1008',
		'type'				: 'iframe',
		'onClosed'			: function(){window.location.reload();}  //關閉子視窗後的動作,
	});
}
</script>
</body>
</html>
