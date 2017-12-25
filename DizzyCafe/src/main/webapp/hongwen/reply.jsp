<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<link rel="stylesheet" href="/DizzyCafe/hongwen/css/reply.css" />
</head>
<body id="body">
	<jsp:include page="/HTML/Navbar.jsp" />
	<a id="hyperlink" href="#20">11</a>
	<div id="article"></div>
	
	<form id="post" method="post">
		<div>
			<textarea></textarea>
			<input type="submit" value="發文" />	
		</div>
	</form>
	<script src="/DizzyCafe/hongwen/js/tinymce/tinymce.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/post.js"></script>
	<script src="/DizzyCafe/hongwen/js/reply.js"></script>
	<script>
		$(function(){
			$('#post').on('submit', function() {
// 			alert('submit');
			var	t = tinyMCE.activeEditor.getBody().innerHTML;//取出tinymve內容
			var that = $(this),data={};
			
			//轉json格式
//			that.find('[name]').each(function(index, value) {
//				that = $(this), 
//					   name = that.attr('name'),//取得name的值 
//					   value = that.val();//取得值
//				data[name] = value;
//			});
			data['title']=$.getUrlParam('documentId');//取得param值
			data['textarea']=t;//將tinymce值放入data，並宣告為json格式[key='textarea',value=t]

			console.log(data);			

			//資料檢查
			var string = ['title','textarea'];//檢查資料的key	
			
			//初始化所有發文設定
			tinyMCE.activeEditor.getBody().innerHTML='';//初始化內容

			//ajax傳送
			$.ajax({
				url : '/DizzyCafe/Reply.hongwen',
				type : 'POST',
				data : data,
				cache : false,
				success : function(json) {
					//回傳值是字串
//					console.log(json);
					if(json[0]['status'] == 'false'){
						alert('請登入會員');
					}else{
						alert('發文成功');
					}
				}
			})
			return false;
		});
		$.getUrlParam = function (name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) return unescape(r[2]); return null;
        }
})
		
	</script>
</body>
</html>
