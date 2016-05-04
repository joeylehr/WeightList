// "use strict";

$(document).on('ready', function(){
  $(".exercises").hide();
  $("body").on('click', "[name='post[worked_out]']", function(){
    $(".exercises").toggle();
  });
})