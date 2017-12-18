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
		<h2>歡迎光臨留言板</h2>
	</div>
	<div style="background-color: #fff1cc;">
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
	<!-- jQuery庫 -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script>
	var search= document.location.search;//取得?後面的參數
	var hyperlink = "${pageContext.request.contextPath}/hongwen/reply.jsp?";
		$(document).ready(function() {
			$('#test').DataTable({
				ajax : {
					url : '/DizzyCafe/Documentget.hongwen'+search,
					type : 'GET',
					dataSrc : function(json) {
						return json;
					}
				},
				columns : [{
					data : 'name',
					"render": function(data, type, row, meta){
			            if(type === 'display'){
			            	var get = 'documentId='+row.documentId+'&name='+row.name;
			                data = '<a href="' + hyperlink + get +'">' + data + '</a>';
			            }
			            return data;
			         }
				}, {
					data : 'memberId',
					"render": function(data, type, row, meta){
			            if(type === 'display'){
			            	var get = 'memberId='+row.memberId+'&name='+row.name;
// 			                data = '<a href="' + hyperlink + get +'">' + data + '</a>';
							data = row.times+'/'+row.memberId;
			            }
			            return data;
			         }
				}, {
					data : 'memberId'
				} , {
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
