<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DizzyCafe</title>
<link rel="stylesheet" href="/DizzyCafe/hongwen/css/reply.css" />
</head>
<body>
	<jsp:include page="/HTML/Navbar.jsp" />
	<div style="margin-top:100px"></div>
	
	<div id="article"></div>
	
	<form id="post">
		<div>
			<textarea></textarea>
			<input type="submit" value="發文" />	
		</div>
	</form>
	<script src="/DizzyCafe/hongwen/js/tinymce/tinymce.min.js"></script>
	<script src="/DizzyCafe/hongwen/js/post.js"></script>
<!-- 	<script src="/DizzyCafe/hongwen/js/document.js"></script> -->
	<script>
		var search = document.location.search;//取得?後面的參數
		$(function() {
			$(function() {
				console.log("Get into ajax");
				$.ajax({
					url : '/DizzyCafe/Reply.hongwen' + search,
					type : 'GET',
					//data:data,//post use
					success : function(json) {
						setdata(json);//
					}
				})
			})
		});
		var setdata = function(json){
			var inner='',i,j;
			var count=0;//樓層編號，初始值為0
			var array = ['memberId','times','content'];
			count=0;//初始化
			for(i in json){
				inner +='<div class="article">';
				inner +='<div class="user">'+'使用者圖片'+'</div>';//使用者圖片
				inner +='<div class="content">';
				inner +='<div class="content_header">';
				inner +='<div style="text-align: right;">'+count+'</div>';//樓層
				inner +='<div>'+'文章標題'+'</div>';//xxx文章標題
				inner +='</div>';
				inner +='<div class="content_body">';
				inner +='<div style="margin-bottom: 10px;">發文者 : '+json[i][array[0]]+'</div>';//發文者
				inner +='<div style="margin-bottom: 10px;">時間 : '+json[i][array[1]]+'</div>';//發文時間
				inner +='<div>'+json[i][array[2]]+'</div>';
				inner +='</div>';
				inner +='<div class="content_footer">檢舉</div>';
				inner +='</div>';
				inner +='</div>';
				count++;//樓層編號
			}
			$('#article').html(inner); 
		};
	</script>
</body>
</html>
