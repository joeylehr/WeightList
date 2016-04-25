$(document).on('ready page:load', function(){
  $(".exercises").hide();
  $("body").on('click', "[name='post[worked_out]']", function(){
    $(".exercises").toggle();
});
  })

