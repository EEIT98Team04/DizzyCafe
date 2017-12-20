$(function() {	
	var search = document.location.search;// 取得?後面的參數
	var hyperlink = "/DizzyCafe/hongwen/reply.jsp?";
	$('#post').on('submit', function() {		
		alert('2');
		
		var that = $(this),
		url='fghjkl',
		method='POST',
		data={};
		
		
		that.find('[name]').each(function(index, value) {
			console.log(value);
			var that = $(this), name = that.attr('name'), value = that.val();

			data[name] = value;
		});
		
		var tt = JSON.stringify(data);
		console.log(data);
		console.log(tt);

		$.ajax({
			url : url,
			type : method,
			data : data,
			success : function(response) {
				console.log("ajax response")
			}
		})
		return false;
	});
	
	
	$('#test').DataTable(
			{
				ajax : {
					url : '/DizzyCafe/Documentget.hongwen' + search,
					type : 'GET',
					dataSrc : function(json) {
						return json;
					}
				},
				columns : [
						{
							data : 'name',
							"render" : function(data, type, row, meta) {
								if (type === 'display') {
									var get = 'documentId=' + row.documentId
											+ '&name=' + row.name;
									data = '<a href="' + hyperlink + get + '">'
											+ data + '</a>';
								}
								return data;
							}
						},
						{
							data : 'memberId',
							"render" : function(data, type, row, meta) {
								if (type === 'display') {
									var get = 'memberId=' + row.memberId
											+ '&name=' + row.name;
									// data = '<a href="' + hyperlink +
									// get +'">' + data + '</a>';
									data = row.times + '/' + row.memberId;
								}
								return data;
							}
						}, {
							data : 'memberId'
						}, {
							data : 'popularity'
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
});