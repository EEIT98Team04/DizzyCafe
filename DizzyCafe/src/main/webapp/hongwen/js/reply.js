$(function() {
	var search = document.location.search;// 取得?後面的參數
	console.log("Get into ajax");
	$.ajax({
		url : '/DizzyCafe/Reply.hongwen' + search,
		type : 'GET',
		// data:data,//post use
		success : function(json) {
//			alert('success');
			setdata(json);//
		}
	});
	//回文
	
})
var setdata = function(json) {
	var inner = '', i, j;
	var count = 0;// 樓層編號，初始值為0
	var array = [ 'membername', 'times', 'content' ];
	var floor = '';
	var i = 0;// 起始頁面
	var j = 10;// 結束頁面

	inner += '<div id="floor">直達<input id="xx" type="text" style="width:30px;">樓</div>';
	// for(;i<=j;i++){
	for (i in json) {
		floor = 'id="' + count + '"';
		inner += '<div class="article">';
		inner += '<div class="user">' + '使用者圖片' + '</div>';// 使用者圖片
		inner += '<div class="content">';
		inner += '<div class="content_header">';
		inner += '<div "style="text-align: right;">第' + count + '樓</div>';// 樓層
		inner += '<div>' + '文章標題' + '</div>';// xxx文章標題
		inner += '</div>';
		inner += '<div class="content_body">';
		inner += '<div style="margin-bottom: 10px;">發文者 : ' + json[i][array[0]]
				+ '</div>';// 發文者
		inner += '<div style="margin-bottom: 10px;">時間 : ' + json[i][array[1]]
				+ '</div>';// 發文時間
		inner += '<div>' + json[i][array[2]] + '</div>';
		inner += '</div>';
		inner += '<a ' + floor + '"></a>';// 樓層用
		inner += '<div class="content_footer">檢舉</div>';
		inner += '</div>';
		inner += '</div>';
		count++;// 樓層編號
	}
	$('#article').html(inner);//最後輸出，覆蓋
	
	//樓層//一定要放這，標籤產生完成，才能增加功能
	$('#xx').keydown(function(event) {
		// alert( event.which );//判斷按下哪個按鈕
		if (event.which == 13) {
			// alert($('#xx').val());
			floor = $('#xx').val() - 1;
			if (typeof (floor) == "undefined") {
				alert('請輸入數值');
			}
			window.location = '#' + floor;
		}
	});
	//搜尋
	$("#myInput").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#list tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
};