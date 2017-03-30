$(document).on('click', '.add-comment-button', function() {
  var post = $(this).attr('data-post-id');
  $(this).fadeOut(50);
  $('#new-comment-form-for-post-' + post).load('/comments/new', function() {
    $('.new-comment-form').fadeIn(500);
  });
});

$(document).on('click', '.create-comment-button', function() {
  var post = $('.add-comment-button').attr('data-post-id');
  var body = document.getElementById("comment_body").value
  $.ajax({
    type: "POST",
    url: '/comments/',
    dataType: 'script',
    data: { comment : {body: body, post_id : post}},
    success: function() {
      location.reload();
    }
  });
});