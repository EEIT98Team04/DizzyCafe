<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="/DizzyCafe/wayne/css/merchandiseDetails.css">
<title>Insert title here</title>
</head>
<body>
	<article class="article"> <header></header> 
	<section class="section">
	<aside class="aside">
	<h3 style="background-color:#d0d0d0;">coffee</h3>
	<ul>
		<li><a
			href="${pageContext.request.contextPath}/merchandisetag.controller?page=1&tag=bean">咖啡豆
				Whole Beans</a></li>
		<li><a href="">濾掛式咖啡 Drip Coffee</a></li>
	</ul>
	<h3 style="background-color:#d0d0d0;">Merchandise</h3>
	<ul>
		<li><a href="">手沖濾杯 Drip Coffee Set</a></li>
		<li><a href="">咖啡沖煮相關器具 Accessories</a></li>
		<li><a
			href="${pageContext.request.contextPath}/merchandisetag.controller?page=1&tag=bottle">咖啡杯瓶及保溫罐
				Bottle</a></li>
	</ul>
	</aside>
	<div class="col2">
		<div class="col3">
			<img class="img"
				src="${pageContext.request.contextPath}/${bean.merchandisePicture}">
		</div>
		<div class="col4">
			<h2>${bean.merchandiseName}</h2>
			<ul>
				<li>獨家配方豆</li>
				<li>新鮮烘培</li>
				<li>國際認證</li>
			</ul>
			<div class="col5">${bean.merchandisePrice}元</div>
			<div class="col6">
				<input type="button">加入購物車
			</div>
			
		</div>
		<div style="clear:both;"></div>
		<div class="col7">${bean.merchandiseContent }123435543583</div>

	</div>
	</section> </article>

</body>
</html>