<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>論壇管理</title>
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="/backstage/header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="/DizzyCafe/backstage/index.jsp">回首頁</a></li>
				<li class="breadcrumb-item"><a
					href="/DizzyCafe/backstage/forum.jsp">公告管理</a></li>
				<li class="breadcrumb-item active">檢舉管理</li>
			</ol>
			<table id="forum"></table>
		</div>
		<!-- Button to Open the Modal -->
		<button id="btnreport" style="display: none" type="button"
			class="btn btn-primary" data-toggle="modal" data-target="#myModal">顯示被檢舉文章</button>

		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">被檢舉文章</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<div>
							<p>文章標題 :<span id="span">xxx</span></p>
							<div id="documentid" style="display: none"></div>
						</div>
						<p>文章內容 : </p>
						<div style="border:1px solid red;padding:10px;border-radius:25px;box-shadow:2px 2px 10px 0px">
							<div id="pre">xxxxxxx</div>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button id="stop" type="button" class="btn btn-success"
							data-dismiss="modal">停用</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">取消</button>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/backstage/footer.jsp"></jsp:include>
</body>
<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script>
	$(function() {

		$('#forum')
				.DataTable(
						{
							ajax : {
								url : '/DizzyCafe/Privatereport.hongwen',
								type : 'GET',
								dataSrc : function(json) {
									return json;
								}
							},
							"paging" : true,
							"ordering" : false,
							"info" : false,
							language : {
								"zeroRecords" : "查無資料",
							},
							columns : [
									{
										data : 'documentId',
										title : '檢舉文章編號',
										width : 100
									},
									{
										data : 'memberid',
										title : '檢舉會員編號',
										width : 100
									},
									{
										data : 'times',
										title : '時間',
										width : 150
									},
									{
										data : 'content',
										title : '檢舉內容',
										width : 400
									},
									{
										data : null,
										title : '審核',
										"render" : function(data, type, row,
												meta) {
											if (type === 'display') {
												data = "<a href='#' class='btn report'><i class='fa fa-pencil' aria-hidden='true'></i></a>";
											}
											return data;
										}
									} ]
						});
		var data = {};
		$(document).on('click', '.report', function() {

			data = $(this).closest('tr');
			data = data.find('td:first-child').text();
			data = '?id=' + data;
			$.ajax({
				url : "/DizzyCafe/Privatemodify.hongwen" + data,
				method : 'GET',
				success : function(json) {
					var x = json[0].content;
					console.log(x);
					$('#span').text(json[0].name);
// 					$('#pre').text(x);
					$('#pre').html(x);
					$('#documentid').text(json[0].documentId);
					$('#btnreport').trigger('click');
				}
			})
			return false;
		})
		$(document).on('click', '#stop', function() {
			$.ajax({
				url : "/DizzyCafe/ReportFile.hongwen" + data,
				method : 'GET',
				success : function(json) {
					window.location.replace("/DizzyCafe/backstage/report.jsp");// 取得現在的URL，並自動導向
				}
			})
		})
	});
</script>
</html>
