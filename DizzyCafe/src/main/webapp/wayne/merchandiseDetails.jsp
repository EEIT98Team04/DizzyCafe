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
	<jsp:include page="/HTML/Navbar.jsp" />
	<article class="article">
		<header></header>
		<section class="section">
			<aside class="aside">
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
					<div class="col5">${bean.merchandisePrice}元
						<select class="select"><option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option></select>
					</div>
					<div class="col6">
						<input class="button1" type="button" value="加入購物車">
					</div>

				</div>
				<div class="col7">${bean.merchandiseContent }</div>

			</div>
		</section>
	</article>

</body>
</html>