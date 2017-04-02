// This method handles showing the new comment form
$(document).on('click','.go-to-comment-div', function() {
  $('.loadstack').css('display','');
  var post = $(this).attr('data-post-id');
  /* 
  * Fringe case fix.  
  * Do not allow users to have a new comment and edit comment form open at same time
  */
  $('.comment-edit-form-container').remove();
  $('.comment-body').show();
  $('html, body').animate({ scrollTop: $('#add-comment-div').offset().top }, 'slow', function() {
    show_comment_form(post);
  });
});
// Called after the scroll is done
function show_comment_form(post) {
  $('#new-comment-form-for-post-' + post).load('/comments/new', function() {
    $('.new-comment-form').fadeIn(1000);
    $('.loadstack').css('display','none');
  });
}