<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<link href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/DizzyCafe/hongwen/css/document.css" />
</head>
<body style="background-color: #fff1cc;">
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="margin-top: 80px; text-align: center;">
		<h2>歡迎光臨留言板</h2>
	</div>
	<div>
		<table id="test">
			<thead>
				<tr class="danger">
					<th>文章名稱</th>
					<th>發文時間/發文者</th>
					<th>最後回文者</th>
					<th>人氣</th>
				</tr>
			</thead>
		</table>
	</div>
	<form id="post">
		<div>
			<span>主題 : </span>
			<select id="grid" name="grid">				
				<option value="0">請選擇主題</option>
				<option value="1">咖啡品種產地版</option>
				<option value="2">咖啡烘焙版</option>
				<option value="3">咖啡沖泡方式版</option>
				<option value="4">咖啡沖烘焙具版</option>
				<option value="5">咖啡沖泡器具版</option>
				<option value="6">咖啡閒聊版</option>
			</select> 
			<span>文章標題 : <input id="d_article" name="title" type="text" style="width:200px; height:25px;"/></span>		
			<textarea></textarea>
			<input type="submit" value="發文" />	
		</div>
	</form>
	<input id="upload" name="upload" type="file" accept="image/*" style="display:none"/>
	<div style="margin-bottom:70px;"></div>
	<!-- jQuery庫 -->
	<script type="text/javascript"
		src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/tinymce/tinymce.min.js"></script>
<!-- 	<script src="/DizzyCafe/hongwen/js/post.js"></script> -->
	<script src="/DizzyCafe/hongwen/js/document.js"></script>
	<script>
	$(function() {
		tinymce.init({
					selector : "textarea",
					language : 'zh_TW',
					height : 500,
					menubar : false,
					statusbar : false,
					toolbar_items_size : 'small',
					plugins : [
							"advlist autolink autosave link image lists charmap print preview hr anchor pagebreak",
							"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
							"table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern" ],

					toolbar1 : "code | cut copy paste | searchreplace | bullist numlist | outdent indent | image | insertdatetime preview",
					toolbar2 : "undo redo | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify",
					toolbar3 : "fontselect fontsizeselect forecolor charmap emoticons",
					content_css : [
							'//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
							'//www.tinymce.com/css/codepen.min.css' ],

					init_instance_callback : function() {
						window.setTimeout(function() {
							$("#div").show();
						}, 1000);
					},

					file_picker_callback : function(callback, value, meta) {
						// Provide file and text for the link dialog
						if (meta.filetype == 'file') {
							callback('mypage.html', {
								text : 'My text'
							});
						}

						// Provide image and alt text for the image dialog
						if (meta.filetype == 'image') {
							$('#upload').trigger('click');
							$('#upload').change(function(event) {
								var file_data = $("#upload").prop("files")[0];   // Getting the properties of file from file field
								var form_data = new FormData();                  // Creating object of FormData class
								form_data.append("file", file_data);
								console.log(form_data);
								// 利用ajax傳送到伺服器
								$.ajax({
									url : '/DizzyCafe/imageupload.hongwen',
									type : 'POST',
									data :form_data,
									cache : false,
									contentType : false,
									processData : false,
									success : function(data) {
										upload='';
//										alert('upload success');
										callback(data, {
											text : data
										});
									}
								});
							});
						}

						// Provide alternative source and posted for the media
						// dialog
						if (meta.filetype == 'media') {
							callback('movie.mp4', {
								source2 : 'alt.ogg',
								poster : 'image.jpg'
							});
						}
					},

				});
	});
	</script>
</body>
</html>
