<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Dizzy Cafe</title>
  <!-- Bootstrap core CSS-->
<!--   <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
  <!-- Custom fonts for this template-->
<!--   <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
  <!-- Custom styles for this template-->
<!--   <link href="css/sb-admin.css" rel="stylesheet"> -->
  <link rel="stylesheet" href='${pageContext.request.contextPath }/minghui/css/minghui.css'>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<!--   <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.css"/> -->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>
  <style>
  	.forText{
  		margin:10px auto;
  	}
  	.container label{
  		width:150px;
  	}
  	.success{
  		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0, 0, 0); /* Fallback color */
		background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
		padding-top: 60px;
  	}
  	i:hover{
  		color:white;
  	}
  	.forDiv { 
		POSITION: relative; 
	}
	#circleImg{
		POSITION: absolute;
		TOP: 75px; LEFT : 335px;
		Z-INDEX: 1; 
	} 
	#playImg { 
		POSITION: absolute; 
		TOP: 175px; LEFT : 435px; 
		Z-INDEX: 3; 
	} 
	#firstImg { 
	 	position: absolute; 
	 	top: 420px; left : 600px;
	 	Z-INDEX: 3;
	}
	#secondImg { 
	 	position: absolute; 
	 	top: 435px; left : 485px;
	 	Z-INDEX: 3;
	} 
	#thirdImg { 
	 	position: absolute; 
	 	top: 300px; left : 400px;
	 	Z-INDEX: 3;
	} 
	#fourthImg { 
	 	position: absolute; 
	 	top: 195px; left : 485px;
	 	Z-INDEX: 3;
	} 
	#fifthImg { 
	 	position: absolute; 
	 	top: 180px; left : 600px;
	 	Z-INDEX: 3;
	} 
	#sixthImg { 
	 	position: absolute; 
	 	top: 310px; left : 700px;
	 	Z-INDEX: 3;
	}
	.updateDaily{
		width:500px;
		height:500px;
		margin-left:700px;
	}
	.dailyEvent{
		width:100%;
		height:800px;
	} 
	#showMerchandise{
		Z-INDEX: 5;
	} 
  </style>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	      		
      		<div class="forDiv">
				<img src="${pageContext.request.contextPath }/event/coolarrow.png" width="300px" id="playImg" />
				<img src="${pageContext.request.contextPath }/event/roulette_bg.png" width="500px" id="circleImg"/>  
				<span id="firstImg" class="imm"><img width="45px" src='<c:url value="/event/coffee.png"></c:url>'></span>
				<span id="secondImg" class="imm"><input type="hidden" value="87"/>銘謝惠顧</span>
				<span id="thirdImg" class="imm"><img width="45px" src='<c:url value="/event/coffee.png"></c:url>'></span>
				<span id="fourthImg" class="imm"><input type="hidden" value="87"/>銘謝惠顧</span>
				<span id="fifthImg" class="imm"><img width="45px" src='<c:url value="/event/coffee.png"></c:url>'></span>
				<span id="sixthImg" class="imm"><input type="hidden" value="87"/>銘謝惠顧</span>
			</div>
	<jsp:include page="/backstage/header.jsp"></jsp:include>
	<div class="content-wrapper">
		
    	<div class="container-fluid">
