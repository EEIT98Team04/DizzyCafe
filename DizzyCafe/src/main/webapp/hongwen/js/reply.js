$(function() {
	var search = document.location.search;// 取得?後面的參數
	var modify = "false";// 文章狀態(修改or發文)
	var photo;// 暫存
	var replyid;

	// 取得參數
	$.getUrlParam = function(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	// 回傳使用者資料
	$.ajax({
		url : '/DizzyCafe/Data.hongwen',
		type : 'GET',
		success : function(json) {
			tmp = json;
		}
	});
	// 回傳回覆資料
	$.ajax({
		url : '/DizzyCafe/Reply.hongwen' + search,
		type : 'GET',
		// data:data,//post use
		success : function(json) {
			if(json[0]['status'] == 'false'){
				alert('該文章已被禁用！');
				window.location.replace('/DizzyCafe/hongwen/board.jsp');// 取得現在的URL，並自動導向
				return;
			}
			setdata(json);//
		}
	});
	// 回覆留言
	$('#post').on('click', function() {
		var t = tinyMCE.activeEditor.getBody().innerHTML;// 取出tinymve內容
		var that = $(this), data = {};

		data['modify'] = modify;// 判斷是發文還是修改，來不及改邏輯，直接給變數
		data['title'] = $.getUrlParam('documentId');// 取得param值
		data['textarea'] = t;// 將tinymce值放入data，並宣告為json格式[key='textarea',value=t]
		data['replyid'] = replyid;

		console.log(data);

		// ajax傳送
		$.ajax({
			url : '/DizzyCafe/Reply.hongwen',
			type : 'POST',
			data : data,
			cache : false,
			success : function(json) {
				// 回傳值是字串
				// console.log(json);
				if (json[0]['status'] == 'false') {
					alert('請登入會員');
					window.location.replace(document.location.href);// 取得現在的URL，並自動導向
				} else {
					if (modify == "false") {
						alert('回文成功');
					} else {
						modify == "false"
						alert('修改回文成功');
					}
					window.location.replace(document.location.href);// 取得現在的URL，並自動導向
				}
			}
		})
	});
	$('#close').on('click', function() {
		// 初始化所有發文設定
		tinyMCE.activeEditor.getBody().innerHTML = '';// 初始化內容
		$('#d_article').val('');// 清除標題內容
		$('#grid').val('1');
		modify = "false";
	})
	// 取得參數
	$.getUrlParam = function(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	// 發文
	$(document).on("click", '#btnreply', function() {
		modify = "false";
		$('#modify').trigger('click');
	})
	// 修改
	$(document).on("click", '.reply', function() {
		var search = '?';
		var id = $(this).attr("id");
		replyid = id;
		search += 'id=' + id;
		modify = "true";

		// 傳送資料
		$.ajax({
			url : '/DizzyCafe/Replymodify.hongwen' + search,
			type : 'GET',
			// data:data,//post use
			success : function(json) {
				// console.log(json[0].content);
				// console.log(tinyMCE.activeEditor.getBody().innerHTML);

				// 將內容填入
				tinyMCE.activeEditor.getBody().innerHTML = json[0].content;// 初始化內容
				// console.log(tinyMCE.activeEditor.getBody().innerHTML);
				$('#documentid').val(json[0].documentId);// documentid
				// 自動按發文鍵
				$('#modify').trigger('click');
			}
		});
	});
})
var setdata = function(json) {
	var inner = '', i, j;
	var count = 0;// 樓層編號，初始值為0
	var array = [ 'membername', 'times', 'content', 'replyId', 'memberId' ];
	var floor = '';
	var i = 0;// 起始頁面
	var j = 10;// 結束頁面
	var user = $('#tmp').text();// 抓user值
	var userid = $('#tmpid').text();// 抓userid值
	var x = 0;

	inner += '<div id="floor">直達<input id="xx" type="text" style="width:30px;">樓</div>';
	inner += '<span><button id="btnreply" type="button" class="btn btn-success btn-sm" style="margin-left:1125px;">回覆文章</button></span>';
	// for(;i<=j;i++){
	for (i in json) {
		floor = 'id="' + count + '"';
		for (x in tmp) {
			if (tmp[x][0] == json[i][array[0]]) {
				photo = tmp[x][1];
			}
		}
		inner += '<div class="article">';
		inner += '<div class="user">';// 使用者個資
		inner += '<img class="photo" src="' + photo
				+ '" style="width: 200px; height: 200px">';// 使用者個資
		inner += '<div>發文者 : ' + json[i][array[0]] + '</div>';// 使用者id
		inner += '</div>';// 使用者個資
		inner += '<div class="content">';
		inner += '<div class="content_header">';
		inner += '<div "style="text-align: right;">第' + count + '樓</div>';// 樓層
		inner += '</div>';
		inner += '<div class="content_body">';
		inner += '<div style="margin-bottom: 10px;">時間 : ' + json[i][array[1]]
				+ '</div>';// 發文時間
		inner += '<div>' + json[i][array[2]] + '</div>';
		inner += '</div>';
		inner += '<a ' + floor + '"></a>';// 樓層用
		inner += '<div class="content_footer">';
		// 判斷是否同一使用者，是就顯示修改按鈕
		if (user == json[i][array[0]] && i != 0) {
			inner += '<button id="'
					+ json[i][array[3]]
					+ '" type="button" class="btn btn-primary reply">修改</button>';
		}
		if (user != null && user != '' && user != json[i][array[0]] && i == 0) {
			inner += '<button type="button" class="btn btn-primary report">檢舉</button>';
		}
		inner += '</div>';
		inner += '</div>';
		inner += '</div>';
		count++;// 樓層編號
	}
	$('#article').html(inner);// 最後輸出，覆蓋

	// 樓層//一定要放這，標籤產生完成，才能增加功能
	$('#xx').keydown(function(event) {
		// alert( event.which );//判斷按下哪個按鈕
		if (event.which == 13) {
			// alert($('#xx').val());
			floor = $('#xx').val() - 1;
			if (typeof (floor) == "undefined") {
				alert('請輸入數值');
			}
			window.location = '#' + floor;
			floor = '';
		}
	});
	// 搜尋
	$("#myInput").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#list tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
	// 檢舉
	$(document).on('click', '.report', function() {
		var content = prompt("請輸入檢舉內容 : ");
		var data = {};
		var dt = new Date();
		var time = dt.getFullYear() + "/" + (dt.getMonth()+1) + "/" + dt.getDate() +
				" " + dt.getHours() + ":" + dt.getMinutes();
		if (content == null) {
			return false;
		}
//		alert(time);
		data['documentId']=$.getUrlParam('documentId');
		data['memberid']=userid;
		data['times']=time;
		data['content']=content;
		$.ajax({
			url:'/DizzyCafe/Report.hongwen',
			method:'POST',
			data:data,
			success:function(){
				alert('檢舉完成!');
			}
		})
	})
};