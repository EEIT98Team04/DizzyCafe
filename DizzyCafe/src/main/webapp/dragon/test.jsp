<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<div id='submitForm'>
		<form id="formCreditCard" method="post" accept-charset="UTF-8"
 			action="https://payment-stage.allpay.com.tw/Cashier/AioCheckOut/V4">
			<input type="text" value="2000132" name="MerchantID">
			<input type="text" value="allPay1234" name="MerchantTradeNo">
			<input type="submit" value="送出訂單" />
		</form>
	</div>
	
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
//  	$.post({
//  		url : 'https://payment-stage.allPay.com.tw/Cashier/AioCheckOut/V4',
//  		data : function(){
//  			$()
//  		},
//  	});
</script>
</body>
</html>