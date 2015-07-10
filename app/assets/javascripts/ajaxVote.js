$(document).on('ready page:load', function () {
  $(".vote-post").on('ajax:success', function(data, response) {
    console.log(data);
    console.log(response);
    var html = response;
    var voteCount = $(html).find('#post-total-score').html();
    $('#post-total-score').html(voteCount);
    console.log(voteCount);
  });
});
