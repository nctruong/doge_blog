$(document).on('ready page:load', function () {
  $("textarea").keydown(function(e) {
     var $this = $(this),
     rows = parseInt($this.attr('rows')),
     lines;

    if (e.which === 13)
      $this.attr('rows', rows + 1);

    if (e.which === 8 && rows !== 2) {
      lines = $(this).val().split('\n')
      if(lines[lines.length - 1] == "") {
        $this.attr('rows', rows - 1);
      }
    }
  });
});
