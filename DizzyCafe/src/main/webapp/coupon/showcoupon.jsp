<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>折價卷專區</title>
<link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="height:100px"></div>
	<h2 style="margin:auto;width:300px">折價卷專區</h2> 
	<div style="width: 800px;margin:auto;">
		<table id="test"></table>
	</div>



	<script type="text/javascript"
		src="//code.jquery.com/jquery-2.2.4.min.js"></script>
	<!-- jQuery庫 -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

	<script>
		$(document).ready(function() {
			var myTable = $('#test').DataTable({
				ajax : {
					url : '/DizzyCafe/coupons.controller',
					type : 'POST',
// 					dataSrc : ''
					dataSrc : 
						function ( json ) {
							$.each(json,function(key,value){
								if(value.couponStatus == 0){
									value.couponStatus = '未使用';
	        					}else if(value.couponStatus == 1){
	        						value.couponStatus = '已使用';
	        					}else if(value.couponStatus == 2){
	        						value.couponStatus = '已過期';
	        					}
	        					var how = (value.eventDiscount*100).toString().split('0')[0];
	        					value.eventDiscount = how+'折';
							});
// 	      					for ( var i=0, ien=json.length ; i<ien ; i++ ) {
// 	        					if(json[i].couponStatus == 0){
// 	        						json[i].couponStatus = '未使用';
// 	        					}else if(json[i].couponStatus == 1){
// 	        						json[i].couponStatus = '已使用';
// 	        					}else if(json[i].couponStatus == 2){
// 	        						json[i].couponStatus = '已過期';
// 	        					}
// 	        					var how = (json[i].eventDiscount*100);
// 	        					console.log(json);
// 	        					json[i].eventDiscount = how+'折';
// 	      					}
// 	      					console.log(json);
	      				return json;
	    				}
				},
				columns : [ {
					data : 'merchandiseName',
					title : '商品名稱'
				}, {
					data : 'eventDiscount',
					title : '折扣'
				}, {
					data : 'couponStatus',
					title : '狀態'
				}, {
					data : 'couponDeadline',
					title : '過期日'
				}],
				language : {
					paginate : {
						next : "下一頁",
						previous : "上一頁"
					},
					lengthMenu : '一頁顯示 _MENU_ 筆資料'
				},
				info : false,
				order : [3,'desc']
			});
		});
	</script>
</body>
</html>