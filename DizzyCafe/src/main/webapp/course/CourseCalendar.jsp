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
			    right:  'month,agendaWeek,agendaDay '
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
			 
		});

	</script>
	


</body>
</html>