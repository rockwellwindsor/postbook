// This method disables or enables submit button based on if there is text in the field
$(document).on('keyup','#comment_body', function() {
  var body = document.getElementById("comment_body").value
  if(body != ''){
    $(".create-comment-button, .save-comment-edit-button").attr("disabled",false).removeClass('disabled-btn');
  }
  else{
    $(".create-comment-button, .save-comment-edit-button").attr("disabled","disabled").addClass('disabled-btn');
  }
});
// This method submits the new comment data
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
// This method handles deleting a comment
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
// This method handles dismissing hte commetn edit field
$(document).on('click','.save-comment-edit-dismiss-button', function() {
  $('.comment-edit-form-container').remove();
  $('.comment-body').show();
});
// This method handles loading in the comment edit form
$(document).on('click', '.edit-comment-link', function() {
  var comment =  $(this).attr('data-comment-id');
  var post =  $(this).attr('data-post-id');
  /* 
  * Fringe case fix.  
  * Do not allow users to have a new comment and edit comment form open at same time
  */
  $('.new-comment-container').remove();
  $('#comment-body-' + comment).hide();
  $('#comment-edit-div-for-comment-' + comment).load('/comments/' + comment + '/edit');
});
// This method handles saving a new comment
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