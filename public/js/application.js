$(document).ready(function() {
  $("#form_editation").hide()
  $("#show_editation").on('click', function(e){
    $("#form_editation").slideDown();
  });
  $("#submit_editation").on('submit', function(e){
    e.preventDefault();
    $("#form_editation").slideUp();
    var action = $('form').attr('action');
    $.post(action, $('form').serialize());
  });
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
