<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<jsp:include page="/backstage/header.jsp"></jsp:include>
<div class="content-wrapper">
    <div class="container-fluid">
		<p>welcome, ${manager.managerAccount }</p>
	</div>
</div>
<jsp:include page="/backstage/footer.jsp"></jsp:include>
</body>
</html>
