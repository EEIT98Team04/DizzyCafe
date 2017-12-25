<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>change password</title>
<style>
.minghui-changePassword-div-form{
	padding:30px;
	margin:auto;
	margin-top:10%;
	width:30%;
	border:5px dashed skyblue; 	
	border-radius:30px;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<c:if test="${not empty user}">		
		<div class="minghui-changePassword-div-form">
			<form action="${pageContext.request.contextPath}/changePasswordController.controller" method="post">
			  <input type="hidden" name="memberName" value="${user.memberName}"> 
			  <div class="form-group">
			    <label for="email">新密碼:</label>
			    <input type="password" class="form-control" name="pwd" required>
			  </div>
			  <div class="form-group">
			    <label for="pwd">再次輸入新密碼:</label>
			    <input type="password" class="form-control" name="newPwd" required>
			  </div>
			  <div class="text-center">
			  	<button type="submit" class="btn btn-primary">Submit</button>
			  </div>
			</form>
		</div>
	</c:if>
</body>
</html>