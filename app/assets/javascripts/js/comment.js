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
  $('.loadstack').css('display','');
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
  $('.loadstack').css('display','');
  var comment = $(this).attr('data-comment-id');
  e.preventDefault();
  $.ajax({
    type: "DELETE",
    url: '/comments/' + comment,
    dataType: 'JSON',
    data: {comment : comment},
    success: function(data) {
      $('.loadstack').css('display','none');
      $('#comment-'+ comment).fadeOut("slow");
    }
  });
});

// This method handles dismissing hte commetn edit field
$(document).on('click','.save-comment-edit-dismiss-button', function() {
  var comment =  $(this).attr('data-comment-id');
  $('.comment-edit-form-container').remove();
  $('.comment-body').show(); // Show the body that was hidden when edit was pressed
  $('#author-links-for-' + comment).removeClass('hidden'); // Show edit / destroy links again
});

// This method handles loading in the comment edit form
$(document).on('click', '.edit-comment-link', function() {
  $('.loadstack').css('display','');
  var comment =  $(this).attr('data-comment-id');
  var post =  $(this).attr('data-post-id');
  /* 
  * Fringe case fix.  
  * Do not allow users to have a new comment and edit comment form open at same time
  */
  $('.new-comment-container').remove();
  $('.comment-edit-form-container').remove(); // Hide other edit boxes that may be open
  $('#author-links-for-' + comment).addClass('hidden'); // Hide the author links
  $('#comment-body-' + comment).hide(); // Hide the body that is there right now, reshow if dismiss button is hit
  $('#comment-edit-div-for-comment-' + comment).load('/comments/' + comment + '/edit', function() { setTimeout(function(){ $('.loadstack').css('display','none'); }, 1000) });
});

// This method handles saving a new comment
$(document).on('click', '.save-comment-edit-button', function(e) {
  $('.loadstack').css('display','');
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