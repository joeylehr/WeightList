$(document).on('ready', function(){
  $('.journals-stats').hide();
  $("body").on('click', 'img[id="bigcalculator"]', function(){
    $('.calculator').toggle()
    $('.journals-stats').show();
});
  })

