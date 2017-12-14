﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>咖啡論壇</title>
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
	<script>
	var temp;
		$(document).ready(function() {
			$('#test').DataTable({
				ajax : {
					url : '/DizzyCafe/Board.hongwen',
					type : 'POST',
					dataSrc : function(json) {
						this.temp = json;
						return json;
					}
				},
				"paging":   false,
				"ordering": false,
				"info":     false,
				language : {
		            "zeroRecords": "查無此資料",
				},
				columns : [{
					data : 'name',
					"render": function(data, type, row, meta){
			            if(type === 'display'){
			                data = '<a href="${pageContext.request.contextPath}/hongwen/reply.jsp">' + data + '</a>';
			            }

			            return data;
			         }
				}, {
					data : 'popularity'
				}, {
					data : 'announcement'
				}],
			});
		});
		console.log(temp);
	</script>
</body>
</html>