$(document).on('click', '.add-comment-button', function() {
    var post = $(this).attr('data-post-id');
    $(this).fadeOut(50);
    $('#new-comment-form-for-post-' + post).load('/comments/new', function() {
        $('.new-comment-form').fadeIn(500);
    });
});