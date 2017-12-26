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
	//回覆留言
	$('#post').on('submit', function() {
//			alert('submit');
		var	t = tinyMCE.activeEditor.getBody().innerHTML;//取出tinymve內容
		var that = $(this),data={};
		
		//轉json格式
//		that.find('[name]').each(function(index, value) {
//			that = $(this), 
//				   name = that.attr('name'),//取得name的值 
//				   value = that.val();//取得值
//			data[name] = value;
//		});
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
//				console.log(json);
				if(json[0]['status'] == 'false'){
					alert('請登入會員');
					window.location.replace(document.location.href);//取得現在的URL，並自動導向
				}else{
					alert('發文成功');
					window.location.replace(document.location.href);//取得現在的URL，並自動導向
				}
			}
		})
		return false;
	});
	//取得參數
	$.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
    }
})
var setdata = function(json) {
	var inner = '', i, j;
	var count = 0;// 樓層編號，初始值為0
	var array = [ 'membername', 'times', 'content' ];
	var floor = '';
	var i = 0;// 起始頁面
	var j = 10;// 結束頁面
	var user = $('#tmp').text();//抓user值

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
		inner += '<div class="content_footer">';
		//判斷是否同一使用者，是就顯示修改按鈕
		if(user == json[i][array[0]]){
			inner += '<input class="change" type="button" value="修改" style="display:none">';			
		}
		inner += '</div>';
		inner += '</div>';
		inner += '</div>';
		count++;// 樓層編號
	}
	$('#article').html(inner);//最後輸出，覆蓋
	
	//修改按鈕顯示
	modify();
	
	
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
var modify = function(){
	$(".change").show();
	var x = $('#tmp').text();
	console.log('user='+x);
}