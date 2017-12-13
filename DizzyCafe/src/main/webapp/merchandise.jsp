<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/DizzyCafe/css/merchandise.css">
<title>Merchandise</title>
</head>
<body>



	<%-- 		<c:url value="/Merchandise.controller"> --%>
	<%-- 			<c:param name="merchandiseId" value="${bean[0]}"></c:param> --%>
	<%-- 			<c:param name="merchandiseName" value="${bean[1]}"></c:param> --%>
	<%-- 			<c:param name="merchandiseContent" value="${bean[2]}"></c:param> --%>
	<%-- 			<c:param name="merchandisePicture" value="${bean[3]}"></c:param> --%>
	<%-- 			<c:param name="merchandisePrice" value="${bean[4]}"></c:param> --%>
	<%-- 			<c:param name="merchandiseStatus" value="${bean[5]}"></c:param> --%>
	<%-- 			<c:param name="merchandiseTag" value="${bean[6]}"></c:param> --%>
	<%-- 			<c:param name="merchandiseQuantity" value="${bean[7]}"></c:param> --%>

	<%-- 		</c:url> --%>


	<div>
		<header></header>
		<aside class="aside">
		<h3>coffee</h3>
		<ul>
			<li><a href="">咖啡豆 Whole Beans</a></li>
			<li><a href="">濾掛式咖啡 Drip Coffee</a></li>
		</ul>
		<h3>Merchandise</h3>
		<ul>
			<li><a href="">手沖濾杯 Drip Coffee Set</a></li>
			<li><a href="">咖啡沖煮相關器具 Accessories</a></li>
			<li><a href="">咖啡杯瓶及保溫罐 Bottle</a></li>
		</ul>

		</aside>

		<h1 style="margin-left: 25%;">咖啡豆 Whole Beans</h1>

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

		<!-- 				<div class="col"> -->
		<!-- 					<div class="col1">放圖+超連結</div> -->
		<!-- 					<div class="col2"> -->
		<!-- 						<p class="p1"> -->
		<%-- 							${bean.merchandiseName}<br /> ${bean.merchandisePrice}<br /> --%>
		<!-- 						</p> -->
		<!-- 						<span class="span1">我要購買</span> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 				<div class="col"> -->
		<!-- 					<div class="col1">放圖+超連結</div> -->
		<!-- 					<div class="col2"> -->
		<!-- 						<p class="p1"> -->
		<%-- 							${bean.merchandiseName}<br /> ${bean.merchandisePrice}<br /> --%>
		<!-- 						</p> -->
		<!-- 						<span class="span1">我要購買</span> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
	</div>

	<footer></footer>
</body>
</html>