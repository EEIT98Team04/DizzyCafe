<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div class="container" style="margin-top: 80px;">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<div class="page-header">
						<p id="membername">${user.memberName}</p>
					</div>
				</div>
				<ul class="nav nav-tabs">
					<li class="nav-item"><a id="1" class="nav-link active"
						data-toggle="tab" href="#home">發文</a></li>
					<li class="nav-item"><a id="2" class="nav-link" data-toggle="tab"
						href="#menu1">回覆</a></li>
					<li class="nav-item"><a id="3" class="nav-link" data-toggle="tab"
						href="#menu2">被檢舉文章</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active container" id="home">
						<table id="document"></table>
					</div>
					<div class="tab-pane container" id="menu1">
						<table id="reply"></table>
					</div>
					<div class="tab-pane container" id="menu2">...</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/DizzyCafe/hongwen/js/privatedocument.js"></script>
	<script src="/DizzyCafe/hongwen/js/privatereply.js"></script>
	<script>
	</script>
</body>
</html>