<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的課程</title>
<jsp:include page="/HTML/TitleIcon.jsp" />
<link type="text/css" rel="stylesheet"
	href='<c:url value="/js/fullcalendar-3.7.0/fullcalendar.css" />'>
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
.fc-content{
	color:white;
}
</style>

</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	
	<div id="calendar" style="width:700px; margin:auto;">
	</div>
	
	<div id="CourseList" class="list" style="width:1500px; margin:auto; padding-left:200px; margin-top:50px;">
		<c:forEach var="course" items="${myCourse}" varStatus="status">

				<c:choose>
					<c:when test="${status.count%3==1}">
						<c:out value='<div style="width:1200px; height:500px;">' escapeXml="false"></c:out>
					</c:when>
				</c:choose>
				<div style="width:300px;float:left;margin-left:50px;position: relative;">
					<img id="quit" name="quit" data-toggle="modal" data-target="#quitCourse" style="position: absolute; left:280px; top:5px;" src="${pageContext.request.contextPath}/image/close.png" />
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


	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/lib/jquery-ui.min.js" />'></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/lib/moment.min.js" />'></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/fullcalendar.js" />'></script>

	<script>
		$('img[name="quit"]').mouseenter(function(){
			$(this).attr("src","${pageContext.request.contextPath}/image/close_hover.png");
		});
		
		$('img[name="quit"]').mouseleave(function(){
			$(this).attr("src","${pageContext.request.contextPath}/image/close.png");
		});
	
	
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
		
		$(document).ready(function(){
			var data;
			$.get("/DizzyCafe/courseCalendar.controller",function(json){
				console.log(json);
			});
		});
		
		var memberId = ${user.memberId};
		$('#calendar').fullCalendar({
			editable : true,
			header :{
			    left:   'today prev,next',
			    center: 'title',
			    right:  'month,agendaWeek,agendaDay '
			},
			eventSources : [
				{
					url:'/DizzyCafe//courseCalendarByMemberId.controller',
					data:{memberId:memberId},
					error: function() {
		                alert('there was an error while fetching events!');
		            },
				}
			],
			dayClick : function(date, event, view) {
				console.log('add event');
				console.log(date);
				console.log(event);
				console.log(view);
			},
			eventClick : function(date, event, view) {
				console.log('modify event');
				console.log(date);
				console.log(event);
				console.log(view);
			},
			 monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
			 	monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
			 	dayNames: ["日", "一", "二", "三", "四", "五", "六"],  
			 	dayNamesShort: ["日", "一", "二", "三", "四", "五", "六"],  
			 	today: ["今天"],  
			 	buttonText: {  
			 	today: '今天',  
			 	month: '月',  
			 	week: '週',  
			 	day: '日',   
			 },  
			 eventStartEditable : false,
		});
		
		
	</script>
</body>
</html>