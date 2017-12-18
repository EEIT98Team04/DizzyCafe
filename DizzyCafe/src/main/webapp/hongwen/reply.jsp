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
	<div style="background-color: #fff1cc;">
		<table id="test">
			<thead>
                <tr class="danger">
                    <th>文章名稱</th>
                    <th>發文者/發文時間</th>
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
		$(document).ready(function() {
			$('#test').DataTable({
				ajax : {
					url : '/DizzyCafe/Board.hongwen',
					type : 'POST',
					dataSrc : function(json) {
						return json;
					}
				},
				columns : [ {
					data : 'name'
				}, {
					data : 'popularity'
				}, {
					data : 'announcement'
				}, {
					data : 'Bstatus'
				} ],
				language : {
					paginate : {
						next : "下一頁",
						previous : "上一頁"
					},
					lengthMenu : '一頁顯示 _MENU_ 筆資料'
				},
				info : false,
				order : [ 3, 'desc' ]
			});
		});
	</script>
</body>
</html>
