<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${course.courseName}</title>
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
							<td style="padding-left:15px;"><h3>${course.courseIntro}</h3></td>
						</tr>
					</tbody>
				</table>
			</div>
			<!--title-->
			<div class="content" id="articleContent">
				<div class="part" data-type="p" style="margin:20px 95px; width:756px;">
					${course.courseContent }
					
					
					<p>講師 : ${course.courseTeacher } 老師</p>
					<p>報名時間 : ${course.courseSignupBegin } ～　${course.courseSignupEnd }</p>
					<p>課程時間 : ${course.courseBegin } ～　${course.courseEnd }</p>
					<p>現在人數 : ${nowPeople } / ${course.courseLimit }</p>
					<p>人數有限，心動不如馬上行動</p>
					<br>
					<p>※本課程將酌收費用 ${course.courseCost } 元</p>
				</div>
				<div style="margin:auto; width:100px;">
				<button id="iwannasignup" class="btn btn-success"
					onclick="document.getElementById('signup').style.display='block'">我要報名</button>
				</div>
			</div>
		</div>
	</section>




	<!-- The Modal -->
	<div id="signup" class="minghui_modal">
		<span onclick="document.getElementById('signup').style.display='none'"
			class="close" title="Close Modal">&times;</span>

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
					onclick="document.getElementById('signup').style.display='none'"
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
	        <button id="checkx" type="button" class="close">
	          <span >&times;</span>
	        </button>
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

	<script>
	
	
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
	
	
	$(function(){
		$('#submit').click(function(){
			$('#signUpForm').submit();
		});
	});
	
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
	</script>

</body>
</html>
