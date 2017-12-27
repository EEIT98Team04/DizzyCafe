<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<style>
</style>
<jsp:include page="/HTML/TitleIcon.jsp" />
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height: 100px"></div>
	<div>
		<a href="${pageContext.request.contextPath}/shopping/shoppingCart.controller">購物車</a>
	</div>
		 <div id="carouselExampleIndicators" class="carousel slide border border-light" data-ride="carousel" style="margin:auto;width:1024px;height:600px" data-interval="3000">
	        <ol class="carousel-indicators">
	            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	        </ol>
	        <div class="carousel-inner">
	            <div class="carousel-item active">
	            	<a href="${pageContext.request.contextPath}/activities?No=1">
	                	<img class="d-block" width='1024' height='600' src="${pageContext.request.contextPath}/activity/1001.jpg" alt="First slide">
	                </a>
	                <div class="carousel-caption d-none d-md-block">
	                    <h3>活動名稱</h3>
	                    <p>簡單敘述</p>
	                </div>
	            </div>
	            <div class="carousel-item">
	            	<a href="${pageContext.request.contextPath}/activities?No=2">
	                	<img class="d-block" width='1024' height='600' src="${pageContext.request.contextPath}/activity/1002.jpg" alt="Second slide">
	                </a>
	                <div class="carousel-caption d-none d-md-block">
	                    <h3>活動名稱</h3>
	                    <p>簡單敘述</p>
	                </div>
	            </div>
	        </div>
	        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="sr-only">Previous</span>
	        </a>
	        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="sr-only">Next</span>
	        </a>
	    </div>
</body>
</html>