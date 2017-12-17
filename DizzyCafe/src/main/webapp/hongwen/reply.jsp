<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<h2>xxx文章</h2>
	</div>
	<div></div>
	<div style="background-color: #fff1cc;">
		<table id="test">
			<thead>
				<tr class="danger">
					<th>樓層</th>
					<th>內容</th>
					<th>時間</th>
					<th>發文者</th>
				</tr>
			</thead>
			<tbody id="content"></tbody>
		</table>
	</div>
	<!-- jQuery庫 -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script>
		var search = document.location.search;//取得?後面的參數
		var hyperlink = "${pageContext.request.contextPath}/hongwen/reply.jsp?";
		var count = 0;
		var json = [];
		$(function() {
			$(function() {
				console.log("Get into ajax");
				$.ajax({
					url : '/DizzyCafe/Reply.hongwen' + search,
					type : 'GET',
					//data:data,//post use
					success : function(json) {
						setdata(json);//
					}
				})
			})
		});
		var setdata = function(json){
			var inner,i,j;
			var count=0;//樓層編號，初始值為0
			var array = {'content':'','times':'','memberId':''};//一定要是json物件格式，可指定json顯示順序
			count=0;//初始化
			for(i in json){
				inner +='<tr>'+'<td>'+count+'</td>';
				var temp = json[i];
				for(j in array){
					inner += '<td>'+json[i][j]+'</td>';													
				}
				count++;//樓層編號
				inner +='</tr>';
			}
			$('#content').html(inner); 
		};
	</script>
</body>
</html>
