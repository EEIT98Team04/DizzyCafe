<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/DizzyCafe/hongwen/css/document.css" />
</head>
<body style="background-color: #fff1cc;">
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="margin-top: 80px; text-align: center;">
		<h2>歡迎光臨留言板</h2>
	</div>
	<div>
		<table id="test">
			<thead>
				<tr class="danger">
					<th>文章名稱</th>
					<th>發文時間/發文者</th>
					<th>最後回文者</th>
					<th>人氣</th>
				</tr>
			</thead>
		</table>
	</div>
	<form id="post">
		<div>
			<span>主題 : </span>
			<select id="grid" name="grid">				
				<option value="0">請選擇主題</option>
				<option value="1">咖啡品種產地版</option>
				<option value="2">咖啡烘焙版</option>
				<option value="3">咖啡沖泡方式版</option>
				<option value="4">咖啡沖烘焙具版</option>
				<option value="5">咖啡沖泡器具版</option>
				<option value="6">咖啡閒聊版</option>
			</select> 
			<span>文章標題 : <input id="d_article" name="title" type="text" style="width:200px; height:25px;"/></span>		
			<textarea></textarea>
			<input type="submit" value="發文" />	
		</div>
	</form>
	<input id="upload" name="test[]" type="file" multiple style="display:none"/>

	<!-- jQuery庫 -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/tinymce/tinymce.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/post.js"></script>
	<script src="/DizzyCafe/hongwen/js/document.js"></script>
	<script>
	
	</script>
</body>
</html>
