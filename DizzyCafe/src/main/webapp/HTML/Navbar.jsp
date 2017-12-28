<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <title>DizzyCafe</title> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<link rel="stylesheet" href='<c:url value="/minghui/css/minghui.css" />'>
<link rel="stylesheet" href='<c:url value="/wayne/css/nav.css" />'>
<style>
.asd {
	border-color: black;
	color: black;
	background-color: #FFFFFF;
}

.asd:hover {
	background-color: #ADADAD;
}
.navbar-nav li{
	font-weight:bold;
	margin-left:15px;
	margin-top:10px;
}
</style>
<!-- </head> -->
<!-- <body> -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="navbar"
	style="
/* 	border-bottom: 1px solid #DDDDDD; */
	 background-color: white;">
	<a class="navbar-brand"
		href="${pageContext.request.contextPath}/index.jsp"> <img
		src="${pageContext.request.contextPath}/image/index_icon.png"
		height="36px" style="padding-left: 12px" /></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation" style="">
		<span class="navbar-toggler-icon"></span>
	</button>


	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath}/index.jsp">HOME </a></li>
			<li class="nav-item"><a class="nav-link" href="#">COFFEE</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/merchandise.controller?page=1">商品</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/hongwen/board.jsp">FORUM</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> EVENT </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/activity.controller?nowPage=0">活動專區</a>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/course/course.controller?page=1">課程</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#">ABOUT US</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
			<li><i style="margin-left:900px;" class="fa fa-shopping-cart fa-5" aria-hidden="true" onclick="selectNav()"></i></li>
		</ul>
		<c:choose>
			<c:when test="${empty user}">
				<button class="btn asd"
					onclick="document.getElementById('minghui_member_login').style.display='block'">登入</button>
				<button class="btn asd" style="margin-left: 1%"
					onclick="document.getElementById('minghui_member_signUp').style.display='block'">註冊</button>
			</c:when>
			<c:when test="${not empty user}">
				<div style="float: right;">
					<a href="${pageContext.request.contextPath}/minghui/member/member_center.jsp">
						<img title="${user.memberName}" style="width:36px;height:36px"
							src='${pageContext.request.contextPath}/${user.memberPhoto}'>
					</a>
					<a href="${pageContext.request.contextPath}/logout.controller?option=logout">登出</a>
				</div>

			</c:when>
		</c:choose>
		
	</div>

	<div id="minghui_member_login" class="minghui_modal">

		<form class="minghui_modal-content animate"
			action="<c:url value="/login.controller" />" method="post">			
			<input type="hidden" id="minghui_store_memberName" value="${user.memberName}">
			<div class="imgcontainer">
				<span
					onclick="document.getElementById('minghui_member_login').style.display='none'"
					class="close" title="關閉視窗">&times;</span> <img
					src="${pageContext.request.contextPath }/minghui/res/img/coffee.jpg" alt="Avatar"
					class="avatar">
			</div>

			<div class="container">
				<label><b>Username</b></label> <input type="text" class="minghui_input_type_text_password"
					placeholder="Enter Username" name="memberName" required> <br>
				<label><b>Password</b></label> <input type="password" class="minghui_input_type_text_password"
					placeholder="Enter Password" name="memberPassword" required>

				<button class="loginBut" type="submit">Login</button>
				<p id="error_login">${errors.xxx2 }</p>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<i class="fa fa-facebook-official"
					style="font-size: 48px; color: blue" title="facebook 登入"></i> <span
					class="psw">Forgot <a href="#" onclick=
					"window.open(' http://127.0.0.1:8080/${pageContext.request.contextPath}/minghui/forgotPassword.jsp', '', config='height=300,width=500');">password</a>
					?
				</span>
			</div>
		</form>
	</div>

	<div id="minghui_member_signUp" class="minghui_modal">

		<form class="minghui_modal-content animate" enctype="multipart/form-data"
			action='<c:url value="/register.controller" />' method="post">
			<%-- 			action="<c:url value="/TestImg.do" />" method="post"> --%>
			<div class="imgcontainer">
				<span
					onclick="document.getElementById('minghui_member_signUp').style.display='none'"
					class="close" title="關閉視窗">&times;</span> <img id="showMemberPhoto"
					src="${pageContext.request.contextPath }/minghui/res/img/member_default_photo.jpg"
					style="width: 100px; height: 100px" class="avatar"><br>
				<input type="file" id="memberPhoto" name="memberPhoto"
					accept="image/*" required>
			</div>

			<div class="container">
				<label><b>帳號</b></label> <input type="text" placeholder="輸入帳號" class="minghui_input_type_text_password"
					name="memberName" required> <br> <label><b>密碼</b></label>
				<input type="password" placeholder="輸入密碼" name="memberPassword" class="minghui_input_type_text_password"
					required> <br> <label><b>再次輸入密碼</b></label> <input class="minghui_input_type_text_password"
					type="password" placeholder="輸入密碼" name="memberPassword1" required>
				<br> <label><b>手機</b></label> <input type="text" class="minghui_input_type_text_password"
					placeholder="輸入手機" name="memberPhone" required> <br> <label><b>信箱</b></label>
				<input type="text" placeholder="輸入信箱" name="memberEmail" class="minghui_input_type_text_password" required>
				<br> <label><b>地址</b></label> <input type="text" class="minghui_input_type_text_password"
					placeholder="輸入地址" name="memberAddress" required> <br>
				<label><b>生日</b></label> <input type="date"
					style="margin-bottom: 10px" name="memberBirth" required> <br>

				<button class="loginBut" type="submit">註冊</button>
				<p id="error_register">${error_register}</p>
			</div>

		</form>
	</div>

