<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${course.courseName}</title>
<style type="text/css">
.courseTable{
	border:3px #DEB887 solid;
	cellpadding: 10;
	border:1;
	font-family: Microsoft JhengHei;
}
.courseTable tr:nth-child(even){
  	background-color: #F5DEB3;
  	}

.courseTable tr:nth-child(odd) {
  background-color: white;
}
</style>
</head>
<body>
<table>
	<tr height="100px"></tr>
</table>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div align="center">
		<table class="courseTable">
			<tr>
				<th></th>
			</tr>
			<tr>
				<td><img
					src="${pageContext.request.contextPath}${course.courseImg}" /></td>
			</tr>
			<tr>
				<th>課程名稱</th>
			</tr>
			<tr>
				<td>${course.courseName}</td>
			</tr>
			<tr>
				<th>課程簡介</th>
			</tr>
			<tr>
				<td>${course.courseIntro}</td>
			</tr>
			<tr>
				<th>課程內容</th>
			</tr>
			<tr>
				<td>${course.courseContent}</td>
			</tr>
			<tr>
				<th>報名費用</th>
			</tr>
			<tr>
				<td>${course.courseCost}</td>
			</tr>
			<tr>
				<th>講師</th>
			</tr>
			<tr>
				<td>${course.courseTeacher}</td>
			</tr>
			<tr>
				<th>上課時間</th>
			</tr>
			<tr>
				<td>${course.courseBegin}～ ${course.courseEnd}</td>
			</tr>
			<tr>
				<th>報名時間</th>
			</tr>
			<tr>
				<td>${course.courseSignupBegin}～ ${course.courseSignupEnd}</td>
			</tr>
		</table>
	</div>
	<!--<h3>${course.courseName}</h3>
	<h3>${course.courseIntro}</h3>
	<h3>${course.courseContent}</h3>
	<h3>${course.courseCost}</h3>
	<h3>${course.courseTeacher}</h3>
	<h3>${course.courseBegin}</h3>
	<h3>${course.courseEnd}</h3>
	<h3>${course.courseSignupBegin}</h3>
	<h3>${course.courseSignupEnd}</h3> -->

	<!-- Button to open the modal login form -->
	<button id="iwannasignup">我要報名</button>

	<!-- The Modal -->
	<div id="signup" class="minghui_modal">
		<span onclick="document.getElementById('signup').style.display='none'"
			class="close" title="Close Modal">&times;</span>

		<!-- Modal Content -->
		<form class="minghui_modal-content animate"
			action="${pageContext.request.contextPath}/course/courseSignUpController.controller">
			<!-- 			<div class="imgcontainer"> -->
			<!-- 				<img src="img_avatar2.png" alt="Avatar" class="avatar"> -->
			<!-- 			</div> -->

			<p>${user.memberName }你好</p>
			<input id="memberName" name="memberName" type="hidden"
				value="${user.memberName }">
			<p>你要報名 ${course.courseName }</p>
			<input id="courseId" name="courseId" type="hidden"
				value="${course.courseId }">
			<div class="container">
				<label><b>電話</b></label> <input
					class="minghui_input_type_text_password" type="text"
					placeholder="Phone number" name="phone" required> <label><b>E-mail</b></label>
				<input class="minghui_input_type_text_password" type="text"
					placeholder="E-mail" name="email" required> <label
					for="same" id="sameAsMemberData"><input type="checkbox"
					id="same"> 同會員資料 </label>
			</div>

			<button type="submit">報名</button>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('signup').style.display='none'"
					class="cancelbtn">Cancel</button>
			</div>
		</form>
	</div>


	<script>
		// Get the modal
		var modal = document.getElementById('signup');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}


		$(function() {
			if('${empty user}'== "true"){              //未登入
				$('#iwannasignup').text("請先登入").prop("disabled", true);
			}
			
			$.post("/DizzyCafe//course/CheckTimeAndLimitController.controller", {
				"courseId" : '${course.courseId }'
			}, function(data) {
				if (data == "TimeError") {              //非報名時間
					$('#iwannasignup').text("不是報名時間").prop("disabled", true);
				}else if(data == "limited"){               //人數到達上限
					$('#iwannasignup').text("人數已達上限").prop("disabled", true);
				}
			});

			if ('${not empty user}' == "true") {       
				alert("do user check")
				$.post("/DizzyCafe/course/CheckSignedController.controller", {
					"courseId" : '${course.courseId }',
					"memberId" : '${user.memberId }'
				}, function(data) {
					if (data == "alreadySignedUp") {     //已報名
						$('#iwannasignup').text("已報名").prop("disabled", true);
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
