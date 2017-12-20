<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dragon/css/shoppingCartStyle.css" />
<title>shopping</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
</head>
<body>
	<!-- 	如果是使用者點選的按鈕，由使用者送出資料的前面都要加 ${pageContext.request.contextPath}-->
	<a
		href="${pageContext.request.contextPath}/shopping/shoppingCart.controller">購物</a>
	<h1>購物車</h1>
	<form action="<c:url value="/Checkout/Checkout.controller"/>"
		method="get">
		<table id="showLsit">
			<thead>
				<tr>
					<th></th>
					<th>商品編號</th>
					<th>商品名稱</th>
					<th>單價</th>
					<th>商品數量</th>
					<th>小計</th>
					<th></th>
				</tr>
			</thead>
			<c:if test="${not empty result}">
				<tbody>
					<c:forEach var="i" begin="0" end="${count}" step="1">
						<tr>
							<td>${i+1}</td>
							<td>${merchandiseId[i]}</td>
							<td>${merchandiseName[i]}</td>
							<td>${merchandisePrice[i]}</td>
							<td>
							<select style="width: 45px;text-align: right;">
									<option selected="selected" value="">${buyCount[i]}</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
							</select></td>
							<td>${subtotal[i]}</td>
							<td><input name="delete" type="button" value="刪除"></td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
	<script>
	$(document).ready(function(){
		
		/*點擊後抓取當前商品ID後將ID傳給controler*/
		$('input[name="delete"]').click(function(){
<%-- 			var memberId = "<%=session.getAttribute("user")%>"; --%>
			var merchandiseId = $(this).parents('tr').find('td:nth-child(1)').text();
// 			var merchandiseId = ${merchandiseId};
// 			var merchandiseName = $(this).parents('tr').find('td:nth-child(2)').text();
			alert(merchandiseId);
			$.post('/DizzyCafe/merchandiseDelete.controller', {
				'MerchandiseId': merchandiseId
				}, function(data){
					alert("yes");
			});
		});
		
	});
	</script>
</body>
</html>