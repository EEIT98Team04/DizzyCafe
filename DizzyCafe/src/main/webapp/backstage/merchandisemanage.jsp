<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>DizzyCafe</title>
<!-- Bootstrap core CSS-->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="css/sb-admin.css" rel="stylesheet">
<link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="/backstage/index.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="index.html">Dashboard</a>
				</li>
				<li class="breadcrumb-item active">Blank Page</li>
			</ol>
			<div class="row">
				<div class="col-12"></div>
			</div>
			<div>
			<table id="dataTable"></table>
			</div>

			<button class="btn btn-primary">新增商品</button>
		</div>
<!-- 		<div id="insertMerchandise"> -->
<!-- 		<form> -->
<!-- 		<div> -->
<!-- 			<span onclick="">&times;</span> -->
<!-- 		</div> -->
<!-- 			<label><b>商品名稱</b></label><input type="textarea" /><br> -->
<!-- 			<label><b>商品價格</b></label><input type="textarea" /><br>		 -->
<!-- 			<label><b>商品數量</b></label><input type="textarea" /><br>		 -->
<!-- 			<label><b>商品狀態</b></label><input type="textarea" /><br>		 -->
<!-- 			<label><b>商品類別</b></label><input type="textarea" /><br>			 -->
<!-- 			<label><b>商品敘述</b></label><input type="textarea" /><br>	 -->
<!-- 			<label><b>商品圖片</b></label><input type="textarea" /><br> -->
<!-- 			<img >	 -->
<!-- 		<div> -->
		
<!-- 		</div> -->
<!-- 		</form> -->
<!-- 		</div> -->
 	<script src="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"></script> 
 	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> 
 	<script> 
 	//顯示資料表dataTable
 	$('#dataTable').DataTable({
					ajax : {
						url:'/DizzyCafe/showinbackstage.controller',
						type:'POST',
						dataSrc: ''
					},
					columns:[{
						data:'merchandiseId',
						title:'商品編號',
						width:'10%',
					},{
						data:'merchandiseName',
						title:'商品名稱',
						width:'10%',
					},{
						data:'merchandisePrice',
						title:'商品價格',
						width:'10%',
					},{
						data:'merchandisePicture',
						title:'商品圖片',
						width:'10%',
					},{
						data:'merchandiseContent',
						title:'商品敘述',
						width:'10%',
					},{
						data:'merchandiseQuantity',
						title:'商品數量',
						width:'10%',
					},{
						data:'merchandiseTag',
						title:'商品類別',
						width:'10%',
					},{
						data:'merchandiseStatus',
						title:'商品狀態',
						width:'10%',
					}],
					language : {
						paginate : {
							next : "下一頁",
							previous : "上一頁"
						},
						lengthMenu : '一頁顯示 _MENU_ 筆資料'
					},
					info : false,
					order : [0,'asc']
				});
	
 	</script> 
	<jsp:include page="/backstage/footer.jsp"></jsp:include>
</body>
</html>