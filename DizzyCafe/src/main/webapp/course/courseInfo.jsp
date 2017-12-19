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
	<h3>${course.courseImg}</h3>
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
	<div id="signup" class="modal">
		<span onclick="document.getElementById('signup').style.display='none'"
			class="close" title="Close Modal">&times;</span>

		<!-- Modal Content -->
		<form class="modal-content animate" action="${pageContext.request.contextPath}/course/courseSignUpController.controller">
<!-- 			<div class="imgcontainer"> -->
<!-- 				<img src="img_avatar2.png" alt="Avatar" class="avatar"> -->
<!-- 			</div> -->

			<p>${user.memberName } 你好</p>
				<input name="memberId" type="hidden" value="${user.memberId }">
			<p>你要報名 ${course.courseName }</p>
				<input name="courseId" type="hidden" value="${course.courseId }">
			<div class="container">
				<label><b>電話</b></label> 
				<input type="text" placeholder="Phone number" name="phone" required> 
				
				<label><b>E-mail</b></label>
				<input type="text" placeholder="E-mail" name="email" required>

				<label for="same" name="sameAsMemberData"><input type="checkbox" name="same"> 同會員資料
				</label>
			</div>
			
			<button name="go" type="submit">報名</button>

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
		
// 		$('sameAsMemberData').onclick(function(){
// 			res={};
// 			res.memberId = $('#memberId').val();
// 			res.courseId = $('#courseId').val();
// 			res.phone = $('#phone').val();
// 			res.email = $('#email').val();
// 				$.post({
// 					url:"/sameAsMemberDataController.controller",
// 					date:res
// 				})			
// 			}
// 		);
	</script>
	
</body>
</html>
