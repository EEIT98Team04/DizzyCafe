<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/table.css" />
<title>shopping</title>
</head>
<body>
<!-- 	如果是使用者點選的按鈕，由使用者送出資料的前面都要加 ${pageContext.request.contextPath}-->
	<a href="${pageContext.request.contextPath}/shopping/shoppingCart.controller">購物</a>
	<h1>購物車</h1>
	<form action="<c:url value="/Checkout/Checkout.controller"/>" method="get">
	<table>
		<thead>
			<tr>
				<th>商品名稱</th>
				<th>單價</th>
				<th>商品數量</th>
				<th>小計</th>
			</tr>
		</thead>
		<c:if test="${not empty result}">
			<tbody>
				<!--                 <tr> -->
				<%--                	 	<c:forEach var="merchandiseName" items="${merchandiseName}"> --%>
				<%--                     	<td>${merchandiseName}</td>                 --%>
				<%--                 	</c:forEach> --%>
				<%--                 	<c:forEach var="merchandisePrice" items="${merchandisePrice}"> --%>
				<%--                     	<td>${merchandisePrice}</td>                 --%>
				<%--                 	</c:forEach> --%>
				<%--                 	<c:forEach var="buyCount" items="${buyCount}"> --%>
				<%--                    		 <td>${buyCount}</td>                 --%>
				<%--                		 </c:forEach> --%>
				<%--                     <td>${array[3]}</td> --%>
				<!--                 </tr> -->

				<c:forEach var="i" begin="0" end="${count}" step="1">
					<tr>
						<td>${merchandiseName[i]}</td>
						<td>${merchandisePrice[i]}</td>
						<td>${buyCount[i]}</td>
						<td>${subtotal[i]}</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td align="rigth"><input type="submit" value="Ligun"></td> -->
<!-- 					</tr> -->
				</c:forEach>
			</tbody>
		</c:if>
	</table>
	</form>
</body>
</html>