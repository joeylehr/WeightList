$(document).on('ready', function(){
  $('.journals-stats').hide();
  $("body").on('click', 'img[id="bigcalculator"]', function(){
    $('.calculator').toggle()
    $('.journals-stats').show();
  });
})



$(document).on('ready', function(){
  $(".magnifying-glass img").click(function(event){
    event.preventDefault();
    var wj_id = $(this).attr("id")
    $.ajax({
      url: '/weight_journals/' + wj_id +'/quick_view',
      method: "GET",
      data: {id: wj_id}
    }).success(function(response, setting){
      debugger
    })
      
  });
})

