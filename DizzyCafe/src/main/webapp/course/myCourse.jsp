<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的課程</title>
<style type="text/css">
.img {
	height: 60px;
	width: 60px;
}

.list {
	margin: 20px auto;
	width: 70%;
}

.page {
	margin: 20px auto;
	width: 50%;
}

.list td {
	padding: 0 20px;
}
</style>

</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<div class="list">
		<table style="text-align: center">

			<thead>
				<tr>
					<th>圖片</th>
					<th>課程名稱</th>
					<th>開始時間</th>
					<th>結束時間</th>
					<th>現在人數</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="course" items="${myCourse}" varStatus="status">
					<tr>
						<td><a href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">
							<img class="img" src="${pageContext.request.contextPath}${course.courseImg}" /></a>
							</td>
						<td><a href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">${course.courseName}
							<input name="courseIdinRow" type="hidden" value="${course.courseId }"/>
							<input name="memberIdinRow" type="hidden" value="${user.memberId }"/>
							</a></td> 
						<td>${course.courseBegin}</td>
						<td>${course.courseEnd}</td>
						<td>${course.courseNowPeople}/${course.courseLimit}</td>
						<td><button name="quit" type="button" class="btn btn-primary"
								data-toggle="modal" data-target="#quitCourse">我要退出</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>



		<div class="container">
			<!-- The Modal -->
			<div class="modal fade" id="quitCourse">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 id="alertHead" class="modal-title"></h4>
								<input id="courseIdinAlert" type="hidden" value=""/>
								<input id="memberIdinAlert" type="hidden" value=""/>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div id="alertBody" class="modal-body"></div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">NO!!</button>
							<button id="reallyQuit" type="button" class="btn btn-primary">我...我退出...</button>
						</div>

					</div>
				</div>
			</div>
		</div>





		<div>
			<ul class="pagination page">
				<c:forEach var="pages" begin="1" end="${TotalPages}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/course/courseOfMemberController.controller?page=${pages}">${pages}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<script>
		$('button[name="quit"]').click(function(){
			$('#alertHead').text("退出 "+$(this).parents('tr').find('td:nth-child(2)').text() +" 課程");
			$('#alertBody').text("你確定要退出 "+$(this).parents('tr').find('td:nth-child(2)').text()+" 課程嗎QAQ");
			//把this button 的 courseId 和 memberId(Session) 的資料放進 alert div 的 hidden input裡
			$('#courseIdinAlert').val($(this).parents('tr').find('input[name="courseIdinRow"]').val());
			$('#memberIdinAlert').val($(this).parents('tr').find('input[name="memberIdinRow"]').val());
		});

		$('#reallyQuit').click(function(){
			alert("期待下次看到你喔QAQ");
			$.post(
				"/DizzyCafe/course/quitCourse.controller",
				{"courseId":$('#courseIdinAlert').val(),
				 "memberId":$('#memberIdinAlert').val()},
				function(){
				    location.reload();
			});
		});
	</script>
</body>
</html>