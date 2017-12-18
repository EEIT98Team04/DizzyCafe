<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href='<c:url value="/minghui/css/minghui.css" />'>
<script src='<c:url value="/minghui/js/minghui.js" />'></script>

<button class="btn asd" style="margin-left: 1%"
					onclick="document.getElementById('change_photo').style.display='block'">變更照片</button>

<div id="change_photo" class="modal">

		<form class="modal-content animate"
			action="<c:url value="/login.controller" />" method="post">
			<div class="imgcontainer">
				<span
					onclick="document.getElementById('change_photo').style.display='none'"
					class="close" title="關閉視窗">&times;</span> <img
					src="${pageContext.request.contextPath }/minghui/res/img/coffee.jpg" alt="Avatar"
					class="avatar">
			</div>

			<div class="container">
				<label><b>Username</b></label> <input type="text"
					placeholder="Enter Username" name="memberName" required> <br>
				<label><b>Password</b></label> <input type="password"
					placeholder="Enter Password" name="memberPassword" required>

				<button class="loginBut" type="submit">Login</button>
				<p id="error_login">${errors.xxx2}</p>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<i class="fa fa-facebook-official"
					style="font-size: 48px; color: blue" title="facebook 登入"></i> <span
					class="psw">Forgot <a href="#">password?</a>
				</span>
			</div>
		</form>
	</div>