</nav>
	<div id="mySidenav" class="sidenav"><p class="cart">CART</p>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div id="product"></div>
		<div id="ordbtn" class="ordbtn">
		<div id="ordersub" class="ordersub" ></div>
		<div class="checkoutbtndiv"><a href="${pageContext.request.contextPath}/shopping/shoppingCart.controller"><button class="checkoutbtn" type="button">CHECKOUT</button></a></div>
		</div>
	</div>
<script>
function insertNav() {

	    document.getElementById("mySidenav").style.width = "300px";
		var buyCount = $('#select').val();
		var merchandiseId = '${bean.merchandiseId}';
		$.ajax({
			url : "/DizzyCafe/insertCart.controller",
			type : 'POST',
			data : {'buyCount':buyCount,'merchandiseId':merchandiseId},
			success: function(data){
//	 			for(var i=0;i<data.length;i++){
//	 				var merchandiseId = data[i].merchandiseId;
//	 				var merchandiseName = data[i].merchandiseName;
//	 				var merchandisePrice = data[i].merchandisePrice;
//	 				var merchandisePicture = data[i].merchandisePicture;
//	 				var buyCount = data[i].buyCount;
// 					var order = document.getElementById('ordersub').text();
					var totalPrice = 0;
					$('#product').empty();
				$.each(data, function(index,mer){			
					var product = $('#mySidenav>#product');

					var merchandisePicture = $("<img>").attr('src','${pageContext.request.contextPath}'+mer.merchandisePicture);
					
					var merchandiseName = $("<div></div>").text(mer.merchandiseName);
					var merchandisePrice = $("<div></div>").text(mer.merchandisePrice+"元" + "x" + mer.buyCount);
					var Price = mer.merchandisePrice*mer.buyCount;
					totalPrice = Price + totalPrice;
					var bigDiv = $("<div></div>").append([merchandisePicture, merchandiseName, merchandisePrice]);
					product.append(bigDiv);
					$("#product").find("img").css("width","20%");
			});
				$('#ordersub').text("ORDER SUBTOTAL : "+totalPrice);
		}
	})
}

function selectNav(){
	
	document.getElementById("mySidenav").style.width = "300px";
	$.ajax({
		url : "/DizzyCafe/selectCart.controller",
		type : 'POST',
		success: function(data){

				var totalPrice = 0;
				$('#product').empty();
			$.each(data, function(index,mer){			
				var product = $('#mySidenav>#product');

				var merchandisePicture = $("<img>").attr('src','${pageContext.request.contextPath}'+mer.merchandisePicture);
				
				var merchandiseName = $("<div></div>").text(mer.merchandiseName);
				var merchandisePrice = $("<div></div>").text(mer.merchandisePrice+"元" + "x" + mer.buyCount);
				var Price = mer.merchandisePrice*mer.buyCount;
				totalPrice = Price + totalPrice;
				var bigDiv = $("<div></div>").append([merchandisePicture, merchandiseName, merchandisePrice]);
				product.append(bigDiv);
				$("#product").find("img").css("width","20%");
		});
			$('#ordersub').text("ORDER SUBTOTAL : "+totalPrice);
	}
})
}
		
		
function closeNav() {
document.getElementById("mySidenav").style.width = "0";
}

</script>
<footer class="fixed-bottom text-center" style="z-index:-1">
          <p>Copyright © DizzyCafe 2017</p>
</footer>
<script src='<c:url value="/minghui/js/minghui.js" />'></script>
<!-- </body> -->
<!-- </html> -->