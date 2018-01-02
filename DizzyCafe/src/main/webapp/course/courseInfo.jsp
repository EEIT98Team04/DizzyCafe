<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${course.courseName}</title>
<link type="text/css" rel="stylesheet"
	href='<c:url value="/js/fullcalendar-3.7.0/fullcalendar.css" />'>
<jsp:include page="/HTML/TitleIcon.jsp" />
<style type="text/css">
.courseTable {
	border: 3px #DEB887 solid;
	cellpadding: 10;
	border: 1;
	font-family: Microsoft JhengHei;
}
.courseTable tr:nth-child(even) {
	background-color: #F5DEB3;
}
.courseTable tr:nth-child(odd) {
	background-color: white;
}
.container {
	width: 100%;
	max-width: 1250px;
	margin: 0 auto;
}
#news-show .date > div {
    width: 75px;
    height: 75px;
    text-align: center;
    color: #fff;
    padding: 3px 0 0 0;
    background: url(../image/idx-10.png) center center no-repeat #FABE00;
    line-height: 2em;
    padding: 5px 0 0 0;
}
.fc-content{
	color:white;
}
</style>
</head>
<body>
	<table>
		<tr height="100px"></tr>
	</table>
	<jsp:include page="/HTML/Navbar.jsp" />

	<section class="row container" id="news-show" style="width:90% ;margin:auto;">
		<div class="col-sm-offset-2 col-xs-12" style="padding-left:150px; width:90%;">

			<div class="cover">
				<img class="img-responsive" style="width:740px"
					src="${pageContext.request.contextPath}${course.courseImg}">
			</div>
			<div class="title" style="margin-top:30px;">
				<table>
					<tbody>
						<tr>
							<td class="date">
								<div id="date">
								</div>
							</td>
							<td style="padding-left:15px;"><h3>${course.courseName}</h3></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--title-->
			<div class="content" id="articleContent">
				<div class="part" data-type="p" style="margin:20px 95px; width:756px;">
					<p>${course.courseIntro }</p>
					${course.courseContent }
					
					<p>講師 : ${course.courseTeacher } 老師</p>
					<p>報名時間 : ${course.courseSignupBegin } ～　${course.courseSignupEnd }</p>
					<p>課程時間 : ${course.courseBegin } ～　${course.courseEnd }</p>
					<p id="week"></p>
					<p>現在人數 : ${nowPeople } / ${course.courseLimit }</p>
					<p>人數有限，心動不如馬上行動</p>
					<br>
					<p>※本課程將酌收費用 ${course.courseCost } 元</p>
					<br><br>
					<div id="calendar" style="width:600px;"></div>
				</div>
				
				<div style="margin:auto; width:100px;">
				<button id="iwannasignup" class="btn btn-success"
					onclick="joinClass();">我要報名</button>
				</div>
			</div>
		</div>
	</section>




	<!-- The Modal -->
	<div id="signup" class="minghui_modal">

		<!-- Modal Content -->
		<form id="signUpForm" class="minghui_modal-content animate" style="margin-top:30px;"
			action="${pageContext.request.contextPath}/course/courseSignUpController.controller">
			
			<div class="modal-header">
        		<h5 class="modal-title">${user.memberName }你好</h5>
      		</div>
      		
      		<div class="modal-body">
      			<input id="memberName" name="memberName" type="hidden"
				value="${user.memberName }">
				<p>你要報名 ${course.courseName }</p>
				<input id="courseId" name="courseId" type="hidden"
				value="${course.courseId }">
					<div class="container">
					<label><b>電話</b></label> 
					<input id="phone" class="minghui_input_type_text_password" type="text"
						placeholder="Phone number" name="phone" required> 
					<br>
					<label><b>E-mail</b></label>
					<input id="email" class="minghui_input_type_text_password" type="text"
						placeholder="E-mail" name="email" required> 
					<br>
					<label for="same" id="sameAsMemberData"><input type="checkbox"
						id="same"> 同會員資料 </label>
					</div>
      		</div>
			
			

			<div class="container" style="margin:auto; width:250px;">
				<button id="gogo" class="btn btn-success" type="button"
				style="margin-right:25px;margin-left:35px;">報名</button>
				<button type="button" class="btn" 
					onclick="cancel();"
					class="cancelbtn">取消</button>
			</div>
		</form>
	</div>
	
		<!-- Modal -->
	<div class="modal" id="signupsuccess">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">報名課程</h5>
	      </div>
	      <div class="modal-body">
	        	確定要報名 ${course.courseName } 嗎?
	      </div>
	      <div class="modal-footer">
	      	<button id="submit" type="button" class="btn btn-success">確定</button>
	        <button id="close" type="button" class="btn">取消</button>
	      </div>
	    </div>
	  </div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/lib/jquery-ui.min.js" />'></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/lib/moment.min.js" />'></script>
	<script type="text/javascript"
		src='<c:url value="/js/fullcalendar-3.7.0/fullcalendar.js" />'></script>

	<script>
	var _btn;
	
	$(function(){
		//顯示左邊月日
		temp="${course.courseBegin}".split('-');
		$('#date').html("<p style='height:14px;font-size:20px;font-weight:600;'>"+temp[2]+"</p>");
		$('#date').append(temp[1]+"月");
	})
	
	$('#gogo').click(function(){
		if(($('#phone').val() != "") && ($('#email').val() != "")){
			$('#signupsuccess').css('display','block');
		}
	});
	
	$('#close').click(function(){
		$('#signupsuccess').css('display','none');
		$('#signup').css('display','none');
	});
	
	//綁定x事件
	$('#checkx').click(function(){
		$('#signupsuccess').css('display','none');
		$('#signup').css('display','none');
	});
	
	//日期從數字轉成中文
	var week = '${course.courseWeek}';
	week=week.replace('1','日');
	week=week.replace('2','一');
	week=week.replace('3','二');
	week=week.replace('4','三');
	week=week.replace('5','四');
	week=week.replace('6','五');
	week=week.replace('7','六');
	$('#week').text('每周 '+week+' 上課');
	
	$(function(){
		$('#submit').click(function(){
			$('#signUpForm').submit();
		});
	});
	
	function joinClass()
	{
		//$.find('.navbar')
		/*$.find('.navbar').each(function()
				{
					$(this).attr("style","background-color: white; display: block;");
				});*/
// 		document.getElementById('minghui_member_login').style.display='block';
		$('nav').css("z-index",1);
		document.getElementById('signup').style.display='block';
		_btn = $('[class="fc-button-group"]').find('.fc-state-active');
		_btn.removeClass('fc-state-active');
	}
	
	function cancel()
	{
		document.getElementById('signup').style.display='none';
		if(_btn != undefined){
			_btn.addClass('fc-state-active');
		}
	}
	
		// Get the modal
		var modal = document.getElementById('signup');
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		$(function() {
			if ('${empty user}' == "true") { //未登入
				$('#iwannasignup').text("請先登入").prop("disabled", true).attr("class","btn btn-default");
			}
			$.post("/DizzyCafe//course/CheckTimeAndLimitController.controller",
					{
						"courseId" : '${course.courseId }'
					}, function(data) {
						if (data == "TimeError") { //非報名時間
							$('#iwannasignup').text("不是報名時間").prop("disabled",true).attr("class","btn btn-default");
						} else if (data == "limited") { //人數到達上限
							$('#iwannasignup').text("人數已達上限").prop("disabled",true).attr("class","btn btn-default");
						}
					});
			if ('${not empty user}' == "true") {
				$.post("/DizzyCafe/course/CheckSignedController.controller", {
					"courseId" : '${course.courseId }',
					"memberId" : '${user.memberId }'
				}, function(data) {
					if (data == "alreadySignedUp") { //已報名
						$('#iwannasignup').text("已報名").prop("disabled", true).attr("class","btn btn-default");
					}
				});
			}
		});
		
		//同會員資料
		$('#same').change(
				function() {
					if ($('#same').prop('checked') == true) {
						$('input[name="phone"]').val("${user.memberPhone}")
								.prop("readonly", true).css('background-color',
										"#FFF8D7");
						$('input[name="email"]').val("${user.memberEmail}")
								.prop("readonly", true).css('background-color',
										"#FFF8D7");
					} else {
						$('input[name="phone"]').val('')
								.prop("readonly", false).css(
										'background-color', "");
						$('input[name="email"]').val('')
								.prop("readonly", false).css(
										'background-color', "");
					}
				});
		
		
		
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
//	 	    alert("已更新");
		});
		
		//取消變更
		$('#cancel').click(function(){
			$('#calendar').fullCalendar('refetchEvents');	
		});
		
		
		//full calendar
		var id = ${course.courseId};
		$('#calendar').fullCalendar({
				editable : true,
				header :{
				    left:   'today prev,next',
				    center: 'title',
				    right:  'month,agendaWeek,agendaDay '
				},
				eventSources : [
					{
						url:'/DizzyCafe/courseCalendarByCourseId.controller',
						data:{courseId:id},
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