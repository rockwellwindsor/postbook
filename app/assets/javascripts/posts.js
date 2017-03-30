$(document).on('click','.go-to-comment-div', function() {
  var post = $(this).attr('data-post-id');

  $('html, body').animate({ scrollTop: $('#add-comment-div').offset().top }, 'slow', function() {
    show_comment_form(post);
  });
});

function show_comment_form(post) {
  $('#new-comment-form-for-post-' + post).load('/comments/new', function() {
    $('.new-comment-form').fadeIn(1000);
  });
}

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