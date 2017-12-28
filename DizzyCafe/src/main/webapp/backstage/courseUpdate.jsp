<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
#form1 div {
	width: 1000px;
	margin: auto;
}
</style>
<jsp:include page="../HTML/TitleIcon.jsp" />
<link href="/DizzyCafe/wayne/css/lightbox.css" rel="stylesheet">
<script src="<c:url value="../wayne/js/lightbox.js"/>"></script>
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
				<li class="breadcrumb-item active">修改課程</li>
			</ol>
			
			<h2 style="margin: 20px auto; width: 90%">修改課程</h2>
			<form id="form1" enctype="multipart/form-data" method="post"
				action="${pageContext.request.contextPath}/backstage/courseUpdate.controller">
				<fieldset>
				<div align="center"> 
					<table>
						<tr>
							<td>
								<table>
									<tr>
									<th>課程ID</th>
										<td>
										<input type="text" name="courseId" value="${CourseBean.courseId }" readonly/></td>
									</tr>
									<tr>
									<th>名稱</th>
										<td>
										<input type="text" name="courseName" value="${CourseBean.courseName }" required></td>
									</tr>
									<tr>
									<th>圖片</th>
									<td>
										<input type="file" name="courseImg" value="${CourseBean.courseImg }" accept="image/*">
									</td>
									</tr>
									<tr>
									<th>簡介</th>
										<td><input type="text"
											name="courseIntro" value="${CourseBean.courseIntro }" required> </td>
									</tr>
									<tr>
									<th>講師</th>
										<td>
										<input type="text" name="courseTeacher" value="${CourseBean.courseTeacher }" required></td>
									</tr>
									<tr>
									<th>人數上限</th>
										<td>
										<input type="text" name="courseLimit" value="${CourseBean.courseLimit }" required></td>
									</tr>
									<tr>
									<th>課程價格</th>
									<td>
									<input type="text" name="courseCost" value="${CourseBean.courseCost }" required>
									</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
									<th><label for="courseSignupBegin">報名期限</label></th>
										<td>
											<input type="text" id="courseSignupBegin" name="courseSignupBegin" value="${CourseBean.courseSignupBegin }" readonly>～ 
											<input type="text" id="courseSignupEnd" name="courseSignupEnd" value="${CourseBean.courseSignupEnd }" readonly>
										</td>
									<tr>
									<th><label for="courseBegin">課程日期</label></th>
										<td>
											<input type="text" id="courseBegin" name="courseBegin" value="${CourseBean.courseBegin }" readonly>～
											<input type="text" id="courseEnd" name="courseEnd" value="${CourseBean.courseEnd }" readonly>
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
											<td class="days">
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
						<button id="submit" type="submit" class="btn btn-info" onclick="alert('修改成功')">修改</button>
						<button type="reset" class="btn" style="margin-left: 50px">清除</button>
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
		//回填上課時間
		$(function(){
			var time = "${CourseBean.courseTime}";
			for(i=0;i<10;i++){
				if($('select[name="time"] option:eq('+i+')').val()==time){
					$('select[name="time"] option:eq('+i+')').attr('selected','selected');
				}				
			}
		});
	
		
		//回填上課時數
		$(function(){
			var courseLength = "${CourseBean.courseLength}";
			for(i=0;i<6;i++){
				if($('select[name="courseLength"] option:eq('+i+')').val()==courseLength){
					$('select[name="courseLength"] option:eq('+i+')').attr('selected','selected');
				}				
			}
		});
		
		//回填上課日
		$(function(){
			var temp = "${CourseBean.courseWeek}";
			var whichDay = temp.split("");
			$(':checkbox').each(function(){
				var tmp = this;
				$(whichDay).each(function(i){
					if(tmp.value==this){
						$(tmp).prop("checked","true");						
					}
				})
			});
		});
		
		//editor
		CKEDITOR.replace('editor1');
		//editor 回填
		$(function(){
			CKEDITOR.instances.editor1.setData("${CourseBean.courseContent}");
		})
		
		
		$('#submit').click(
				function(e) {
					//editor 資料處理
					$('input[name="courseContent"]').val(
							CKEDITOR.instances.editor1.getData());
		});
		
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
// 				date.setDate(date.getDate() + parseInt(days));
			} catch (error) {
				date = null;
			} 
			return date;
		}
	</script>

</body>
</html>
