// Catches instances when a page with the ckeditor is navigated away from and then right back to
$(document).bind('turbolinks:load', function() {
  $('.ckeditor').each(function() {
    CKEDITOR.replace($(this).attr('id'));
  });
});
// disable submitting forms on an enter press, breaks comment form being sumbitted via ajax
$(document).ready(function() {
  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });
});