<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>論壇管理</title>
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="/backstage/header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="/DizzyCafe/backstage/index.jsp">回首頁</a></li>
				<li class="breadcrumb-item active">公告管理</li>
				<li class="breadcrumb-item"><a
					href="/DizzyCafe/backstage/report.jsp">公告管理</a></li>
			</ol>
			<table id='test'></table>
		</div>
	</div>
	<jsp:include page="/backstage/footer.jsp"></jsp:include>
</body>
<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script>
	$(document).ready(function() {
		var tmp = "";
		$('#test').DataTable({
			ajax : {
				url : '/DizzyCafe/Board.hongwen',
				type : 'GET',
				dataSrc : function(json) {
					this.temp = json;
					return json;
				}
			},
			"paging" : true,
			"ordering" : true,
			"info" : true,
			language : {
				"zeroRecords" : "查無資料",
			},
			columns : [ {
				data : 'boardId',
				title : '代號',
				width : 50
			}, {
				data : 'name',
				title : '留言板',
				width : 100
			}, {
				data : 'announcement',
				title : '公告',
// 				"render": function(data, type, row, meta){
// 		            if(type === 'display'){
// 		                data = '<a class="doubleClick" href="#">' + data + '</a>';
// 		            }
// 		            return data;
// 		         }
			} ],
			'createdRow' : function(row, data, dataIndex) {
				$(row).attr('id', "tr"+data.boardId);
			},
			'columnDefs' : [ {
				'targets' : 2,
				'createdCell' : function(td, cellData, rowData, row, col) {
					$(td).attr('id', rowData.boardId);
					$(td).attr('class', 'doubleClick');
					$(td).css('cursor', 'pointer');
				}
			} ]
		});
		var tagtmp=[];
		var data={};
		$(document).on('dblclick','.doubleClick',function(){
			tagtmp[$(this).attr('id')] = $(this);
			$(this).replaceWith($('<input id="'+$(this).attr('id')+
					'" class="xx" style="margin:auto;width:500px;" type="text" max=30 value="'
					+ this.innerHTML + '">'));
		});
		$(document).on('keydown','.xx',function(){
// 			alert( event.which );//判斷按下哪個按鈕
			if (event.which == 13) {
				floor = $(this).val() - 1;
				if (typeof (floor) == "undefined") {
					alert('請輸入數值');
				}else{
// 					alert('修改完成');
					var buf = tagtmp[$(this).attr('id')];
					buf[0].innerText = $(this).val();
					$(this).replaceWith($(buf));
// 					var x = tagtmp.attr('id');
// 					x = tagtmp[0].id;
					data['boardId'] = buf.attr('id');
					data['announcement'] = buf[0].innerText;
					//傳送更改完後的資料
					$.ajax({
						url:'/DizzyCafe/Forum.hongwen',
						type:'POST',
						data:data,
						dataType: "json",
						success:function(json){
							if (json[0]['status'] == 'success') {
								alert('資料庫更新成功');
							}else{
								alert('Oops！Something Wrong!Please Report Manager！');								
								window.location.replace(document.location.href);// 取得現在的URL，並自動導向
							}
						}
					})
				}
			}
		});	
	});
</script>
</html>
