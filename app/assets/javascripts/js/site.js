$(document).on('ready', function() {
  $('.loadstack').css('display','none');
});
$(document).on('turbolinks:load', function() {
  $('.loadstack').css('display','none');
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
