<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>
<jsp:include page="/HTML/TitleIcon.jsp" />
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div class="container" style="margin-top: 60px">
		<!-- 與nav bar 拉開空間-->
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="list-group">
					<a
						href="${pageContext.request.contextPath}/minghui/member/member_center.jsp"
						class="list-group-item">首頁</a> <a href="${pageContext.request.contextPath}/course/courseOfMemberController.controller?page=1" class="list-group-item">課程</a>
					<a href="#" class="list-group-item">訂單</a>
					<a href="${pageContext.request.contextPath }/event/dailyevent.jsp" class="list-group-item">每日活動</a>
					<a href="${pageContext.request.contextPath}/coupon/showcoupon.jsp" class="list-group-item">折價卷</a>
					<a href="/DizzyCafe/hongwen/private.jsp" class="list-group-item">論壇</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="jumbotron text-center">
					<div class="page-header text-center">
						<h3>${user.memberName}的會員中心</h3>
					</div>
					<!-- 每頁不同的內容從這裡開始 -->

					<div class="btn-group-vertical btn-group-lg text-center"
						style="width: 300px">
						<button type="button" class="btn btn-outline-primary"
							data-toggle="modal"
							data-target="#form_change_memberPhoto"
							style="margin-top: 50px; cursor: pointer;">變更照片</button>
						<button type="button" class="btn btn-outline-primary"
							data-toggle="modal"
							data-target="#form_update_memberInfo"
							style="margin-top: 50px; cursor: pointer;">修改基本資料</button>
						<button type="button" class="btn btn-outline-primary"
							style="margin-top: 50px; cursor: pointer;">更改密碼</button>
					</div>

					<!-- The Modal one change member photo -->
					<div class="modal fade" id="form_change_memberPhoto">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal body -->
								<div class="modal-body">
									<form enctype="multipart/form-data"
										action="${pageContext.request.contextPath}/member/changePhoto.controller"
										method="post">
										<div class="imgcontainer  text-center">
										 <img
												id="change_showMemberPhoto" src="${user.memberPhoto}"
												style="width: 300px; height: 300px"><br> 
												<input
												type="file" id="change_memberPhoto"
												name="change_memberPhoto" accept="image/*" required>
										</div>

										<button class="loginBut" type="submit">修改</button>
									</form>
								</div>

							</div>
						</div>
					</div>
					
					<!-- The Modal two update member info -->
					<div class="modal fade" id="form_update_memberInfo">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal body -->
								<div class="modal-body">
									<form>
										<div class="form-group">
										    <label for="member_telphone">電話&nbsp;</label>
										    <input class="form-control" type="text" id="member_telphone" value="${user.memberPhone}">
									  	</div>
										<div class="form-group">
										    <label for="member_email">信箱&nbsp;</label>
										    <input class="form-control" type="email" id="member_email" value="${user.memberEmail}">
									  	</div>
										<div class="form-group">
										    <label for="member_address">地址&nbsp;</label>
										    <input class="form-control" type="text" id="member_address" value="${user.memberAddress}">
									  	</div>

										<button id="submit_btn" class="btn btn-primary">修改</button>
										<button id="cancel_btn" class="btn btn-primary">取消</button>
									</form>
								</div>

							</div>
						</div>
					</div>
					<!-- 每頁不同的內容到這裡結束 -->
										
				</div>
			</div>
		</div>
	</div>

	<script>
		var input2 = document.getElementById("change_memberPhoto");

		if (typeof FileReader === 'undefined') {
			result.innerHTML = "Sorry, 瀏覽器不支持 FileReader";
			input2.setAttribute('disabled', 'disabled');
		} else {
			input2.addEventListener('change', readFile, false);
		}

		function readFile() {
			var file = this.files[0];
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				var change_showMemberPhoto = document
						.getElementById("change_showMemberPhoto");
				change_showMemberPhoto.src = this.result;
			}
		}
		
		var form_update_memberInfo = $('#form_update_memberInfo');
		var member_telphone = $('#member_telphone').val();
		var member_email = $('#member_email').val();
		var member_address = $('#member_address').val();
		
		$('#cancel_btn').on('click',function(e){
			e.preventDefault();
			$('#member_telphone').val(member_telphone);
			$('#member_email').val(member_email);
			$('#member_address').val(member_address);
			form_update_memberInfo.modal("hide");
		});
		
		$('#submit_btn').on('click',function(e){
			e.preventDefault();
			
			member_telphone = $('#member_telphone').val();
			member_email = $('#member_email').val();
			member_address = $('#member_address').val();
			
			$.ajax({
				url: "/DizzyCafe/member/changeInfo.controller",
				data: {'member_telphone':member_telphone,'member_email':member_email,'member_address':member_address},
				method:"POST",
				success:function(data){
					if(data){
						alert('修改成功');
						form_update_memberInfo.modal("hide");
					}else{
						alert('修改失敗');
					}
				}
			});
			
		});
		
		
	</script>


</body>
</html>