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
	
	<form method="post" action="somepage">
        <textarea name="content" style="width:100%"></textarea>
	</form>

	<!-- jQuery庫 -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/tinymce/tinymce.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/post.js"></script>
<!-- 	<script src="/DizzyCafe/hongwen/js/document.js"></script> -->
<script>
$(function() {	
	var search = document.location.search;// 取得?後面的參數
	var hyperlink = "/DizzyCafe/hongwen/reply.jsp?";
	$('#post').on('submit', function() {
		var z = tinyMCE.triggerSave();
		z = tinymce.get('#uploadForm').getContent();
		var x = $('#uploadForm');
		var y = $('#textarea');
		
		alert('2');
		
		var that = $(this),
		url='fghjkl',
		method='POST',
		data={};
		
		
		that.find('[name]').each(function(index, value) {
			console.log(value);
			var that = $(this), name = that.attr('name'), value = that.val();

			data[name] = value;
		});
		
		var tt = JSON.stringify(data);
		console.log(data);
		console.log(tt);

		$.ajax({
			url : url,
			type : method,
			data : data,
			success : function(response) {
				console.log("ajax response")
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
