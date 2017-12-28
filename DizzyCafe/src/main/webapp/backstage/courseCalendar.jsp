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
<jsp:include page="../HTML/TitleIcon.jsp" />

</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="/backstage/header.jsp"></jsp:include>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div style="height: 40px"></div>
				<div id="calendar" style="margin: auto; width: 700px"></div>
				<div style="margin-left:625px; margin-top:20px">
					<button type="button" class="btn btn-info" id="update" onclick="alert('儲存成功');">儲存變更</button>
					<button type="button" class="btn btn-default" style="margin-left:50px;" id="cancel">取消變更</button>
				</div>
		</div>
	</div>
	
	<jsp:include page="/backstage/footer.jsp"></jsp:include>
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/lib/jquery-ui.min.js" />'></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/lib/moment.min.js" />'></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/fullcalendar.js" />'></script>
	<script>
	//儲存變更
	$('#update').click(function() {
	    var moment = $('#calendar').fullCalendar('clientEvents');
	    var calendarData = JSON.stringify(moment.map(function(e){
   			 			return {
   			     			start: e.start,
   			     			end: e.end,
   			     			title: e.title
   			 			};
   					}));
   		console.log(calendarData);
	    console.log(moment);
	    $.ajax({
	    	url:"/DizzyCafe/backstage/CalendarUpdate.controller",
	    	data:calendarData,
	    	contentType: "application/json;charset=utf-8",
	    	type:'POST'
	    });
// 	    alert("已更新");
	});
	
	//取消變更
	$('#cancel').click(function(){
		$('#calendar').fullCalendar('refetchEvents');	
	});
	
	
	//full calendar
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