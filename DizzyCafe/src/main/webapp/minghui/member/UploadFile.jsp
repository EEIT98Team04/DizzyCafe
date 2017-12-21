<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<button class="btn asd" style="margin-left: 1%"
					onclick="document.getElementById('change_photo').style.display='block'">變更照片</button>

<div id="change_photo" class="modal">

		<form class="modal-content animate" action="#" method="post">
				<div class="imgcontainer">
					<span onclick="document.getElementById('change_photo').style.display='none'"
						class="close" title="關閉視窗">&times;</span>
					<img id="change_showMemberPhoto" src="${pageContext.request.contextPath }/${user.memberPhoto}"
						style="width: 200px; height: 200px"><br>
					<input type="file" id="change_memberPhoto" name="change_memberPhoto"
						accept="image/*" required>
				</div>

				<button class="loginBut" type="submit">修改</button>
		</form>
</div>
	
	<script>
		var change_photo = document.getElementById('change_photo');
		window.onclick = function(event) {
			if (event.target == change_photo) {
				change_photo.style.display = "none";
			}
		}
		
		var input2 = document.getElementById("change_memberPhoto"); 

		if(typeof FileReader==='undefined'){ 
		result.innerHTML = "Sorry, 瀏覽器不支持 FileReader"; 
		input2.setAttribute('disabled','disabled'); 
		}else{ 
		input2.addEventListener('change',readFile,false);
		}

		function readFile(){ 
		var file = this.files[0]; 
		var reader = new FileReader(); 
		reader.readAsDataURL(file); 
		reader.onload = function(e){ 
			var change_showMemberPhoto = document.getElementById("change_showMemberPhoto"); 
			change_showMemberPhoto.src = this.result;
		} 
		}
	</script>