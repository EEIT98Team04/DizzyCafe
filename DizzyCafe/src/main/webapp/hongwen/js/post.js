$(function() {
  tinymce.init({
			selector : "#textarea",
			language : 'zh_TW',
			height : 500,
			images_upload_credentials : false,
			menubar : false,
			statusbar : false,
			image_advtab: true,
    paste_data_images: true,
    setup: function (editor) {
        editor.on('change', function () {
            tinymce.triggerSave();
        });
    },
    plugins: [
      "advlist autolink lists link image charmap print preview hr anchor pagebreak",
      "searchreplace wordcount visualblocks visualchars code fullscreen",
      "insertdatetime media nonbreaking save table contextmenu directionality",
      "emoticons template paste textcolor colorpicker textpattern"
    ],
    toolbar1 : "code image | cut copy paste | searchreplace | bullist numlist | outdent indent | insertdatetime preview",
	toolbar2 : "undo redo | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify",
	toolbar3 : "fontselect fontsizeselect forecolor charmap emoticons",

	images_upload_url: 'postAcceptor.php',
	  
	  // we override default upload handler to simulate successful upload
	  images_upload_handler: function (blobInfo, success, failure) {
		    var xhr, formData;
		    xhr = new XMLHttpRequest();
		    xhr.withCredentials = false;
		    xhr.open('POST', 'postAcceptor.php');
		    xhr.onload = function() {
		      var json;

		      if (xhr.status != 200) {
		        failure('HTTP Error: ' + xhr.status);
		        return;
		      }
		      json = JSON.parse(xhr.responseText);

		      if (!json || typeof json.location != 'string') {
		        failure('Invalid JSON: ' + xhr.responseText);
		        return;
		      }
		      success(json.location);
		    };
		    formData = new FormData();
		    formData.append('file', blobInfo.blob(), fileName(blobInfo));
		    xhr.send(formData);
	  },
	
  });
  tinymce.activeEditor.uploadImages(function(success) {
	   document.forms[0].submit();
  });
});