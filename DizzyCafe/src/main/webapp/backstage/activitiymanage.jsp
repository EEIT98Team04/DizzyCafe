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
  	label{
  		width:100px;
  	}
  </style>
  <jsp:include page="/HTML/TitleIcon.jsp" />
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
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
          <a href="${pageContext.request.contextPath}/backstage/activitymanage.jsp">活動清單</a>
        </li>
      </ol>
      <div class="row">
        <div class="col-12">
        	
        </div>
      </div>
		<div style="width:1000px;margin:auto;">
			<table id="test"></table>
		</div>
        
        
		<button class="btn btn-primary btn-lg" style='margin-left:300px' id="createEvent">新增活動</button>
    </div>
    
    <!-- InsertForm Modal-->
    <div id="insertEvent" class="minghui_modal" >

		<form class="minghui_modal-content animate" id="submitForm">
			<%-- 			action="<c:url value="/TestImg.do" />" method="post"> --%>
			<div class="imgcontainer">
				<span
					onclick="document.getElementById('insertEvent').style.display='none'"
					class="close" title="關閉視窗">&times;</span> <br>
			</div>

			<div class="container">
				<label><b>活動名稱</b></label><input type="text" name="activityName" required class="forText"> <br> 
				<label for="from"><b>活動開始時間</b></label><input type="text" id="from" name="activityStart" class="forText" required readonly> <br> 
				<label for="to"><b>活動結束時間</b></label><input type="text" id="to" name="activityEnd" class="forText" required readonly> <br>
				<label><b>折價商品</b></label><span id="help"><select name="merchandiseTag">
					<option value="" selected>請選擇</option>
					<option value="bean">咖啡豆</option>
					<option value="bottle">保溫瓶</option>								
				</select><span style="margin-left:30px"><label><b>折扣</b></label><input type="text" name="activityDiscount" class="forText" style="width:50px;">折</span><br></span>  
				<label><b>活動內容</b></label><input type="text" name="activityContent" class="forText" required id="editor1"> <br>
				<label><b>活動圖片</b></label><input type="file" name="activityPicture" class="forText" accept="image/*" required id="uploadImage">
				<img id="showImg" width="240px"/>
				<br>
				<p style="margin:auto;width:300px;text-align: center;" class="forText"><button class="btn btn-primary" type="button" id="forSubmit">執行</button></p>
			</div>

		</form>
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
			        <p>確定要新增?</p>
			    </div>
		
		      	<!-- Modal footer -->
		    	<div class="modal-footer">
		    		<button type="submit" class="btn btn-primary" id="gogo">確定</button>
		        	<button type="button" class="btn btn-secondary" onclick="document.getElementById('myModal').style.display='none'">取消</button>
		    	</div>
	    	</div>
  		</div>
	</div>
	<div id="updateEvent" class="minghui_modal" >

		<form class="minghui_modal-content animate" id="submitForm2">
			<%-- 			action="<c:url value="/TestImg.do" />" method="post"> --%>
			<div class="imgcontainer">
				<span
					onclick="document.getElementById('updateEvent').style.display='none'"
					class="close" title="關閉視窗">&times;</span> <br>
			</div>

			<div class="container">
				<input type="hidden" name="ADnumber">
				<input type="hidden" name="activityNo">
				<label><b>活動名稱</b></label><input type="text" name="activityName" class="forText"> <br> 
				<label for="from"><b>活動開始時間</b></label><input type="text" id="from2" name="activityStart" class="forText" readonly> <br> 
				<label for="to"><b>活動結束時間</b></label><input type="text" id="to2" name="activityEnd" class="forText" readonly> <br>
				<label><b>折價商品</b></label><select name="merchandiseTag">
					<option value="" selected>請選擇</option>
					<option value="bean">咖啡豆</option>
					<option value="bottle">保溫瓶</option>								
				</select><span style="margin-left:30px"><label><b>折扣</b></label><input type="text" name="activityDiscount" class="forText" style="width:50px;">折</span> <br> 
				<label><b>活動內容</b></label><input type="text" name="activityContent" class="forText" id="editor2"> <br>
				<label><b>活動圖片</b></label><input type="file" name="activityPicture" class="forText" accept="image/*" id="uploadImage2">
				<img width="240px"/>
				<br>
				<p style="margin:auto;width:300px;text-align: center;" class="forText"><button class="btn btn-primary" type="button" id="forSubmit2">執行</button></p>
			</div>

		</form>
	</div>
	
	<div class="modal" id="myModal2" style="display:none;">
	  	<div class="modal-dialog">
	    	<div class="modal-content">
		    	<!-- Modal Header -->
			    <div class="modal-header">
			        <h4 class="modal-title">提示</h4>
			        <button type="button" class="close" onclick="document.getElementById('myModal2').style.display='none'">&times;</button>
			    </div>
			
			    <!-- Modal body -->
			    <div class="modal-body">
			        <p>確定要修改?</p>
			    </div>
		
		      	<!-- Modal footer -->
		    	<div class="modal-footer">
		    		<button type="submit" class="btn btn-primary" id="gogo2">確定</button>
		        	<button type="button" class="btn btn-secondary" onclick="document.getElementById('myModal2').style.display='none'">取消</button>
		    	</div>
	    	</div>
  		</div>
	</div>		   
  </div>
  <jsp:include page="/backstage/footer.jsp"></jsp:include>
    <!-- Bootstrap core JavaScript-->
