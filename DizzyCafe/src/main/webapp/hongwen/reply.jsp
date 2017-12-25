<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<link rel="stylesheet" href="/DizzyCafe/hongwen/css/reply.css" />
</head>
<body id="body">
	<jsp:include page="/HTML/Navbar.jsp" />
	<a id="hyperlink" href="#20">11</a>
	<div id="article"></div>
	
	<form id="post" method="post">
		<div>
			<textarea></textarea>
			<input type="submit" value="發文" />	
		</div>
	</form>
	<input id="upload" name="upload" type="file" multiple style="display:none"/>
	<div style="margin-bottom:100px"></div>
	<script src="/DizzyCafe/hongwen/js/tinymce/tinymce.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/post.js"></script>
	<script src="/DizzyCafe/hongwen/js/reply.js"></script>
	<script>		
	</script>
</body>
</html>
