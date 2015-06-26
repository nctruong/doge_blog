$(document).on('ready page:load', function () {
  $('#upload-user-avatar').on('change', function(e) {
    $('#img_prev').html('');
    var files = e.target.files;
    var image = files[0]
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image(300,300);
      img.src = file.target.result;
      $('#img_prev').append("<b><p>Sized to: 300 X 300</p></b>");
      $('#img_prev').append(img);
      $('#img_prev').removeClass("hidden");
    }
    reader.readAsDataURL(image);
  });
});
