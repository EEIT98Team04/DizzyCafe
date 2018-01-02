$(function() {
	$('#2').click(function() {
		if (bool == false) {
			reply();
			bool = true;
		}
	});
	var bool = false;// 避免重複執行function
	var search = $('#membername').text();
	var reply = function() {
		console.log(search);
		$('#reply').DataTable({
			ajax : {
				url : '/DizzyCafe/Privatereply.hongwen' + '?membername=' + search,
				type : 'GET',
				cache : false,
				dataSrc : function(json) {
					return json;
				}
			},
			columns : [ {
				data : 'membername',
				title : '發文者',
				width : '100px'
			}, {
				data : 'times',
				title : '時間',
				width : '300px'
			}, {
				data : 'content',
				title : '回覆內容',
				width : '500px',
				"render" : function(data, type, row, meta) {
					if (type === 'display') {
						data = row.content.substring(0,25);
					}
					return data;
				}
			}, {
				data : 'replyId',
				title : '修改',
				width : '100px',
				"render" : function(data, type, row, meta) {
					if (type === 'display') {
						data = "<a href='#' class='btn reply' id='"
								+ row.replyId
								+ "'><i class='fa fa-pencil' aria-hidden='true'></i></a>";
					}
					return data;
				}
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
	}
})
