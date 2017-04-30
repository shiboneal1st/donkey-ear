$(document).ready(function(){
  if ($('#cover').data('cover') != null) {
    $('#cover').backstretch($('#cover').data('cover'));
  }
});