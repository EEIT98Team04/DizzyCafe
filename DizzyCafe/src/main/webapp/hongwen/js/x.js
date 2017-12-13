$(function(){
	$('#box').form({
		url:'',//傳送位置
		onSubmit:function (param) {
			// body...
			console("submit");
		},
		success:function(data){
			alert("okay");
		},
	});
});