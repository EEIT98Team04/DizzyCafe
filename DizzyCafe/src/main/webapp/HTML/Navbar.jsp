<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <title>DizzyCafe</title> -->

<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/image/favicon-16x16.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<style>
	.asd{
		border-color: black; 
		color: black;
		background-color:#FFFFFF; 
	}
	.asd:hover{
		background-color:#ADADAD;
	}
</style>
<!-- </head> -->
<!-- <body> -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="border-bottom: 1px solid #DDDDDD;">
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
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/merchandise.controller?page=1">商品</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/hongwen/board.jsp">FORUM</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> EVENT </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/activity.controller?nowPage=0">活動專區</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/course/course.controller?page=1">課程</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">ABOUT US</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li>
			</ul>
			<button class="btn asd">登入</button>
			<button class="btn asd" style="margin-left: 1%; ">註冊</button>
		</div>
	</nav>
<!-- </body> -->
<!-- </html> -->