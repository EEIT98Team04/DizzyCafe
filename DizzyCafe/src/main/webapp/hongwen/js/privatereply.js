$(function() {
	$('#2').click(function() {
		if(bool == false){
			reply();
			bool = true;
		}
	});
})
var bool = false;//避免重複執行function
var search = '?membername=' + $('#membername').text();
var reply = function() {
	$('#reply').DataTable({
		ajax : {
			url : '/DizzyCafe/Privatereply.hongwen' + search,
			type : 'GET',
			cache : false,
			dataSrc : function(json) {
				return json;
			}
		},
		columns : [{
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
			width : '500px'
		} ,{
			data : 'replyId',
			width : '100px'
		}],
//		"columnDefs" : [{
//			"targets" : 4,
//			"data" : null,
//			"render" : function(data,row) {
//				var html = "<a href='#' class='btn btn-success' id='edit"+data.replyId+"'><i class='fa fa-pencil' aria-hidden='true'></i></a>"
//				return html;
//			}
//		}],
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