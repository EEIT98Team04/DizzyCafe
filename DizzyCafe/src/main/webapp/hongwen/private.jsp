<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員中心</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<script src="/DizzyCafe/hongwen/js/tinymce/tinymce.min.js"></script>
<script src="/DizzyCafe/hongwen/js/post.js"></script>
<script src="/DizzyCafe/hongwen/js/privatedocument.js"></script>
<script src="/DizzyCafe/hongwen/js/privatereply.js"></script>
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div class="container" style="margin-top: 80px;">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<div class="page-header">
						<p id="membername">${user.memberName}</p>
					</div>
				</div>
				<ul class="nav nav-tabs">
					<li class="nav-item"><a id="1" class="nav-link active"
						data-toggle="tab" href="#home">發文</a></li>
					<li class="nav-item"><a id="2" class="nav-link"
						data-toggle="tab" href="#menu1">回覆</a></li>
					<li class="nav-item"><a id="3" class="nav-link"
						data-toggle="tab" href="#menu2">被檢舉文章</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active container" id="home">
						<table id="document"></table>
					</div>
					<div class="tab-pane container" id="menu1">
						<table id="reply"></table>
					</div>
					<div class="tab-pane container" id="menu2">...</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<!-- Button to Open the Modal -->
		<button id="modify" type="button" class="btn btn-primary"
			data-toggle="modal" data-target="#myModal">發文</button>
		<input id="upload" name="upload" type="file" accept="image/*"
			style="display: none" />
		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">發文/修改</h4>
						<button id="close" type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div id='send' class="modal-body">
						<div>
							<span>主題 : </span><select id="grid" name="grid">
								<option value="1">咖啡品種產地版</option>
								<option value="2">咖啡烘焙版</option>
								<option value="3">咖啡沖泡方式版</option>
								<option value="4">咖啡沖烘焙具版</option>
								<option value="5">咖啡沖泡器具版</option>
								<option value="6">咖啡閒聊版</option>
							</select>
						</div>
						<div>
							<span>文章標題 : <input id="d_article" name="title"
								type="text" style="width: 200px; height: 25px;" /></span>
							<div id="documentid" style="display:none"></div>
						</div>
						<textarea id="tiny1"></textarea>
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
	<script>
	$(function() {
		var modify = "false";//文章狀態(修改or發文)
		var status = "0";//文章或回文(1or2),0為默認
		$('#close').on('click', function() {
			// 初始化所有發文設定
			tinyMCE.activeEditor.getBody().innerHTML = '';// 初始化內容
			$('#d_article').val('');// 清除標題內容
			$('#grid').val('1');
			modify = "false";
		})
		$('#post').on('click', function() {
			var t = tinyMCE.activeEditor.getBody().innerHTML;// 取出tinymve內容
			var that = $(this), data = {};

			// 轉json格式
			$('#send').find('[name]').each(function(index, value) {
				that = $(this), name = that.attr('name'),// 取得name的值
				value = that.val();// 取得值
				data[name] = value;
			});
			data['modify'] = modify;// 判斷是發文還是修改，來不及改邏輯，直接給變數
			data['documentid'] = $('#documentid').val();// documentid填入
			data['textarea'] = t;// 將tinymce值放入data，並宣告為json格式[key='textarea',value=t]
			if(status == "2"){
				data['title'] = $('#documentid').val();// documentid填入
			}

			// console.log(data);//data is a object
			
			//判斷是文章還是回文
			if(status == "1"){
				// ajax傳送
				$.ajax({
					url : '/DizzyCafe/Document.hongwen',
					type : 'POST',
					data : data,
					cache : false,
					success : function(json) {
						// 回傳值是字串
						var location = '/DizzyCafe/hongwen/private.jsp';
						if (json[0]['status'] == 'false') {
							alert('請登入會員');
							window.location.replace(location);// 取得現在的URL，並自動導向
						} else {
							if(modify == "true"){
								modify = "false";
								alert('修改成功');
								window.location.replace(location);// 取得現在的URL，並自動導向								
							}else{
								alert('發文成功');
								window.location.replace(location);// 取得現在的URL，並自動導向	
							}
						}
					}
				})	
			}else if(status == "2"){
				// ajax傳送
				$.ajax({
					url : '/DizzyCafe/Reply.hongwen',
					type : 'POST',
					data : data,
					cache : false,
					success : function(json) {
						// 回傳值是字串
						var location = '/DizzyCafe/hongwen/private.jsp';
						if (json[0]['status'] == 'false') {
							alert('請登入會員');
							window.location.replace(location);// 取得現在的URL，並自動導向
						} else {
							modify = "false";
							alert('回文修改成功');
							window.location.replace(location);// 取得現在的URL，並自動導向
						}
					}
				})	
			}else{
				alert('發生不可預期錯誤!');
			}
		});
		$(document).on("click", '.binding', function() {
			var search = '?';
			var id = $(this).attr("id");

			search += 'id=' + id;

			// 傳送資料
			$.ajax({
				url : '/DizzyCafe/Privatemodify.hongwen' + search,
				type : 'GET',
				// data:data,//post use
				success : function(json) {
					$('#send div:eq(0)').css('display','block');
					$('#send div:eq(1)').css('display','block');
					setdata(json);//
					modify = "true";
					status = "1";
				}
			});
		});
		$(document).on("click", '.reply', function() {
			var search = '?';
			var id = $(this).attr("id");

			search += 'id=' + id;

			// 傳送資料
			$.ajax({
				url : '/DizzyCafe/Replymodify.hongwen' + search,
				type : 'GET',
				// data:data,//post use
				success : function(json) {
					$('#send div:eq(0)').css('display','none');
					$('#send div:eq(1)').css('display','none');
					setdata(json);//
					modify = "true";
					status = "2";
				}
			});
		});
		var setdata = function(json) {
			console.log(json[0].name);
			// 將文章相關內容填入
			tinyMCE.activeEditor.getBody().innerHTML = json[0].content;// 初始化內容
			$('#d_article').val(json[0].name);// 清除標題內容
			$('#grid').val(json[0].boardId);// boardid
			$('#documentid').val(json[0].documentId);// documentid
			// 自動按發文鍵
			$('#modify').trigger('click');
		}
	})
	</script>
</body>
</html>