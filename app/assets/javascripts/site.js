// Catches instances when a page with this editor is navigated away from and then right back to
$(document).bind('turbolinks:load', function() {
  $('.ckeditor').each(function() {
    CKEDITOR.replace($(this).attr('id'));
  });
});