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
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<jsp:include page="/backstage/header.jsp"></jsp:include>
<jsp:include page="/backstage/footer.jsp"></jsp:include>
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
		</div>
		
	    <div style="clear:both;">
    		<button id="minghui_carouselUpdate" class="btn btn-primary ml-1 mt-1">修改</button>
    		<button id="minghui_carouselSubmit" class="btn btn-primary ml-1 mt-1">送出</button>
    		<button id="minghui_carouselCancel" class="btn btn-primary ml-1 mt-1">取消</button>
    	</div>
	</div>
</div>
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
				
				$.ajax({
		 			url:'/DizzyCafe/showyou.controller',
					method:'GET',
					success:function(datas){
						var minghui_activity_info = $('#minghui_activity_info');
						$(datas).each(function(index,data){

							var cell_input = $('<input type="checkbox" class="form-check-input" value="'+ data.activityNo +'" disabled>' + data.activityName + '</input>');
							
							for(var i = 0; i < array.length; i++){
								if(array[i] == data.activityNo)	{
									cell_input.prop('checked', true);
								}
							}					
							
							var cell_label = $('<label class="form-check-label"></label>').append(cell_input);
							var cell_div = $('<div class="form-check-label"></div>').append(cell_label);
							
							minghui_activity_info.append(cell_div);
						});
						

					}
		 		});
				
				
			}
		}); 		
 		
 	});
 
 	$("#minghui_carouselPreview").on('click',function(){ 	 		
 		$("#carouselExampleIndicators").toggle(500); 		
 	}); 
 	
	$("#minghui_carouselUpdate").on('click',function(){ 	
		input_is_checked = $('#minghui_activity_info input:checked');
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
				console.log(datas);
			}
		});
				
 		$('#minghui_activity_info input').prop('disabled', true);
 		location.reload();
 	});	
	
	$("#minghui_carouselCancel").on('click',function(){ 
		$('#minghui_activity_info input:checkbox').prop('checked',false);
		
		$(input_is_checked).prop('checked',true);
		
 		$('#minghui_activity_info input').prop('disabled', true);
 	});
   </script>
</body>
</html>