<!-- Breadcrumbs-->
      		<ol class="breadcrumb">
        		<li class="breadcrumb-item">
          			<a href="${pageContext.request.contextPath}/backstage/index.jsp">回首頁</a>
        		</li>
        		<li class="breadcrumb-item active">活動管理</li>
        		<li class="breadcrumb-item">
          			<a href="${pageContext.request.contextPath}/backstage/dailyeventmanage.jsp">每日活動</a>
        		</li>
      		</ol>
      		<div class="dailyEvent">
				<div class="updateDaily" style="margin-top:100px">
					<table id="showMerchandise"></table>
					<div>
						<button class="btn btn-primary" id="update">更改活動</button>
						<button class="btn btn-secondary" id="init">初始化</button>
					</div>
				</div>
      		</div>      
      		<div class="row">
        		<div class="col-12"></div>
      		</div>
    	</div>
    	
	</div>
 		<div class="modal" id="myModal" style="display:none;">
		  	<div class="modal-dialog">
		    	<div class="modal-content">
			    	<!-- Modal Header -->
				    <div class="modal-header">
				        <h4 class="modal-title">提示</h4>
				        <button type="button" class="close" onclick="document.getElementById('myModal').style.display='none'">&times;</button>
				    </div>
				
				    <!-- Modal body -->
				    <div class="modal-body">
				        <p>確定要更改?</p>
				    </div>
			
			      	<!-- Modal footer -->
			    	<div class="modal-footer">
			    		<button type="submit" class="btn btn-primary" id="gogo">確定</button>
			        	<button type="button" class="btn btn-secondary" onclick="document.getElementById('myModal').style.display='none'">取消</button>
			    	</div>
		    	</div>
	  		</div>
		</div>	
	<jsp:include page="/backstage/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<script>
	$(function(){
		var roundDecimal = function (val, precision) {
			  return Math.round(Math.round(val * Math.pow(10, (precision || 0) + 1)) / 10) / Math.pow(10, (precision || 0));
			}
		$('#update').on('click',function(){
			$('#myModal').css('display','block');
		});
		$('#gogo').on('click',function(e){
			e.preventDefault();
// 			var formData = new FormData();
// 			formData.append('discount1',$('#firstImg input:eq(0)').val());
// 			formData.append('discount2',$('#thirdImg input:eq(0)').val());
// 			formData.append('discount3',$('#fifthImg input:eq(0)').val());
// 			formData.append('merchandiseId1',$('#fifthImg input:eq(1)').val());
// 			formData.append('merchandiseId2',$('#fifthImg input:eq(1)').val());
// 			formData.append('merchandiseId3',$('#fifthImg input:eq(1)').val());
			console.log($('#firstImg input:eq(0)').val().toString());
			console.log($('#firstImg input:eq(1)').val().toString());
			$.ajax({
				url : '/DizzyCafe/updateDaily.controller',
				data : {
					'discount1' : $('#firstImg input:eq(0)').val().toString(),
					'discount2' : $('#thirdImg input:eq(0)').val().toString(),
					'discount3' : $('#fifthImg input:eq(0)').val().toString(),
					'merchandiseId1' : $('#firstImg input:eq(1)').val().toString(),
					'merchandiseId2' : $('#thirdImg input:eq(1)').val().toString(),
					'merchandiseId3' : $('#fifthImg input:eq(1)').val().toString()
				},
				type : 'POST',
				success : function(){
					alert('修改成功');
					location.reload();
				}
			});
		});
		$('#init').on('click',function(){
			location.reload();
		});
		
		$.getJSON('/DizzyCafe/getItem.controller',function(showItems){
			console.log(showItems);
			$('#firstImg').html('<img width="45px" src="<c:url value="/event/coffee.png"></c:url>"><span>' 
					+ showItems[0].merchandiseName + '</span><br><span style="margin-left:45px">' 
					+ '<input type="text" style="width:40px;z-index:6" value="'+ (showItems[0].discount*100).toString().split('0')[0] 
					+ '"/>' + '折</span>'
					+ '<input type="hidden" value="' + showItems[0].merchandiseId+'"/>');
			$('#thirdImg').html('<img width="45px" src="<c:url value="/event/coffee.png"></c:url>"><span>' 
					+ showItems[1].merchandiseName + '</span><br><span style="margin-left:45px">' 
					+ '<input type="text" style="width:40px;z-index:6" value="'+ (showItems[1].discount*100).toString().split('0')[0]
					+ '"/>' + '折</span>'
					+ '<input type="hidden" value="' + showItems[1].merchandiseId+'"/>');
			$('#fifthImg').html('<img width="45px" src="<c:url value="/event/coffee.png"></c:url>"><span>' 
					+ showItems[2].merchandiseName + '</span><br><span style="margin-left:45px">' 
					+ '<input type="text" style="width:40px;z-index:6" value="'+ (showItems[2].discount*100).toString().split('0')[0] 
					+ '"/>' + '折</span>'
					+ '<input type="hidden" value="' + showItems[2].merchandiseId+'"/>');
		});
		$('#showMerchandise').DataTable({
			ajax : {
				url : '/DizzyCafe/showinbackstage.controller',
				type : 'POST',
				dataSrc : ""
			},
// 			columns : [{
// 				data : 'merchandiseName',
// 				title : '商品名稱',
// 				width : '100px'
// 			},{
// 				data : 'merchandiseId',
// 				title : '商品編號',
// 				width : '100px'
// 			}],
			"columnDefs" : [{
				"targets" : 1,
				"data" : null,
				"render" : function(data,row) {
// 					var html = data.merchandiseName + '<input type="hidden" id="i' 
// 							+ data.merchandiseId + '" value="' + data.merchandiseId + '">'
					var html = data.merchandiseName;
					return html;
				},
				title : '商品名稱',
				width : '200px'
			},{
				targets : 0,
				data : null,
				title : '商品編號',
				width : '100px',
				render : function(data,row) {
// 					var html = data.merchandiseId + '<input type="hidden" id="n' 
// 							+ data.merchandiseId + '" value="' + data.merchandiseName + '">'
					var html = data.merchandiseId;
					return html;
				},
			}],
			createdRow : function( row, data, dataIndex ){
				$( row ).find('td:eq(1)').draggable({
					helper : "clone",
				    revert : "invalid",
				    zIndex : 100,
				    cursorAt: { top: 0, left: 0 },
				    stop : function(e,ui){
				    	console.log(ui.offset);
				    	if((215<ui.offset.top && ui.offset.top<275) && (620<ui.offset.left && ui.offset.left<740)){
				    		$('#fifthImg').find('span:eq(0)').html($(e.target).html());
				    		$('#fifthImg').find('input:eq(1)').val($(e.target).parent().find('td:eq(0)').html());
				    	}else if(460<ui.offset.top && ui.offset.top<520 && 620<ui.offset.left && ui.offset.left<740){
				    		$('#firstImg').find('span:eq(0)').html($(e.target).html());
				    		$('#firstImg').find('input:eq(1)').val($(e.target).parent().find('td:eq(0)').html());
				    	}else if(335<ui.offset.top && ui.offset.top<395 && 415<ui.offset.left && ui.offset.left<535){
				    		$('#thirdImg').find('span:eq(0)').html($(e.target).html());
				    		$('#thirdImg').find('input:eq(1)').val($(e.target).parent().find('td:eq(0)').html());
				    	}
				    }
				});
			},
			language : {
				paginate : {
					next : "下一頁",
					previous : "上一頁"
				},
				lengthMenu : '一頁顯示 _MENU_ 筆資料'
			},
			order : [0,'asc'],
			info : false
		});
		
	});
	</script>
</body>
</html>