<!--     <script src="vendor/jquery/jquery.min.js"></script> -->
<!--     <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
    <!-- Core plugin JavaScript-->
<!--     <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->
    <!-- Custom scripts for all pages-->
    
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="ckeditor/ckeditor.js"></script>
<!--     <script src="js/sb-admin.min.js"></script> -->
    <script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <script>
//     	選日期
	  $( function() {
	    var dateFormat = "yy-mm-dd",
	      from = $( "#from" )
	        .datepicker({
	          dateFormat:dateFormat,
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#to" ).datepicker({
	    	 dateFormat:dateFormat,
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 1
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );
	      });
	    var from2 = $( "#from2" )
        .datepicker({
        	dateFormat:dateFormat,
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	        to2 = $( "#to2" ).datepicker({
	        	dateFormat:dateFormat,
		        defaultDate: "+1w",
		        changeMonth: true,
		        numberOfMonths: 1
		      })
		      .on( "change", function() {
		        from.datepicker( "option", "maxDate", getDate( this ) );
		      });
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	      return date;
	    }
	  });
  </script>
  <script>
//   顯示資料表
// 	$(function(){
		var hoho = 0;
		var count = 0;
	  	var table = $('#test').DataTable({
			ajax : {
				url : '/DizzyCafe/showyou.controller',
				type : 'POST',
				dataSrc : ''
			},
			initComplete : function(data,row){ 
				CKEDITOR.replace( 'editor2' );
			},
			drawCallback : function(row){
// 				console.log(row);
				if(count===0){
					count++;
				}else{
					for(var i=0;i<row.aoData.length;i++){
						var temp = row.aoData[i]._aData;
						var Month = ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'];
						var Monthx = ['01','02','03','04','05','06','07','08','09','10','11','12'];
						$('#edit'+i).unbind();
						$('#edit'+i).on('click',function(e){
							var id = $(this).attr('id').split('t')[1];
							var good = row.aoData[id]._aData;
							$('#updateEvent').css('display','block');
							$('#updateEvent input[name=ADnumber]').val(good.ADnumber);
							$('#updateEvent input[name=activityName]').val(good.activityName);
// 							for(var j = 0 ; j<12 ; j++){
// 								xx = good.activityStart.split(' ');
// 								yy = good.activityEnd.split(' ');
// 								var hoho = 0;
// 								if(xx[0]==Month[j]){
// 									$('#updateEvent input[name=activityStart]').val(xx[2]+'-'+Monthx[j]+'-'+xx[1].split(',')[0]);
// 									hoho++;
// 								}
// 								if(yy[0]==Month[j]){
// 									$('#updateEvent input[name=activityEnd]').val(yy[2]+'-'+Monthx[j]+'-'+yy[1].split(',')[0]);
// 									hoho++;
// 								}
// 								if(hoho==2){
// 									break;
// 								}
// 							}
							$('#updateEvent input[name=activityStart]').val(good.activityStart);
							$('#updateEvent input[name=activityEnd]').val(good.activityEnd);
							CKEDITOR.instances.editor2.setData(good.activityContent);
							$('#updateEvent input[name=activityNo]').val(good.activityNo);
							$('#updateEvent img').attr('src','/DizzyCafe/'+good.activityPicture);
							$('#updateEvent input[name=activityDiscount]').val((good.activityDiscount*100).toString().split('0')[0]);
							if(good.merchandiseTag=='bottle'){
								$('#updateEvent option:eq(2)').prop('selected',true);
							}else if(good.merchandiseTag=='bean'){
								$('#updateEvent option:eq(1)').prop('selected',true);
							}
				    	});			
					}
				}  
			},
			columns : [ {
				data : 'activityNo',
				title : '活動編號',
				width : '100px'
			}, {
				data : 'activityName',
				title : '活動名稱',
				width : '350px'
			}, {
				data : 'activityStart',
				title : '起始日期',
				width : '200px'
			}, {
				data : 'activityEnd',
				title : '結束日期',
				width : '200px'
			},{
				width : '100px'
			}],
			"columnDefs" : [{
				"targets" : 4,
				"data" : null,
				"render" : function(data,row,meta) {
// 					var html = "<a href='#' class='btn btn-success' id='edit"+data.activityNo+"'><i class='fa fa-pencil' aria-hidden='true'></i></a>";
					var html = "<a href='#' class='btn btn-success' id='edit"+hoho+"'><i class='fa fa-pencil' aria-hidden='true'></i></a>";
					hoho++;
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
			order : [0,'desc'],
			rowId : 'activityNo'
		});
// 	});
  </script>
    <script>
//     文字編輯器
    	CKEDITOR.replace( 'editor1' );
//     視窗彈起來
    	var insertEvent = document.getElementById('insertEvent');
    	var boom = document.getElementById('myModal');
    	var updateEvent = document.getElementById('updateEvent');
    	var boom2 = document.getElementById('myModal2');
    	var data;
    	$(function(){
    		$('#createEvent').click(function(){
    			$('#submitForm')[0].reset();
    			CKEDITOR.instances.editor1.setData("");
    			$('#submitForm img').removeAttr('src');
    			$('#insertEvent').css('display','block');
    		});
    		window.onclick = function(event) {
    			if (event.target == insertEvent) {
    				insertEvent.style.display = "none";
    			}
    			if(event.target == boom){
    				boom.style.display = "none";
    			}
    			if (event.target == updateEvent) {
    				updateEvent.style.display = "none";
    			}
    			if(event.target == boom2){
    				boom2.style.display = "none";
    			}
    		}
    		$("#uploadImage").change(function(){
       	      	readImage( this );
       	    });
    		$("#uploadImage2").change(function(){
       	      	readImage2( this );
       	    });
    		$('#forSubmit').click(function(){
    			data = CKEDITOR.instances.editor1.getData();
    			$('#insertEvent input[name=activityContent]').val(data);
    			if($('#insertEvent input[name=activityName]').val()==""){
    				alert('請填活動名稱');
    			}else if($('#insertEvent input[name=activityStart]').val()==""){
    				alert('請填開始時間');
    			}else if($('#insertEvent input[name=activityEnd]').val()==""){
    				alert('請填結束時間');
    			}else if($('#insertEvent input[name=activityContent]').val()==""){
    				alert('請填內容');
    			}else if($('#insertEvent input[name=activityPicture]').val()==""){
    				alert('請傳圖片');
    			}else{
	    			$('#myModal').css('display','block');				
    			}
    		});
    		$('#forSubmit2').click(function(){
    			$('#myModal2').css('display','block');
    			data = CKEDITOR.instances.editor2.getData();
    			$('#updateEvent input[name=activityContent]').val(data);
    		});
    		
    		$('#insertEvent select[name="merchandiseTag"]').on('change',function(){
    		       $('#help').append('<span style="padding-left:150px"><select name="merchandiseTag"><option value="" selected>請選擇</option><option value="bean">咖啡豆</option><option value="bottle">保溫瓶</option></select><span style="margin-left:30px"><label><b>折扣</b></label><input type="text" name="activityDiscount" class="forText" style="width:50px;">折</span><br/></span>');
    		});
    		
    		
    		$('#gogo').on('click',(function(e){
    			e.preventDefault();
    			var form = $('#submitForm')[0];
    			console.log(form);
    			var formData = new FormData(form);
//     			$("#gogo").prop("disabled", true);
    			console.log(formData);
    			$.ajax({
    				url: '/DizzyCafe/createEvent.controller',
    				type: 'post',
    				data: formData,
    				enctype: 'multipart/form-data',
    				contentType: false,
    				cache: false,
    				processData: false,
    				success: function(){
    					alert('新增成功');
    					insertEvent.style.display = "none";
    					$('#myModal').css('display','none');
    					hoho=0;
    					table.ajax.reload();
    				}
    			});
    		}));
    		$('#gogo2').on('click',(function(e){
        		e.preventDefault();
        		var form = $('#submitForm2')[0];
        		var formData = new FormData(form);
//         			$("#gogo2").prop("disabled", true);
        		console.log(formData);
        		$.ajax({
        			url: '/DizzyCafe/updateEvent.controller',
        			type: 'post',
        			data: formData,
        			enctype: 'multipart/form-data',
        			contentType: false,
        			cache: false,
        			processData: false,
        			success: function(){
        				alert('修改成功');
        				updateEvent.style.display = "none";
        				$('#myModal2').css('display','none');
        				hoho=0;
        				table.ajax.reload();
        			}
        		});
        	}));

       	    function readImage(input) {
       	      if ( input.files && input.files[0] ) {
       	        var FR= new FileReader();
       	        FR.onload = function(e) {
       	          //e.target.result = base64 format picture
       	          $('#insertEvent img').attr( "src", e.target.result );
       	        };       
       	        FR.readAsDataURL( input.files[0] );
       	      }
       	    }
       	 	function readImage2(input) {
      	      if ( input.files && input.files[0] ) {
      	        var FR= new FileReader();
      	        FR.onload = function(e) {
      	          //e.target.result = base64 format picture
      	          $('#updateEvent img').attr( "src", e.target.result );
      	        };       
      	        FR.readAsDataURL( input.files[0] );
      	      }
      	    }
    	});
    </script>
</body>
</html>