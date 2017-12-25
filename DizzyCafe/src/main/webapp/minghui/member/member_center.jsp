<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<style></style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">jQuery Site</a>
				</div>


			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/minghui/member/member_center.jsp"
						class="list-group-item">首頁</a> <a href="#" class="list-group-item">課程</a>
					<a href="#" class="list-group-item">訂單</a>
					<a href="${pageContext.request.contextPath }/event/dailyevent.jsp" class="list-group-item">每日活動</a>
					<a href="${pageContext.request.contextPath}/coupon/showcoupon.jsp" class="list-group-item">折價卷</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron">
					<div class="page-header">
						<h3>Welcome, ${user.memberName}</h3>
					</div>
					<!-- 每頁不同的內容從這裡開始 -->					
					<jsp:include page="/minghui/member/updateMemberPhoto.jsp" />



					<!-- 每頁不同的內容到這裡結束 -->
				</div>
			</div>
		</div>
	</div>


</body>
</html>