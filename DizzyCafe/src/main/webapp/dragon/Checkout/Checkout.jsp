<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/Checkout/Checkout">結帳</a><br>
	
<!-- 	<ul> -->
<!-- 		<li>貨到付款</li> -->
<!-- 		<li>超商取貨</li> -->
<!-- 		<li>郵寄</li> -->
<!-- 	</ul> -->

	<input type="checkbox" ><span>同會員資料</span><br>
	<input type="radio" name="shipstyle" value=""><span>貨到付款</span><br>
	<input type="radio" name="shipstyle" value=""><span>超商取貨</span><br>
	<input type="radio" name="shipstyle" value=""><span>郵寄</span><br>
	
	<table>
		<tr>
			<td>取貨人姓名:</td>
			<td><input type="text" name="buyer" ></td>
			<td></td>
		</tr>
		<tr>
			<td>手機:</td>
			<td><input type="text" name="shipPhone"></td>
			<td></td>
		</tr>
		<tr>
			<td>聯絡信箱:</td>
			<td><input type="text" name="email"></td>
			<td></td>
		</tr>
		<tr>
			<td>運送地址</td>
			<td><input type="text" name="shipAddress"></td>
			<td></td>
		</tr>
		<tr>
			<td>選擇門市:</td>
			<td></td>
		</tr>
		<tr>
			<td>付款方式</td>
			<td></td>
		</tr>
	</table>
</body>
</html>