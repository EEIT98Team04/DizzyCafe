<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的課程</title>
<style type="text/css">
.more{
	background: url(/DizzyCafe/activity/nws-02.png) right center no-repeat;
	padding: 0 20px 0 0;
	cursor: pointer;
	color: #9c3f0d;
	text-decoration: none;
}
.more:hover{ 
 	color:#BC5B27; 
 	text-decoration: none; 
} 
</style>

</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<div id="CourseList" class="list" style="width:1500px; margin:auto; padding-left:200px;">
<!-- 		<table style="text-align: center"> -->

<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>圖片</th> -->
<!-- 					<th>課程名稱</th> -->
<!-- 					<th>開始時間</th> -->
<!-- 					<th>結束時間</th> -->
<!-- 					<th>現在人數</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
<!-- 			<tbody> -->
<%-- 				<c:forEach var="course" items="${myCourse}" varStatus="status"> --%>
<!-- 					<tr> -->
<%-- 						<td><a href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}"> --%>
<%-- 							<img class="img" src="${pageContext.request.contextPath}${course.courseImg}" /></a> --%>
<!-- 							</td> -->
<%-- 						<td><a href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">${course.courseName} --%>
<%-- 							<input name="courseIdinRow" type="hidden" value="${course.courseId }"/> --%>
<%-- 							<input name="memberIdinRow" type="hidden" value="${user.memberId }"/> --%>
<!-- 							</a></td>  -->
<%-- 						<td>${course.courseBegin}</td> --%>
<%-- 						<td>${course.courseEnd}</td> --%>
<%-- 						<td>${course.courseNowPeople}/${course.courseLimit}</td> --%>
<!-- 						<td><button name="quit" type="button" class="btn btn-primary" -->
<!-- 								data-toggle="modal" data-target="#quitCourse">我要退出</button></td> -->
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 		</table> -->

	
		<c:forEach var="course" items="${myCourse}" varStatus="status">

				<c:choose>
					<c:when test="${status.count%3==1}">
						<c:out value='<div style="width:1200px; height:500px;">' escapeXml="false"></c:out>
					</c:when>
				</c:choose>
				<div style="width:300px;float:left;margin-left:50px;position: relative;">
					<img name="quit" data-toggle="modal" data-target="#quitCourse" style="position: absolute; left:280px; top:5px;" src="${pageContext.request.contextPath}/image/close.png" />
    				<a href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">
						<img class="card-img-top" style="width:300px" src="${pageContext.request.contextPath}${course.courseImg}">
					</a>
    				<div class="card-body" style="border:1px solid #DDDDDD;border-bottom: 6px solid #fa8b00">
      					<h4 class="card-title">${course.courseName}</h4>
      					<div class="card-text content"><p>${course.courseIntro}</p></div>
      					<input type="hidden" value="${course.courseId }" />
     					 <p class="card-text"><small class="text-muted"><a class="more" href="${pageContext.request.contextPath}/course/courseShow.controller?course=${course.courseId}">看更多</a></small></p>
   					</div>
  				</div>
				<c:choose>
					<c:when test="${status.count%3==0}">
						<c:out value="</div>" escapeXml="false"></c:out>
					</c:when>
				</c:choose>

		</c:forEach>
		
	</div>
	
		<div>
			<ul class="pagination page" style="margin:auto;width:400px;padding-left:150px;">
				<c:forEach var="pages" begin="1" end="${TotalPages}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/course/courseOfMemberController.controller?page=${pages}">${pages}</a></li>
				</c:forEach>
			</ul>
		</div>


	<div id="noCourse" style="display:none; width:1024px; margin:auto;">
			<img src="${pageContext.request.contextPath}/image/noCourse.jpg"/>
	</div>



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

	<script>
	
	$(function(){
		if(${empty myCourse}){
			$('#CourseList').hide();
			$('#noCourse').show();
		}
	});

	
	
		$('img[name="quit"]').click(function(){
			$('#alertHead').text("退出 "+$(this).parent().find('h4').text() +" 課程");
			$('#alertBody').text("你確定要退出 "+$(this).parent().find('h4').text()+" 課程嗎QAQ");
			//把this button 的 courseId 和 memberId(Session) 的資料放進 alert div 的 hidden input裡
			$('#courseIdinAlert').val($(this).parent().find('input').val());
			$('#memberIdinAlert').val(${user.memberId});
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
		})
	</script>
</body>
</html>