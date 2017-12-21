<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${course.courseName}</title>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<h3>${pageContext.request.contextPath}${course.courseImg}</h3>
	<h3>${course.courseName}</h3>
	<h3>${course.courseIntro}</h3>
	<h3>${course.courseContent}</h3>
	<h3>${course.courseCost}</h3>
	<h3>${course.courseTeacher}</h3>
	<h3>${course.courseBegin}</h3>
	<h3>${course.courseEnd}</h3>
	<h3>${course.courseSignupBegin}</h3>
	<h3>${course.courseSignupEnd}</h3>

	<!-- Button to open the modal login form -->
	<button
		onclick="document.getElementById('signup').style.display='block'">我要報名</button>

	<!-- The Modal -->
	<div id="signup" class="minghui_modal">
		<span onclick="document.getElementById('signup').style.display='none'"
			class="close" title="Close Modal">&times;</span>

		<!-- Modal Content -->
		<form class="minghui_modal-content animate" action="${pageContext.request.contextPath}/course/courseSignUpController.controller" >
<!-- 			<div class="imgcontainer"> -->
<!-- 				<img src="img_avatar2.png" alt="Avatar" class="avatar"> -->
<!-- 			</div> -->

			<p>${user.memberName } 你好</p>
				<input id="memberName" name="memberName" type="hidden" value="${user.memberName }">
			<p>你要報名 ${course.courseName }</p>
				<input id="courseId" name="courseId" type="hidden" value="${course.courseId }">
			<div class="container">
				<label><b>電話</b></label> 
				<input class="minghui_input_type_text_password" type="text" placeholder="Phone number" name="phone" required> 
				
				<label><b>E-mail</b></label>
				<input class="minghui_input_type_text_password" type="text" placeholder="E-mail" name="email" required>
				<label for="same" id="sameAsMemberData"><input type="checkbox" id="same"> 同會員資料
				</label>
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
		
		
		$('#same').change(function(){
			if($('#same').prop('checked')==true){
				$('input[name="phone"]').val("${user.memberPhone}").prop("readonly",true).css('background-color',"#FFF8D7");
				$('input[name="email"]').val("${user.memberEmail}").prop("readonly",true).css('background-color',"#FFF8D7");	
			}
			else{
				$('input[name="phone"]').val('').prop("readonly",false).css('background-color',"");
				$('input[name="email"]').val('').prop("readonly",false).css('background-color',"");
			}
		});
	</script>
	
</body>
</html>
