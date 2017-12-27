$(function() {
	var search = '?membername=' + $('#membername').text();
	$('#document')
			.DataTable(
					{
						ajax : {
							url : '/DizzyCafe/Privatedocument.hongwen' + search,
							type : 'GET',
							cache : false,
							dataSrc : function(json) {
								return json;
							}
						},
						columns : [
								{
									data : 'membername',
									title : '發文者',
									width : '100px'
								},
								{
									data : 'times',
									title : '時間',
									width : '300px'
								},
								{
									data : 'popularity',
									title : '人氣',
									width : '100px'
								},
								{
									data : 'name',
									title : '內容',
									width : '500px'
								},
								{
									data : 'documentId',
									title : '修改',
									width : '100px',
									"render" : function(data, type, row, meta) {
										if (type === 'display') {
											data = "<a href='#' class='btn binding' id='"
													+ row.documentId
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
})