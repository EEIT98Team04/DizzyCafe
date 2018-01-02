$(document).ready(function() {
			var tmp="";
			$('#test').DataTable({
				ajax : {
					url : '/DizzyCafe/Board.hongwen',
					type : 'GET',
					dataSrc : function(json) {
						this.temp = json;
						return json;
					}
				},
				"paging":   false,
				"ordering": false,
				"info":     false,
				language : {
		            "zeroRecords": "查無資料",
				},
				columns : [{
					data : 'name',
					title : '留言板',
					width:200,
					"render": function(data, type, row, meta){
			            if(type === 'display'){
			            	var hyperlink = "/DizzyCafe/hongwen/document.jsp?";
			            	var get = 'boardId='+row.boardId+'&name='+row.name;
			                data = '<a href="' + hyperlink + get +'">' + data + '</a>';
			            }
			            return data;
			         }
				}, {
					data : 'announcement',
					title : '公告',
				}, {
					data : 'popularity',
					title : '人氣',
					width:100,
				}],
			});
});