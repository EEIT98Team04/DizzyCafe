<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<link rel="stylesheet" href="/DizzyCafe/hongwen/css/reply.css" />
</head>
<body id="body">
	<jsp:include page="/HTML/Navbar.jsp" />
	<div id="tmp" style="display: block">${user.memberName}</div>

	<div id="article"></div>

	<div class="container">
		<!-- Button to Open the Modal -->
		<button id="modify" type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#myModal" style="display:none">回文</button>
		<input id="upload" name="upload" type="file" accept="image/*"
			style="display: none" />
		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">回文</h4>
						<button id="close" type="button" class="close"
							data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div id='send' class="modal-body">
						<div>
							<div id="documentid" style="display: none"></div>
						</div>
						<textarea></textarea>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button id="post" type="button" class="btn btn-success"
							data-dismiss="modal">送出</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input id="upload" name="upload" type="file" multiple
		style="display: none" />
	<div style="margin-bottom: 100px"></div>
	<script src="/DizzyCafe/hongwen/js/tinymce/tinymce.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/post.js"></script>
	<script src="/DizzyCafe/hongwen/js/reply.js"></script>
	<script>
	</script>
</body>
</html>
