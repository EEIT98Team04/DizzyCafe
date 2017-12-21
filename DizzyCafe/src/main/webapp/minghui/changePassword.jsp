<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>change password</title>

</head>
<body>
	<c:if test="${not empty user}">

		<form
			action="${pageContext.request.contextPath}/changePasswordController.controller"
			method="post">
			輸入新密碼:<input type="password" required> 
			再次輸入:<input type="password" name="newPwd" required> 
			<input type="hidden" name="memberName" value="${user.memberName}"> <input
				type="submit">
		</form>

	</c:if>
</body>
</html>