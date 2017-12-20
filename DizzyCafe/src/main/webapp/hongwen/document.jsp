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
		<select name="grid">
			<option value="1">咖啡品種產地版</option>
			<option value="2">咖啡烘焙版</option>
			<option value="3">咖啡沖泡方式版</option>
			<option value="4">咖啡沖烘焙具版</option>
			<option value="5">咖啡沖泡器具版</option>
			<option value="6">咖啡閒聊版</option>
		</select> 
		<span>文章標題 : <input type="text" name="title" style="width:200px; height:10px;"/></span>		
		<span><input type="file" name="image" value="image" /></span>
		<div>
			<textarea id='textarea' name="textarea" style="width:100%; height:300px;"></textarea>
		</div>
		<input type="submit" value="Submit" />	
	</div>
	</form>

	<!-- jQuery庫 -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/tinymce/tinymce.min.js"></script>
<!-- 	<script src="/DizzyCafe/hongwen/js/document.js"></script> -->
	<script>
	$(function() {	
		var search = document.location.search;// 取得?後面的參數
		var hyperlink = "/DizzyCafe/hongwen/reply.jsp?";
		$('#post').on('submit', function() {		
			console.log('submit');
			
			var that = $(this),
			url='/DizzyCafe/Documentpost.hongwen',
			method='POST',
			data={};
					
			that.find('[name]').each(function(index, value) {
				that = $(this), name = that.attr('name'), value = that.val();
				data[name] = value;
			});

			$.ajax({
				url : url,
				type : method,
				data : data,
				success : function(response) {
					alert("successful");
				}
			})
			return false;
		});
		
		
		$('#test').DataTable(
				{
					ajax : {
						url : '/DizzyCafe/Documentget.hongwen' + search,
						type : 'GET',
						dataSrc : function(json) {
							return json;
						}
					},
					columns : [
							{
								data : 'name',
								"render" : function(data, type, row, meta) {
									if (type === 'display') {
										var get = 'documentId=' + row.documentId
												+ '&name=' + row.name;
										data = '<a href="' + hyperlink + get + '">'
												+ data + '</a>';
									}
									return data;
								}
							},
							{
								data : 'memberId',
								"render" : function(data, type, row, meta) {
									if (type === 'display') {
										var get = 'memberId=' + row.memberId
												+ '&name=' + row.name;
										// data = '<a href="' + hyperlink +
										// get +'">' + data + '</a>';
										data = row.times + '/' + row.memberId;
									}
									return data;
								}
							}, {
								data : 'memberId'
							}, {
								data : 'popularity'
							} ],
					language : {
						paginate : {
							next : "下一頁",
							previous : "上一頁"
						},
						lengthMenu : '一頁顯示 _MENU_ 筆資料'
					},
					info : false,
					order : [ 1, 'desc' ]
				});
	});
	</script>
</body>
</html>
