<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/hongwen/css/board.css" />
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="margin-top: 80px; text-align: center;">
		<h2>歡迎光臨咖啡論壇</h2>
	</div>
	<div style="background-color: #fff1cc;">
		<table id="test">
			<thead>
                <tr class="danger">
                    <th>留言板</th>
                    <th>人氣</th>
                    <th>留言板公告</th>
                </tr>
            </thead>
		</table>
	</div>
	<!-- jQuery庫 -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/board.js"></script>
	<script>
	</script>
</body>
</html>
