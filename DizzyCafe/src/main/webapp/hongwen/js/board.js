$(document).ready(function() {
			var tmp="";
			$('#test').DataTable({
				ajax : {
					url : '/DizzyCafe/Board.hongwen',
					type : 'POST',
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
					"render": function(data, type, row, meta){
			            if(type === 'display'){
			            	var hyperlink = "/DizzyCafe/hongwen/document.jsp?";
			            	var get = 'boardId='+row.boardId+'&name='+row.name;
			                data = '<a href="' + hyperlink + get +'">' + data + '</a>';
			            }
			            return data;
			         }
				}, {
					data : 'popularity'
				}, {
					data : 'announcement'
				}],
			});
});