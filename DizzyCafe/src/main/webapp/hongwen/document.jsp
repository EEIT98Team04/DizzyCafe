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
	<input id="d_cleck" type="button" value="清除"/>	
	<form id="post" method="POST">
		<div>
			<span>主題 : </span>
			<select id="grid" name="grid">				
				<option value="0" disabled>請選擇主題</option>
				<option value="1">咖啡品種產地版</option>
				<option value="2">咖啡烘焙版</option>
				<option value="3">咖啡沖泡方式版</option>
				<option value="4">咖啡沖烘焙具版</option>
				<option value="5">咖啡沖泡器具版</option>
				<option value="6">咖啡閒聊版</option>
			</select> 
			<span>文章標題 : <input id="d_article" name="title" type="text" style="width:200px; height:px;"/></span>		
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
<!-- 	<script src="/DizzyCafe/hongwen/js/document.js"></script> -->
	<script>
	$(function() {
		var search = document.location.search;// 取得?後面的參數
		var hyperlink = "/DizzyCafe/hongwen/reply.jsp?";

		$('#test').DataTable({
					ajax : {
						url : '/DizzyCafe//Document.hongwen' + search,
						type : 'GET',
						cache : false,
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
		
		$('#post').on('submit', function() {
// 			alert('submit');
			var	t = tinyMCE.activeEditor.getBody().innerHTML;//取出tinymve內容
			var that = $(this),data={};
			
			//轉json格式
			that.find('[name]').each(function(index, value) {
				that = $(this), 
					   name = that.attr('name'),//取得name的值 
					   value = that.val();//取得值
				data[name] = value;
			});
			data['textarea']=t;//將tinymce值放入data，並宣告為json格式[key='textarea',value=t]

// 			console.log(data);			

			//資料檢查
			var string = ['grid','title','textarea'];//檢查資料的key
			
			
			//初始化所有發文設定
			tinyMCE.activeEditor.getBody().innerHTML='';//初始化內容
			$('#d_article').val('');//清除標題內容

			//ajax傳送
			$.ajax({
				url : '/DizzyCafe/Document.hongwen',
				type : 'POST',
				data : data,
				cache : false,
				success : function(json) {
					//回傳值是字串
					console.log(json);
					console.log(json[0]['status'] == 'false');
					if(json[0]['status'] == 'false'){
						alert('請登入會員');
					}else{
						alert('發文成功');
					}
				}
			})
			return false;
		});
	</script>
</body>
</html>
