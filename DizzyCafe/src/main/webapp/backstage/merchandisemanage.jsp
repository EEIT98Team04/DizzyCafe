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
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- Custom fonts for this template-->
<!-- <link href="vendor/font-awesome/css/font-awesome.min.css" -->
<!-- 	rel="stylesheet" type="text/css"> -->
<!-- Custom styles for this template-->
<!-- <link href="css/sb-admin.css" rel="stylesheet"> -->
<link rel="stylesheet"
	href='${pageContext.request.contextPath }/minghui/css/minghui.css'>
<link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	rel="stylesheet">
<style>
.forText {
	margin: 10px auto;
}

.insertMerchandise {
	margin: auto;
	width: 800px;
}

.container label {
	width: 150px;
}

.container-fluid {
	margin-top: 50px;
}
</style>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="/backstage/index.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">

			<div>
				<table id="dataTable"></table>
			</div>

			<button id="createMerchandise" class="btn btn-primary">新增商品</button>
		</div>
		<div id="insertMerchandise" class="minghui_modal">
			<form class="minghui_modal-content animate" id="submitForm">
				<div class="imgcontainer">
					<span
						onclick="document.getElementById('insertMerchandise').style.display = 'none';"
						class="close" title="關閉視窗">&times;</span>
				</div>
				<div class="container">
					<label><b>商品名稱</b></label><input name="merchandiseName"
						type="textarea" class="forText" required /><br> <label><b>商品價格</b></label><input
						name="merchandisePrice" type="textarea" class="forText" required /><br>
					<label><b>商品數量</b></label><input name="merchandiseQuantity"
						type="textarea" class="forText" required /><br> <label><b>商品狀態</b></label><input
						name="merchandiseStatus" type="textarea" class="forText" required /><br>
					<label><b>商品類別</b></label><input name="merchandiseTag"
						type="textarea" class="forText" required /><br> <label><b>商品敘述</b></label><input
						name="merchandiseContent" type="textarea" class="forText" required
						id="editor1" /><br> <label><b>商品圖片</b></label><input
						name="merchandisePicture" type="file" multiple class="forText" accept="image/*" required
						id="uploadImage" /><br> <img id="showImg" width="240px" /> <br>
					<p style="margin: auto; width: 300px; text-align: center;"
						class="forText">
						<button class="btn btn-primary" type="button" id="forSubmit">create</button>
					</p>
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
	</div>

	<script src="ckeditor/ckeditor.js"></script>
	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script
		src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<script>
		//	     文字編輯器
		CKEDITOR.replace('editor1');
		//  視窗彈起來
		var insertMerchandise = document.getElementById('insertMerchandise');
		var myModal = document.getElementById('myModal');
		$(function() {
			$('#createMerchandise').click(function() {
				$('#insertMerchandise').css('display', 'block');
			});

			window.onclick = function(event) {
				if (event.target == insertMerchandise) {
					insertMerchandise.style.display = "none";
				}
				if(event.target == myModal){
					myModal.style.display = "none";
    			}
			}
			$("#uploadImage").change(function() {
				readImage(this);
			});
			$('#forSubmit').click(function(){
				$('#myModal').css('display','block');
				// 取得文字編輯器裡面的內容
				var Content = CKEDITOR.instances.editor1.getData();
				$('input[name=merchandiseContent]').val(Content);
			});
			
			$('#gogo').on('click',(function(e){
    			e.preventDefault();
    			var form = $('#submitForm')[0];
    			var formData = new FormData(form);
    			$("#gogo").prop("disabled", true);
    			console.log(formData);
    			$.ajax({
    				url: '/DizzyCafe/createmerchandise.controller',
    				type: 'post',
    				data: formData,
    				enctype: 'multipart/form-data',
    				contentType: false,
    				cache: false,
    				processData: false,
    				success: function(){
    					insertMerchandise.style.display = "none";
    					$('#myModal').css('display','none');
    				}
    				error: function(){
    					alert("資料傳送不成功");
    				}
    			});
    			}));
    			
			function readImage(input) {
				if (input.files && input.files[0]) {
					var FR = new FileReader();
					FR.onload = function(e) {
						//e.target.result = base64 format picture
						$('#showImg').attr("src", e.target.result);
					};
					FR.readAsDataURL(input.files[0]);
				}
			}
		});
			

		//顯示資料表dataTable
		$('#dataTable').DataTable({
			ajax : {
				url : '/DizzyCafe/showinbackstage.controller',
				type : 'POST',
				dataSrc : ''
			},
			columns : [ {
				data : 'merchandiseId',
				title : '商品編號',
				width : '10%',
			}, {
				data : 'merchandiseName',
				title : '商品名稱',
				width : '10%',
			}, {
				data : 'merchandisePrice',
				title : '商品價格',
				width : '10%',
			}, {
				data : 'merchandisePicture',
				title : '商品圖片',
				width : '10%',
			}, {
				data : 'merchandiseContent',
				title : '商品敘述',
				width : '10%',
			}, {
				data : 'merchandiseQuantity',
				title : '商品數量',
				width : '10%',
			}, {
				data : 'merchandiseTag',
				title : '商品類別',
				width : '10%',
			}, {
				data : 'merchandiseStatus',
				title : '商品狀態',
				width : '10%',
			} ],
			language : {
				paginate : {
					next : "下一頁",
					previous : "上一頁"
				},
				lengthMenu : '一頁顯示 _MENU_ 筆資料'
			},
			info : false,
			order : [ 0, 'asc' ]
		});
	</script>
	<jsp:include page="/backstage/footer.jsp"></jsp:include>
</body>
</html>