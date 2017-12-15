<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- <button class="loginBut" onclick="document.getElementById('login').style.display='block'" -->
<!-- 		style="width: auto; float: right">登入</button> -->
<!-- <button class="loginBut" id="register" onclick="document.getElementById('signUp').style.display='block'" -->
<!-- 		style="width: auto; float: right">註冊</button> -->

	<div id="login" class="modal">

		<form class="modal-content animate"
			action="<c:url value="/login.controller" />" method="post" >
			<div class="imgcontainer">
				<span onclick="document.getElementById('login').style.display='none'"
					class="close" title="關閉視窗">&times;</span> <img
					src="minghui/res/img/coffee.jpg" alt="Avatar" class="avatar">
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
					style="font-size: 48px; color: blue" title="facebook 登入"></i> <span class="psw">Forgot
					<a href="#">password?</a>
				</span>
			</div>
		</form>
	</div>
	
	<div id="signUp" class="modal">

		<form class="modal-content animate" enctype="multipart/form-data"
			    action='<c:url value="/uploadFile.controller" />' method="post">
<%-- 			action="<c:url value="/TestImg.do" />" method="post"> --%>
			<div class="imgcontainer">
				<span onclick="document.getElementById('signUp').style.display='none'"
					class="close" title="關閉視窗">&times;</span> 
				<img id="showMemberPhoto" src="minghui/res/img/member_default_photo.jpg" alt="Avatar" class="avatar"><br>
				<input type="file" id="memberPhoto" name="memberPhoto" accept="image/*" required>
			</div>

			<div class="container">
				<label><b>帳號</b></label> <input type="text"
					placeholder="輸入帳號" name="memberName" required> <br>
				<label><b>密碼</b></label> <input type="password"
					placeholder="輸入密碼" name="memberPassword" required> <br>
				<label><b>再次輸入密碼</b></label> <input type="password"
					placeholder="輸入密碼" name="memberPassword1" required> <br>
				<label><b>手機</b></label> <input type="text"
					placeholder="輸入手機" name="memberPhone" required> <br>
				<label><b>信箱</b></label> <input type="text"
					placeholder="輸入信箱" name="memberEmail" required> <br>				
				<label><b>地址</b></label> <input type="text"
					placeholder="輸入地址" name="memberAddress" required> <br>
				<label><b>生日</b></label> <input type="date"
					style="margin-bottom:10px" name="memberBirth" required> <br>

				<button class="loginBut" type="submit">註冊</button>
				<p id="error_register">${error_register}</p>
			</div>

		</form>
	</div>
