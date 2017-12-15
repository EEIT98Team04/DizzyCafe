<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/DizzyCafe/wayne/css/merchandise.css">
<title>Merchandise</title>
</head>
<body>
	<div>
		<header></header>
		<aside class="aside">
		<h3>coffee</h3>
		<ul>
			<li><a href="${pageContext.request.contextPath}/wayne/merchandise.jsp">咖啡豆 Whole Beans</a></li>
			<li><a href="">濾掛式咖啡 Drip Coffee</a></li>
		</ul>
		<h3>Merchandise</h3>
		<ul>
			<li><a href="">手沖濾杯 Drip Coffee Set</a></li>
			<li><a href="">咖啡沖煮相關器具 Accessories</a></li>
			<li><a href="${pageContext.request.contextPath}/wayne/bottle.jsp">咖啡杯瓶及保溫罐 Bottle</a></li>
		</ul>

		</aside>

		<h1 style="margin-left: 25%;">咖啡豆 Whole Beans</h1>
		<c:if test="${not empty beans}">
			<c:forEach var="bean" items="${beans}" varStatus="b">
				<c:choose>
					<c:when test="${b.count%3==1}">
						<c:out value='<div class="rowlist">' escapeXml="false"></c:out>
					</c:when>
				</c:choose>
				<div class="col">
					<div class="col1">放圖+超連結</div>
					<div class="col2">
						<p class="p1">
							${bean.merchandiseName}<br /> ${bean.merchandisePrice}<br />
						</p>
						<span class="span1">我要購買</span>
					</div>
				</div>
				<c:choose>
					<c:when test="${b.count%3==0}">
						<c:out value="</div>" escapeXml="false"></c:out>
					</c:when>
				</c:choose>
			</c:forEach>


		</c:if>
	</div>
		<div style="margin-left:700px;">
			<c:forEach var="pages" begin="1" end="${totalPages}">
				<a href="${pageContext.request.contextPath}/merchandise.controller?page=${pages}">${pages}</a>
			</c:forEach>
		</div>


	<footer></footer>
</body>
</html>