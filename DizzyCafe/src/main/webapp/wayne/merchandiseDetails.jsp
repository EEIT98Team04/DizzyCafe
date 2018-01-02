<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="/DizzyCafe/wayne/css/merchandiseDetails.css">
<link href="/DizzyCafe/wayne/css/lightbox.css" rel="stylesheet">
<title>${bean.merchandiseName }</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="<c:url value="wayne/js/lightbox.js"/>"></script>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="width:100%;height:100%;position:relative;">
		<article id="merchandise_details_article" class="article">
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
					<a href="${pageContext.request.contextPath}/${bean.merchandisePicture}"  
					data-lightbox="example-1" data-title="${bean.merchandiseName}">
					<img class="img" id="myimage" 
						src="${pageContext.request.contextPath}/${bean.merchandisePicture}" >
					</a>
				</div>
				<div class="col4">
					<h2>${bean.merchandiseName}</h2>
					<c:choose>
					<c:when test="${bean.merchandiseTag}=='bean' ">
					<ul>
						<li>獨家配方豆</li>
						<li>新鮮烘培</li>
						<li>國際認證</li>
					</ul>
					</c:when>
					</c:choose>
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
							<option value="10">10</option>
						</select>
					</div>
					<div class="col6">
						<input class="button1" id="button1" type="submit"
							onclick="insertNav()" value="加入購物車">
					</div>

				</div>
				<div class="col7">
					${bean.merchandiseContent}
				</div>
			</div>
		</section>
	</article>

<!-- 	<div id="mySidenav" class="sidenav" style="position:absolute;height:"><p class="cart">CART</p> -->
<!-- 		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
<!-- 		<div id="product"></div> -->
<!-- 		<div class="ordersub">ORDER SUBTOTAL :</div> -->
<!-- 		<div class="checkoutbtndiv"><button class="checkoutbtn" type="button">CHECKOUT</button></div> -->
<!-- 	</div> -->
	
	</div>
	
<%-- 	<script src="<c:url value="wayne/js/imgZoom.js"/>"></script> --%>

	<script> 

// $('#button1').click(function(e){
// 	e.preventDefault();
// 	var buyCount = $('#select').val();
// 	var merchandiseId = '${bean.merchandiseId}';
// 	$.ajax({
// 		url : "/DizzyCafe/insertCart.controller",
// 		type : 'POST',
// 		data : {'buyCount':buyCount,'merchandiseId':merchandiseId},
// 		success: function(data){
// 			for(var i=0;i<data.length;i++){
// 				var merchandiseId = data[i].merchandiseId;
// 				var merchandiseName = data[i].merchandiseName;
// 				var merchandisePrice = data[i].merchandisePrice;
// 				var merchandisePicture = data[i].merchandisePicture;
// 				var buyCount = data[i].buyCount;				
// 			$.each(data, function(index,mer){			
// 				var product = $('#mySidenav>#product');
				
// 				var merchandisePicture = $("<img>").attr('src','${pageContext.request.contextPath}'+mer.merchandisePicture);
				
// 				var merchandiseName = $("<div></div>").text(mer.merchandiseName);
// 				var merchandisePrice = $("<div></div>").text(mer.merchandisePrice+"元" + "x" + mer.buyCount);
// 				var bigDiv = $("<div></div>").append([merchandisePicture, merchandiseName, merchandisePrice]);
// 				product.append(bigDiv);
// 				$("#product").find("img").css("width","20%");
// 			});
// 		}
// 	})
// });
 /*Execute the magnify function:*/
//  magnify("myimage", 3);
 /*Specify the id of the image, and the strength of the magnifier glass:*/ 

	
//  		var xhr = new XMLHttpRequest();
//  		if(xhr!=null){
//  			xhr.open("GET","/addcart.controller","false");
//  			xhr.send();
//  			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
// 		}
//  	}
	
	
</script>
</body>
</html>