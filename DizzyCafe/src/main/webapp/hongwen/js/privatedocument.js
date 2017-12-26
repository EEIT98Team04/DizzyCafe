$(function() {
	var search = '?membername=' + $('#membername').text();
	$('#document').DataTable({
		ajax : {
			url : '/DizzyCafe/Privatedocument.hongwen' + search,
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
			data : 'popularity',
			title : '人氣',
			width : '100px'
		}, {
			data : 'content',
			title : '內容',
			width : '500px'
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
})