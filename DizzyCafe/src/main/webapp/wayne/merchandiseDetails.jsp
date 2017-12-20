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
						<select class="select" id="select">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option></select>
					</div>
					<div class="col6">
						<input class="button1" id="button1" type="submit" 
						onclick="location.href='${pageContext.request.contextPath}/addcart.controller'" value="加入購物車">
					</div>

				</div>
				<div class="col7">${bean.merchandiseContent }</div>
			</div>
		</section>
	</article>
<script type="text/javascript">
	alert('${bean.merchandiseContent }');
	var btnAddCart = document.getElementById("button1");
	btnAddCart.onclick = function(){
		var xhr = new XMLHttpRequest();
		var select = document.getElementById("select");
		var getQuantity = select.value;
		
		alert(getQuantity);
		if(xhr!=null){
			xhr.open("GET","/addcart.controller","false");
			xhr.send();
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
// 			merchandiseId = ${bean.merchandiseId}&merchandiseName = ${bean.merchandiseName}&merchandiseContent = ${bean.merchandiseContent}&merchandisePicture = ${bean.merchandisePicture}&merchandiseTag = ${bean.merchandiseTag}&merchandisePrice = ${bean.merchandisePrice}&merchandiseQuantity = ${merchandiseQuantity}&merchandiseStatus = ${merchandiseStatus}
		}
	}
	
	
	
</script>
</body>
</html>