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
	<jsp:include page="/HTML/Navbar.jsp" />
	<article class="articleone">
	<div>
		<header></header>
		<section class="sectionone"> <aside class="asideone">
		<h3 class="asideTitle">coffee</h3>
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/merchandisetag.controller?page=1&tag=bean">咖啡豆
					Whole Beans</a></li>
			<li><a href="">濾掛式咖啡 Drip Coffee</a></li>
		</ul>
		<h3 class="asideTitle">Merchandise</h3>
		<ul>
			<li><a href="">手沖濾杯 Drip Coffee Set</a></li>
			<li><a href="">咖啡沖煮相關器具 Accessories</a></li>
			<li><a
				href="${pageContext.request.contextPath}/merchandisetag.controller?page=1&tag=bottle">咖啡杯瓶及保溫罐
					Bottle</a></li>
		</ul>

		</aside>

		<div class="title"><h1>咖啡豆 Whole Beans</h1></div>
		<c:if test="${not empty beans}">
			<c:forEach var="bean" items="${beans}" varStatus="b">
				<c:choose>
					<c:when test="${b.count%3==1}">
						<c:out value='<div class="rowlist">' escapeXml="false"></c:out>
					</c:when>
				</c:choose>
				<div class="colone">
					<div class="coltwo">
						<a
							href="${pageContext.request.contextPath}/merchandisedetails.controller?merchandiseId=${bean.merchandiseId}">
							<img class="imgone"
							src="${pageContext.request.contextPath}/${bean.merchandisePicture}">
						</a>
					</div>
					<div class="colthree">
						<p class="pone">
							${bean.merchandiseName}<br /> ${bean.merchandisePrice}元<br />
						</p>
						<span class="spanone"><input class="button1" type="button" value="立即購買" 
						onclick="location.href='${pageContext.request.contextPath}/merchandisedetails.controller?merchandiseId=${bean.merchandiseId}'"></span>
					</div>
				</div>
				<c:choose>
					<c:when test="${b.count%3==0}">
						<c:out value="</div>" escapeXml="false"></c:out>
					</c:when>
				</c:choose>
			</c:forEach>


		</c:if> 
		</section>
	</div>

	</article>


	<div style="margin-left: 1000px;">
		<c:if test="${not empty tag}">
			<c:forEach var="pages" begin="1" end="${totalPages}">
				<a class="aone" href="${pageContext.request.contextPath}/merchandisetag.controller?tag=${tag}&page=${pages}">${pages}</a>
			</c:forEach>
		</c:if>
		<c:if test="${empty tag}">
			<c:forEach var="pages" begin="1" end="${totalPages}">
				<a class="aone" href="${pageContext.request.contextPath}/merchandise.controller?page=${pages}">${pages}</a>
			</c:forEach>
		</c:if>
	</div>

	<footer></footer>
</body>
</html>