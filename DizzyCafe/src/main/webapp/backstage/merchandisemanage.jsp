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
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<!-- datatable  -->
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
	
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
						name="merchandisePicture" type="file" multiple class="forText"
						accept="image/*" required id="uploadImage" /><br> <img
						id="showImg" width="240px" /> <br>
					<p style="margin: auto; width: 300px; text-align: center;"
						class="forText">
						<button class="btn btn-primary" type="button" id="forSubmit">create</button>
					</p>
				</div>
			</form>
		</div>
		
		<div class="modal" id="myModal" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">提示</h4>
						<button type="button" class="close"
							onclick="document.getElementById('myModal').style.display='none'">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<p>確定要新增?</p>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" id="gogo">確定</button>
						<button type="button" class="btn btn-secondary"
							onclick="document.getElementById('myModal').style.display='none'">取消</button>
					</div>
				</div>
			</div>
		</div>

		<div id="updateMerchandise" class="minghui_modal">
			<form class="minghui_modal-content animate" id="submitForm2">
				<div class="imgcontainer">
					<span
						onclick="document.getElementById('updateMerchandise').style.display = 'none'"
						class="close" title="關閉視窗">&times;</span>
				</div>
				
				<div class="container">
					<input type="hidden" name="merchandiseId"> 
					<label><b>商品名稱</b></label>
					<input name="merchandiseName" type="textarea" class="forText" required /><br>
					<label><b>商品價格</b></label>
					<input name="merchandisePrice" type="textarea" class="forText" required /><br> 
					<label><b>商品數量</b></label>
					<input name="merchandiseQuantity" type="textarea" class="forText" required /><br> 
					<label><b>商品狀態</b></label>
					<input name="merchandiseStatus" type="textarea" class="forText" required /><br>
					<label><b>商品類別</b></label>
					<input name="merchandiseTag" type="textarea" class="forText" required /><br> 
					<label><b>商品敘述</b></label>
					<input name="merchandiseContent" type="textarea" class="forText" required id="editor2" /><br> 
					<label><b>商品圖片</b></label>
					<input name="merchandisePicture" type="file" multiple class="forText" accept="image/*" required id="uploadImage2" /><br> 
					<img width="240px" /> <br>
					<p style="margin: auto; width: 300px; text-align: center;"
						class="forText">
						<button class="btn btn-primary" type="button" id="forSubmit2">update</button>
					</p>
				</div>
			</form>
		</div>
		
		<div class="modal" id="myModal2" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">提示</h4>
						<button type="button" class="close"
							onclick="document.getElementById('myModal2').style.display='none'">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<p>確定要更改?</p>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" id="gogo2">確定</button>
						<button type="button" class="btn btn-secondary"
							onclick="document.getElementById('myModal2').style.display='none'">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	  <jsp:include page="/backstage/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="ckeditor/ckeditor.js"></script>
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="//cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script src="//cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script src="//cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script src="//cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>

	<script>
		//顯示資料表dataTable
		var hoho = 0;
			var count = 0;
			var table = $('#dataTable').DataTable({
				ajax : {
					url : '/DizzyCafe/showinbackstage.controller',
					type : 'POST',
					dataSrc : ''
						},
						dom: 'Bfrtip',
						buttons: [
							'copy', 'excel', 'print'
				        ],
				initComplete : function(data, row) {
					CKEDITOR.replace('editor2');
						},
				drawCallback : function(row) {
					if (count === 0) {
					count++;
					} else {
						var temp = {};
						for(var i=0;i<row.aoData.length;i++){
						temp[i] = row.aoData[i]._aData;
						console.log(temp[i].merchandiseId);
						var a = '#edit' + i;
						console.log(a);
						$(a).unbind();
						$(a).click(function(e) {
						var id = $(this).attr('id').split('t')[1];
						console.log(id);
						$('#updateMerchandise').css('display','block');
						$('#updateMerchandise input[name=merchandiseName]').val(temp[id].merchandiseName);
						$('#updateMerchandise input[name=merchandisePrice]').val(temp[id].merchandisePrice);
						$('#updateMerchandise input[name=merchandiseQuantity]').val(temp[id].merchandiseQuantity);
						$('#updateMerchandise input[name=merchandiseStatus]').val(temp[id].merchandiseStatus);
						$('#updateMerchandise input[name=merchandiseTag]').val(temp[id].merchandiseTag);
						$('#updateMerchandise input[name=merchandiseId]').val(temp[id].merchandiseId);
						CKEDITOR.instances.editor2.setData(temp[id].merchandiseContent);
						$('#updateMerchandise img').attr('src','/DizzyCafe/'+ temp[id].merchandisePicture);	
// 						console.log(temp[id].merchandiseId);
// 						alert(temp);
// 						alert(temp.merchandiseId);
						
// 						})
						})
					}
					}
			},
			columns : [ {
					data : 'merchandiseId',
					title : '商品編號',
					width : '10%',
				}, {
					data : 'merchandiseName',
					title : '商品名稱',
					width : '15%',
				}, {
					data : 'merchandisePrice',
					title : '商品價格',
					width : '10%',
				}
//				, {
//					data : 'merchandisePicture',
//					title : '商品圖片',
//					width : '10%',
//				}, {
//					data : 'merchandiseContent',
//					title : '商品敘述',
//					width : '10%',
//				}
				, {
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
					width : '15%',
				} ],
				"columnDefs" : [ {
					"targets" : 6,
					"data" : null,
					"render" : function(data, row) {
					console.log(hoho);
					var html = "<a href='#' class='btn btn-success' id='edit"+hoho+"'><i class='fa fa-pencil' aria-hidden='true'></i></a>"
					hoho++;
					return html;
					}
				} ],
				language : {
					paginate : {
					next : "下一頁",
					previous : "上一頁"
				},
					lengthMenu : '一頁顯示 _MENU_ 筆資料'
					},
					info : false,
					order : [ 0, 'asc' ],
					rowId : 'merchandiseId'		
					
				});
		
		//  文字編輯器
		CKEDITOR.replace('editor1');
		//  視窗彈起來
		var insertMerchandise = document.getElementById('insertMerchandise');
		var updateMerchandise = document.getElementById('updateMerchandise');
		var myModal = document.getElementById('myModal');
		var myModal2 = document.getElementById('myModal2');
		$(function() {
			$('#createMerchandise').click(function() {
				$('#submitForm')[0].reset();
				CKEDITOR.instances.editor1.setData("");
				$('#submitForm img').removeAttr('src');
				$('#insertMerchandise').css('display', 'block');
			});

			window.onclick = function(event) {
				if (event.target == insertMerchandise) {
					insertMerchandise.style.display = "none";
				}
				if (event.target == myModal) {
					myModal.style.display = "none";
				}
				if (event.target == updateMerchandise) {
					updateMerchandise.style.display = "none";
				}
				if (event.target == myModal2) {
					myModal2.style.display = "none";
				}
			}
			$("#uploadImage").change(function() {
				readImage(this);
			});

			$("#uploadImage2").change(function() {
				readImage2(this);
			});

			$('#forSubmit').click(function() {
				// 取得文字編輯器裡面的內容
				Content = CKEDITOR.instances.editor1.getData();
				$('input[name=merchandiseContent]').val(Content);
				if ($('#insertMerchandise input[name=merchandiseName]').val() == "") {
				alert('請填商品名稱')
				} else if ($('#insertMerchandise input[name=merchandisePrice]').val() == "") {
				alert('請填商品價格')
				} else if ($('#insertMerchandise input[name=merchandiseQuantity]').val() == "") {
				alert('請填商品數量')
				} else if ($('#insertMerchandise input[name=merchandiseStatus]').val() == "") {
				alert('請填商品狀態')
				} else if ($('#insertMerchandise input[name=merchandiseTag]').val() == "") {
				alert('請填商品類別')
				} else if ($('#insertMerchandise input[name=merchandiseContent]').val() == "") {
				alert('請填商品敘述')
				} else if ($('#insertMerchandise input[name=merchandisePicture]').val() == "") {
				alert('請上傳商品圖片')
				} else {
				$('#myModal').css('display', 'block');
				}
				});
			$('#forSubmit2').click(
					function() {
						$('#myModal2').css('display', 'block');
						Content = CKEDITOR.instances.editor2.getData();
						$('#updateMerchandise input[name=merchandiseContent]').val(Content);
					});

			$('#gogo').on('click', (function(e) {
				e.preventDefault();
				var form = $('#submitForm')[0];
				var formData = new FormData(form);
				//     			$("#gogo").prop("disabled", true);
				console.log(formData);
				$.ajax({
					url : '/DizzyCafe/createmerchandise.controller',
					type : 'post',
					data : formData,
					enctype : 'multipart/form-data',
					contentType : false,
					cache : false,
					processData : false,
					success : function() {
						alert("新增成功");
						insertMerchandise.style.display = "none";
						$('#myModal').css('display', 'none');
						table.ajax.reload();
					}
				});
			}));
			$('#gogo2').on('click', function(e) {
				e.preventDefault();
				var form = $('#submitForm2')[0];
				var formData = new FormData(form);
				console.log(formData);
				$.ajax({
					url : '/DizzyCafe/updatemerchandise.controller',
					type : 'post',
					data : formData,
					enctype : 'multipart/form-data',
					contentType : false,
					cache : false,
					processData : false,
					success : function() {
						alert('更新成功');
						updateMerchandise.style.display = "none";
						$('#myModal2').css('display', 'none');
						table.ajax.reload();
					}
				})
			})
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
			function readImage2(input) {
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
		
	
		
	</script>
	<jsp:include page="/backstage/footer.jsp"></jsp:include>
</body>
</html>