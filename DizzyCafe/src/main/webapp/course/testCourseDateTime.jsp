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




</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<div id="calendar" style="margin: auto; width: 700px"></div>


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
	$(document).ready(function(){
		var data;
		$.get("/DizzyCafe/courseCalendar.controller",function(json){
			console.log(json);
		});
	});
		$('#calendar').fullCalendar({
			editable : true,
			header :{
			    left:   'today prev,next',
			    center: 'title',
			    right:  'agendaWeek,agendaDay '
			},
			eventSources : [
				{
					url:'/DizzyCafe/courseCalendar.controller',
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
			}
		});

	</script>
	


</body>
</html>