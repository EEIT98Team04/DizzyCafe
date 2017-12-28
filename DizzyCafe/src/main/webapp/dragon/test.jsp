<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<c:if test="${not empty CheckMacValue}">
	<div id='submitForm'>
		<form id="formCreditCard" method="post" accept-charset="UTF-8"
 			action="https://payment-stage.allPay.com.tw/Cashier/AioCheckOut/V4">
			<input type="text" value="2000132" name="MerchantID">
			<input type="text" value="abubu" name="MerchantTradeNo">
			<input type="text" value="2017/12/26 15:40:18" name="MerchantTradeDate">
			<input type="text" value="aio" name="PaymentType">
			<input type="text" value="8700" name="TotalAmount">
			<input type="text" value="爽買一波" name="TradeDesc">
			<input type="text" value="腦袋 8700元" name="ItemName">
			<input type="text" value="http://211.23.128.214:5000" name="ReturnURL">
			<input type="text" value="Credit" name="ChoosePayment">
			<input type="text" value="1" name="EncryptType">
			<input type="text" value="${CheckMacValue }" name="CheckMacValue">
			<input type="submit" value="送出訂單" />
		</form>
	</div>
	</c:if>
		<c:if test="${empty CheckMacValue}">
	<div id='submitForm'>
		<form id="formCreditCard" method="post" accept-charset="UTF-8"
 			action="/DizzyCafe/oPayment.hohoho">
			<input type="text" value="2000132" name="MerchantID">
			<input type="text" value="abubu" name="MerchantTradeNo">
			<input type="text" value="2017/12/26 15:40:18" name="MerchantTradeDate">
			<input type="text" value="aio" name="PaymentType">
			<input type="text" value="8700" name="TotalAmount">
			<input type="text" value="爽買一波" name="TradeDesc">
			<input type="text" value="腦袋 8700元" name="ItemName">
			<input type="text" value="http://211.23.128.214:5000" name="ReturnURL">
			<input type="text" value="Credit" name="ChoosePayment">
			<input type="text" value="1" name="EncryptType">
			<input type="submit" value="送出訂單" />
		</form>
	</div>
	</c:if>
	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

</script>
</body>
</html>