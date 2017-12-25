// Get the modal
var minghui_member_login = document.getElementById('minghui_member_login');
var minghui_member_signUp = document.getElementById('minghui_member_signUp');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == minghui_member_login) {
		minghui_member_login.style.display = "none";
	}
	if (event.target == minghui_member_signUp) {
		minghui_member_signUp.style.display = "none";
	}
}

var error = document.getElementById('error_login');
var errorStr = error.innerText;


var member_exist = document.getElementById('minghui_store_memberName').value? false:true;


if (errorStr.charCodeAt(0) && member_exist) {
	document.getElementById('minghui_member_login').style.display = 'block'
}

var error = document.getElementById('error_register');
var errorStr = error.innerText;
if (errorStr.charCodeAt(0)) {
	document.getElementById('minghui_member_signUp').style.display = 'block'
}

var input = document.getElementById("memberPhoto");

if (typeof FileReader === 'undefined') {
	result.innerHTML = "Sorry, 瀏覽器不支持 FileReader";
	input.setAttribute('disabled', 'disabled');
} else {
	input.addEventListener('change', readFile, false);
}

function readFile() {
	var file = this.files[0];
	var reader = new FileReader();
	reader.readAsDataURL(file);
	reader.onload = function(e) {
		var showMemberPhoto = document.getElementById("showMemberPhoto");
		showMemberPhoto.src = this.result;
	}
}


