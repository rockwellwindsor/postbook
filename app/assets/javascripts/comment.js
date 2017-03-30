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