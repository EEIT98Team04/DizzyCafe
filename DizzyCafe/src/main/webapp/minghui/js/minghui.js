// Get the modal
var login = document.getElementById('login');
var signUp = document.getElementById('signUp');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == login) {
		login.style.display = "none";
	}
	if (event.target == signUp) {
		signUp.style.display = "none";
	}
}

var error = document.getElementById('error_login');
var errorStr = error.innerText;
if (errorStr.charCodeAt(0)) {
	document.getElementById('login').style.display = 'block'
}

var error = document.getElementById('error_register');
var errorStr = error.innerText;
if (errorStr.charCodeAt(0)) {
	document.getElementById('signUp').style.display = 'block'
}


var input = document.getElementById("memberPhoto"); 

if(typeof FileReader==='undefined'){ 
result.innerHTML = "Sorry, 瀏覽器不支持 FileReader"; 
input.setAttribute('disabled','disabled'); 
}else{ 
input.addEventListener('change',readFile,false);
}

function readFile(){ 
var file = this.files[0]; 
var reader = new FileReader(); 
reader.readAsDataURL(file); 
reader.onload = function(e){ 
	var showMemberPhoto = document.getElementById("showMemberPhoto"); 
	showMemberPhoto.src = this.result;
} 
}