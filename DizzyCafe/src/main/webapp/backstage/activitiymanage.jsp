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
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" href='${pageContext.request.contextPath }/minghui/css/minghui.css'>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
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
  </style>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html">DizzyCafe Backstage</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="${pageContext.request.contextPath }/index.jsp">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">前台首頁</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="${pageContext.request.contextPath }/backstage/activitiymanage.jsp">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">Activities</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="tables.html">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">Tables</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Menu Levels">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-sitemap"></i>
            <span class="nav-link-text">Menu Levels</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMulti">
            <li>
              <a href="#">Second Level Item</a>
            </li>
            <li>
              <a href="#">Second Level Item</a>
            </li>
            <li>
              <a href="#">Second Level Item</a>
            </li>
            <li>
              <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti2">Third Level</a>
              <ul class="sidenav-third-level collapse" id="collapseMulti2">
                <li>
                  <a href="#">Third Level Item</a>
                </li>
                <li>
                  <a href="#">Third Level Item</a>
                </li>
                <li>
                  <a href="#">Third Level Item</a>
                </li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
          <a class="nav-link" href="#">
            <i class="fa fa-fw fa-link"></i>
            <span class="nav-link-text">Link</span>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
    
    
    
    
    
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Blank Page</li>
      </ol>
      <div class="row">
        <div class="col-12">
        	
        </div>
      </div>
		<div style="width: 70%;">
			<table id="test"></table>
		</div>
        
        
		<button class="btn btn-primary" id="createEvent">create</button>
    </div>
    
    
    
    
    
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © DizzyCafe 2017</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
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
				<label for="from"><b>活動開始時間</b></label><input type="text" id="from" name="activityStart" class="forText" required> <br> 
				<label for="to"><b>活動結束時間</b></label><input type="text" id="to" name="activityEnd" class="forText" required> <br> 
				<label><b>活動內容</b></label><input type="text" name="activityContent" class="forText" required id="editor1"> <br>
				<label><b>活動圖片</b></label><input type="file" name="activityPicture" class="forText" accept="image/*" required id="uploadImage">
				<img id="showImg" width="240px"/>
				<br>
				<p style="margin:auto;width:300px;text-align: center;" class="forText"><button class="btn btn-primary" type="button" id="forSubmit">create</button></p>
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
		        	<button type="button" class="btn btn-secondary" >取消</button>
		    	</div>
	    	</div>
  		</div>
	</div>
	   
  </div>
      
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <script src="ckeditor/ckeditor.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script>
//     文字編輯器
    	CKEDITOR.replace( 'editor1' );
//     視窗彈起來
    	var insertEvent = document.getElementById('insertEvent');
    	var boom = document.getElementById('myModal');
    	var data;
    	$(function(){
    		$('#createEvent').click(function(){
    			$('#insertEvent').css('display','block');
    		});
    		window.onclick = function(event) {
    			if (event.target == insertEvent) {
    				insertEvent.style.display = "none";
    			}
    			if(event.target == boom){
    				boom.style.display = "none";
    			}
    		}
    		$("#uploadImage").change(function(){
       	      	readImage( this );
       	    });
    		$('#forSubmit').click(function(){
    			$('#myModal').css('display','block');
    			data = CKEDITOR.instances.editor1.getData();
    			$('input[name=activityContent]').val(data);
    		});
    		
    		
    		$('#gogo').on('click',(function(e){
    			e.preventDefault();
    			var form = $('#submitForm')[0];
    			var formData = new FormData(form);
    			$("#gogo").prop("disabled", true);
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
    					insertEvent.style.display = "none";
    					$('#myModal').css('display','none');
    				}
    			});
    		}));
       	    function readImage(input) {
       	      if ( input.files && input.files[0] ) {
       	        var FR= new FileReader();
       	        FR.onload = function(e) {
       	          //e.target.result = base64 format picture
       	          $('#showImg').attr( "src", e.target.result );
       	        };       
       	        FR.readAsDataURL( input.files[0] );
       	      }
       	    }
    	});
    </script>
    <script>
//     	選日期
	  $( function() {
	    var dateFormat = "mm/dd/yy",
	      from = $( "#from" )
	        .datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 1
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#to" ).datepicker({
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
  $('#test').DataTable({
		ajax : {
			url : '/DizzyCafe/showyou.controller',
			type : 'POST',
			dataSrc : ''
// 			dataSrc : 
// 				function ( json ) {
// 					for ( var i=0, ien=json.length ; i<ien ; i++ ) {
//   					if(json[i].couponStatus == 0){
//   						json[i].couponStatus = '未使用';
//   					}else if(json[i].couponStatus == 1){
//   						json[i].couponStatus = '已使用';
//   					}else if(json[i].couponStatus == 2){
//   						json[i].couponStatus = '已過期';
//   					}
// 					}
// 					console.log(json);
// 				return json;
// 				}
		},
		columns : [ {
			data : 'activityNo'
		}, {
			data : 'activityName'
		}, {
			data : 'activityStart'
		}, {
			data : 'activityEnd'
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
  </script>

</body>
</html>