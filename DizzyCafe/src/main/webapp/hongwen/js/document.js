$(function() {
	var search = document.location.search;// 取得?後面的參數
	var hyperlink = "/DizzyCafe/hongwen/reply.jsp?";

	// 取得參數
	$.getUrlParam = function(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	$('#test').DataTable(
			{
				ajax : {
					url : '/DizzyCafe/Document.hongwen' + search,
					type : 'GET',
					cache : false,
					dataSrc : function(json) {
						return json;
					}
				},
				columns : [
						{
							data : 'name',
							title : '文章名稱',
							"render" : function(data, type, row, meta) {
								if (type === 'display') {
									var get = 'documentId=' + row.documentId
											+ '&name=' + row.name;
									data = '<a href="' + hyperlink + get + '">'
											+ data + '</a>';
								}
								return data;
							}
						}, {
							data : 'times',
							title : '發文時間'
						}, {
							data : 'membername',
							title : '發文者'
						}, {
							data : 'popularity',
							title : '人氣'
						} ],
				language : {
					paginate : {
						next : "下一頁",
						previous : "上一頁"
					},
					lengthMenu : '一頁顯示 _MENU_ 筆資料'
				},
				info : false,
				order : [ 1, 'desc' ]
			});
	$('#post').on('submit', function() {
		var t = tinyMCE.activeEditor.getBody().innerHTML;// 取出tinymve內容
		var that = $(this), data = {};

		// 轉json格式
		that.find('[name]').each(function(index, value) {
			that = $(this), name = that.attr('name'),// 取得name的值
			value = that.val();// 取得值
			data[name] = value;
		});
		data['grid'] = $.getUrlParam('boardId');// 取得版面編號
		data['textarea'] = t;// 將tinymce值放入data，並宣告為json格式[key='textarea',value=t]

		// console.log(data);

		// 資料檢查
		var string = [ 'grid', 'title', 'textarea' ];// 檢查資料的key

		// 初始化所有發文設定
		tinyMCE.activeEditor.getBody().innerHTML = '';// 初始化內容
		$('#d_article').val('');// 清除標題內容

		// ajax傳送
		$.ajax({
			url : '/DizzyCafe/Document.hongwen',
			type : 'POST',
			data : data,
			cache : false,
			success : function(json) {
				// 回傳值是字串
				console.log(json);
				console.log(json[0]['status'] == 'false');
				if (json[0]['status'] == 'false') {
					alert('請登入會員');
					window.location.replace(document.location.href);// 取得現在的URL，並自動導向
				} else {
					alert('發文成功');
					window.location.replace(document.location.href);// 取得現在的URL，並自動導向
				}
			}
		})
		return false;
	});
});