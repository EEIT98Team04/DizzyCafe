$(function() {
		tinymce.init({
					selector : "textarea",
					language : 'zh_TW',
					height : 400,
					menubar : false,
					statusbar : false,
					toolbar_items_size : 'small',
					plugins : [
							"advlist autolink autosave link image lists charmap print preview hr anchor pagebreak",
							"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
							"table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern" ],

					toolbar1 : "code | cut copy paste | searchreplace | bullist numlist | outdent indent | image | insertdatetime preview",
					toolbar2 : "undo redo | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify",
					toolbar3 : "fontselect fontsizeselect forecolor charmap emoticons",
					content_css : [
							'//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
							'//www.tinymce.com/css/codepen.min.css' ],

					init_instance_callback : function() {
						window.setTimeout(function() {
							$("#div").show();
						}, 1000);
					},

					file_picker_callback : function(callback, value, meta) {
						// Provide file and text for the link dialog
						if (meta.filetype == 'file') {
							callback('mypage.html', {
								text : 'My text'
							});
						}

						// Provide image and alt text for the image dialog
						if (meta.filetype == 'image') {
							$('#upload').trigger('click');
							$('#upload').change(function(event) {
								var file_data = $("#upload").prop("files")[0];   // Getting the properties of file from file field
								var form_data = new FormData();                  // Creating object of FormData class
								form_data.append("upload", file_data);			//append data into it, or u can declare it in construct
								console.log(form_data);
								// 利用ajax傳送到伺服器
								$.ajax({
									url : '/DizzyCafe/imageupload.hongwen',
									type : 'POST',
									data :form_data,
									cache : false,
									contentType : false,
									processData : false,
									success : function(data) {
										upload='';
//										alert('upload success');
										callback(data, {
											text : data
										});
									}
								});
							});
						}

						// Provide alternative source and posted for the media
						// dialog
						if (meta.filetype == 'media') {
							callback('movie.mp4', {
								source2 : 'alt.ogg',
								poster : 'image.jpg'
							});
						}
					},

				});
	});