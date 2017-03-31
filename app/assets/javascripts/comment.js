$(document).on('click', '.delete-comment', function(e) {
  var comment = $(this).attr('data-comment-id');
  e.preventDefault();
  $.ajax({
    type: "DELETE",
    url: '/comments/' + comment,
    dataType: 'JSON',
    data: {comment : comment},
    success: function(data) {
      $('#comment-'+ comment).fadeOut("slow");
    }
  });
});

$(document).on('click','.save-comment-edit-dismiss-button', function() {
  location.reload();
});

$(document).on('click', '.edit-comment-link', function() {
  var comment =  $(this).attr('data-comment-id');
  $('#comment-body-' + comment).load('/comments/' + comment + '/edit');
});

$(document).on('click', '.save-comment-edit-button', function(e) {
  var comment = $(this).attr('data-comment-id');
  var body = document.getElementById("comment_body").value
  e.preventDefault();
  $.ajax({
    type: "PATCH",
    url: '/comments/' + comment,
    dataType: 'JSON',
    data: {comment : {body: body}},
    success: function() {
      location.reload();
    }
  });
});