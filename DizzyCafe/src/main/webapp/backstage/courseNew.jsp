<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe管理系統</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<style type="text/css">
#form1 div {
	width: 1000px;
	margin: auto;
	position: relative;
}
#photo {
	position:absolute;
    z-index:1;
}
</style>
<jsp:include page="../HTML/TitleIcon.jsp" />
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<jsp:include page="/backstage/header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/backstage/index.jsp">回首頁</a>
					</li>
				<li class="breadcrumb-item">
					<a href="${pageContext.request.contextPath}/backstage/courseManage.jsp">課程管理</a>
					</li>
				<li class="breadcrumb-item active">新增課程</li>
			</ol>
		
			<h2 style="margin: 20px auto; width: 90%">新增課程</h2>
			<form id="form1" enctype="multipart/form-data" method="post"
				action="${pageContext.request.contextPath}/course/courseNew.controller">
				<fieldset>
				<div align="center"> 
<!-- 				<img id="photo" style="position:absolute;left:1000px; width:200px;display:none;" class="img-responsive img"  -->
<%-- 					src="${pageContext.request.contextPath}${CourseBean.courseImg}"> --%>
					<table>
						<tr>
							<td>
								<table>
									<tr>
									<th>名稱</th>
										<td>
										<input type="text"
											name="courseName" required></td>
									</tr>
									<tr>
									<th>圖片</th>
									<td>
										<input id="uploadImg" type="file" name="courseImg" accept="image/*" required>
									</td>
									</tr>
									<tr>
									<th></th>
									<td>
										<span id="showImg" style="color:#6C6C6C;">預覽</span>
										<br/>
										<img id="photo" style="display:none;max-width:800px;" class="img-responsive img photo" src="${pageContext.request.contextPath}${CourseBean.courseImg}">
									</td>
									</tr>
									<tr>
									<th>簡介</th>
										<td><input type="text"
											name="courseIntro" required> </td>
									</tr>
									<tr>
									<th>講師</th>
										<td>
										<input type="text" name="courseTeacher" required></td>
									</tr>
									<tr>
									<th>人數上限</th>
										<td>
										<input type="text" name="courseLimit" required></td>
									</tr>
									<tr>
									<th>課程價格</th>
									<td>
									<input type="text" name="courseCost" required>
									</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
									<th><label for="courseSignupBegin">報名期限</label></th>
										<td>
											<input type="text" id="courseSignupBegin" name="courseSignupBegin" readonly required>～ 
											<input type="text" id="courseSignupEnd" name="courseSignupEnd" readonly required>
										</td>
									<tr>
									<th><label for="courseBegin">課程日期</label></th>
										<td>
											<input type="text" id="courseBegin" name="courseBegin" readonly required>～
											<input type="text" id="courseEnd" name="courseEnd" readonly required>
										</td>
									</tr>
									<tr>
									<th>上課時間</th>
										<td>
										<select name="time">
												<option value="9">09:00</option>
												<option value="10">10:00</option>
												<option value="11">11:00</option>
												<option value="12">12:00</option>
												<option value="13">13:00</option>
												<option value="14">14:00</option>
												<option value="15">15:00</option>
												<option value="16">16:00</option>
												<option value="17">17:00</option>
												<option value="18">18:00</option>
										</select></td>
									</tr>
									<tr>
									<th>上課時數</th>
										<td>
										<select name="courseLength">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
											</select><span>小時</span>
											</td>
									</tr>
									<tr>
									<th>上課日</th>
									</tr>
									<tr>
										<th></th>
											<td>
												<label for="monday">
												<input id="monday" type="checkbox" name="whichDay" value="2" />星期一</label>
												<label for="tuesday">
												<input id="tuesday" type="checkbox" name="whichDay" value="3" />星期二</label>
												<label for="wednesday">
												<input id="wednesday" type="checkbox" name="whichDay" value="4" />星期三</label>
												<label for="thursday"> 
												<input id="thursday" type="checkbox" name="whichDay" value="5" />星期四</label>
												<label for="friday">
												<input id="friday" type="checkbox" name="whichDay" value="6" />星期五</label>
												<label for="saturday">
												<input id="saturday" type="checkbox" name="whichDay" value="7" />星期六</label>
												<label for="sunday">
												<input id="sunday" type="checkbox" name="whichDay" value="1" />星期日</label>
											</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr height="20px"></tr>
						<tr>
						<th>課程內容</th>
						<td colspan="2"></td>
						</tr>
						<tr>
						<td colspan="2">
							<input type="text" name="courseContent" required id="editor1">
						</td>
						</tr>
						<tr height="20px"></tr>
						<tr>
						<td colspan="2" align="center">
						<button id="submitBtn" type="submit" class="btn btn-info" onclick="return checkSubmit();">送出</button>
						<a href="${pageContext.request.contextPath}/backstage/courseManage.jsp" style="margin-left: 50px">
						<button type="button" class="btn">取消</button></a>
						</td>
						</tr>
					</table>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	
	
	

	
	<div>
		<jsp:include page="/backstage/footer.jsp"></jsp:include>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="../backstage/ckeditor/ckeditor.js"></script>
	<script>
		//editor
		CKEDITOR.replace('editor1');
		
		function checkSubmit(){
			var validating = "";

			//courseSignupBegin
			//courseSignupEnd
			if($('[name="courseSignupBegin"]').val() == ''||
			   $('[name="courseSignupEnd"]').val() == '')
			{
				validating += "請完整輸入報名日期。" + '\n';
			}
			
			//courseBegin
			//courseEnd
			if($('[name="courseBegin"]').val() == ''||
			   $('[name="courseEnd"]').val() == '')
			{
				validating += "請完整輸入課程日期。" + '\n';
			}
			
			if($('[type="checkbox"]:checked').length == 0){
				validating += "請選擇上課日。" + '\n';
			}
			
			if(CKEDITOR.instances.editor1.getData() == ''){
				validating += "請輸入課程內容。" + '\n';
			}
			
			if(validating > ''){
				alert(validating);
				return false;
			}
			else{
				
				$('input[name="courseContent"]').val(
								CKEDITOR.instances.editor1.getData());
				return true;
			}
		}
		
		var dateFormat = "yy-mm-dd";
		//課程時間
		$(function() {
			var today = new Date();
			
			//報名起始
			signFrom = $("#courseSignupBegin").datepicker({
				dateFormat :dateFormat,
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1,
				minDate: today
			}).on("change", function() {
				signTo.datepicker("option", "minDate", getDate(this,0));
			});
			
			//報名結束
			signTo = $("#courseSignupEnd").datepicker({
				dateFormat :dateFormat,
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 1,
				minDate : today
			}).on("change", function() {
				signFrom.datepicker("option", "maxDate", getDate(this,0));
				courseFrom.datepicker("option", "minDate", getDate(this,1));
				courseTo.datepicker("option", "minDate", getDate(this,1));
			});
			
			//課程起始
			courseFrom = $("#courseBegin").datepicker({
				dateFormat :dateFormat,
				defaultDate : "+1w",
				changeMonth : true,
				minDate : today,
				numberOfMonths : 1
			}).on("change", function() {
				courseTo.datepicker("option", "minDate", getDate(this,0));
			});
			
			//課程結束
			courseTo = $("#courseEnd").datepicker({
				dateFormat :dateFormat,
				defaultDate : "+1w",
				changeMonth : true,
				minDate : today,
				numberOfMonths : 1
			}).on("change", function() {
				courseFrom.datepicker("option", "maxDate", getDate(this,0));
			});
		});
		
		function getDate(element, days) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
				date.setDate(date.getDate() + parseInt(days));
			} catch (error) {
				date = null;
			} 
			return date;
		}
		
		//圖片
		$("#uploadImg").change(function(){
			$('#photo').attr("display","block");
   	      	readImage( this );
   	      	$('#showImg').css("color","blue");
	   	    $('#showImg').mouseenter(function(){
	 			$('#photo').show();
	 		});
	 		
	 		$('#showImg').mouseleave(function(){
	 			$('#photo').hide();
	 		});
   	    });
		
		
		
		function readImage(input) {
     	      if ( input.files && input.files[0] ) {
     	        var FR= new FileReader();
     	        FR.onload = function(e) {
     	          //e.target.result = base64 format picture
     	          $('#photo').attr( "src", e.target.result );
     	        };       
     	        FR.readAsDataURL( input.files[0] );
     	   }
        }
	</script>

</body>
</html>
