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
	<div style="width: 70%;">
		<table id="test"></table>
	</div>



	<script type="text/javascript"
		src="//code.jquery.com/jquery-2.2.4.min.js"></script>
	<!-- jQuery庫 -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#test').DataTable({
				ajax : {
					url : '/DizzyCafe/coupons',
					type : 'POST',
// 					dataSrc : ''
					dataSrc : 
						function ( json ) {
	      					for ( var i=0, ien=json.length ; i<ien ; i++ ) {
	        					if(json[i].couponStatus == 0){
	        						json[i].couponStatus = '未使用';
	        					}else if(json[i].couponStatus == 1){
	        						json[i].couponStatus = '已使用';
	        					}else if(json[i].couponStatus == 2){
	        						json[i].couponStatus = '已過期';
	        					}
	      					}
	      					console.log(json);
	      				return json;
	    				}
				},
				columns : [ {
					data : 'eventDiscount'
				}, {
					data : 'couponDeadline'
				}, {
					data : 'merchandiseId'
				}, {
					data : 'couponStatus'
				} ],
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