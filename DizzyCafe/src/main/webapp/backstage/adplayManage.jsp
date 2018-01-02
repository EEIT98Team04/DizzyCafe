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
  	/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
  </style>
  <jsp:include page="../HTML/TitleIcon.jsp" />
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<jsp:include page="/backstage/header.jsp"></jsp:include>
<div class="content-wrapper">
    <div class="container-fluid">  
		<div id="carouselExampleIndicators" class="carousel slide border border-light w-50 float-left" data-pause="false" data-ride="carousel" data-interval="3000">
	        <div class="carousel-inner">
	        </div>
	        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="sr-only">Previous</span>
	        </a>
	        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="sr-only">Next</span>
	        </a>
	    </div>
	    
	    <div id="minghui_activity_info" class="container">
	    <div>
			<table id="test"></table>
		</div>
		</div>
		
	    <div class="float-right">
    		<button id="minghui_carouselUpdate" class="btn btn-primary ml-1 mt-1">修改</button>
    		<span>
    			<button id="minghui_carouselSubmit" class="btn btn-primary ml-1 mt-1" disabled>送出</button>
    			<button id="minghui_carouselCancel" class="btn btn-primary ml-1 mt-1" disabled>取消</button>
    		</span>
    	</div>
	</div>
</div>

<jsp:include page="/backstage/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="ckeditor/ckeditor.js"></script>
<!--     <script src="js/sb-admin.min.js"></script> -->
    <script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
 <script>
 	var input_is_checked;
 
 	$(function(){
 		var array = [];
 		
 		$.ajax({
			url:'/DizzyCafe/getCarousel.controller',
			method:'GET',
			success:function(datas){
				
				var cell_div_carousel_inner = $('#carouselExampleIndicators>div.carousel-inner');
				var clientHeight = window.screen.height / 2 - 100;
				
				for(var i = 0; i < datas.length; i++){
					array[i] = datas[i].id;
					
					var class_carousel_item = "carousel-item";
					if(i == 0){
						class_carousel_item = "carousel-item active";
					}
					var cell_a = $('<a></a>').attr("href", "/DizzyCafe/activities?No=" + (datas[i].id - 1000));
					var cell_img = $('<img style="width:100%; height:' + clientHeight + 'px" class="d-block" alt="no image" />').attr('src','/DizzyCafe'+datas[i].activityPicture);
					cell_a.append(cell_img);
					var cell_h3 = $('<h3></h3>').text(datas[i].activityName);
					var cell_div_carousel_caption = $('<div class="carousel-caption d-none d-md-block"></div>').append(cell_h3);
					var cell_div_carousel_item = $('<div></div>').addClass(class_carousel_item).append([cell_a, cell_div_carousel_caption]);
					cell_div_carousel_inner.append(cell_div_carousel_item);
				}
				
				
			}
		}); 	
 		
 		var count = 0;
 	  	var table = $('#test').DataTable({
 			ajax : {
 				url : '/DizzyCafe/showyou.controller',
 				type : 'POST',
 				dataSrc : ''
 			},
 			columns : [ {
 				data : 'activityNo',
 				title : '活動編號',
 				width : '300px'
 			}, {
 				data : 'activityName',
 				title : '活動名稱',
 				width : '300px'
 			}, {
 				title : '修改',
 				width : '300px'
 			}],
 			"columnDefs" : [{
 				"targets" : 2,
 				"data" : null,
 				"render" : function(data,row) {
 					if(array.includes(data.activityNo)){
	 					var html = '<label class="switch"><input type="checkbox" value="'+ data.activityNo +'" checked disabled><span class="slider round"></span></label>';
 					} else{
 						var html = '<label class="switch"><input type="checkbox" value="'+ data.activityNo +'" disabled><span class="slider round"></span></label>';
 					}
 					
 					return html;
 				}
 			}],
 			language : {
 				paginate : {
 					next : "下一頁",
 					previous : "上一頁"
 				},
 				lengthMenu : '一頁顯示 _MENU_ 筆資料'
 			},
 			info : false,
 			order : [0,'asc'],
 			rowId : 'activityNo'
 		});
 		
 	});
 
 	$("#minghui_carouselPreview").on('click',function(){ 	 		
 		$("#carouselExampleIndicators").toggle(500); 		
 	}); 
 	
	$("#minghui_carouselUpdate").on('click',function(){ 	
		input_is_checked = $('#minghui_activity_info input:checked');
		$(this).prop('disabled', true);
		$('#minghui_carouselUpdate').parent().children('span').find('button').prop('disabled', false);
 		$('#minghui_activity_info input').prop('disabled', false);
 	});
	
	$("#minghui_carouselSubmit").on('click',function(){ 
		var a = {};
		$('#minghui_activity_info input:checked').each(function(index,data){
			var key = index + 1;
			a[key] = $(data).val();
		});

		$.ajax({
			url:'/DizzyCafe/changeAdplayController.controller',
			method:'POST',
			data: a,
			success:function(datas){
				if(datas){
					alert('修改成功');
			 		location.reload();
				}
			}
		});
				
 	});	
	
	$("#minghui_carouselCancel").on('click',function(){ 
		$('#minghui_activity_info input:checkbox').prop('checked',false);		
		$(input_is_checked).prop('checked',true);		
 		$('#minghui_activity_info input').prop('disabled', true);
 		
 		
 		$('#minghui_carouselUpdate').parent().children('span').find('button').prop('disabled', true);
 		$('#minghui_carouselUpdate').prop('disabled', false);
 	});
	
	
   </script>   
</body>
</html>