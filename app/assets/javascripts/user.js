$(document).on('ready', function(){
  $('.journals-stats').hide();
  $("body").on('click', 'img[id="bigcalculator"]', function(){
    $('.calculator').toggle()
    $('.journals-stats').show();
  });
})

$(document).on('ready', function(){
  $(".magnifying-glass").click(function(event){
    event.preventDefault();
    var wj_id = $(this).attr("id")
    $(".modal-title").text("");
    $(".modal-body").text("");
    $.ajax({
      url: '/weight_journals/' + wj_id +'/quick_view',
      method: "GET",
      data: {id: wj_id}
    }).success(function(response, setting){
      if (response.most_recent_weight === null) {
        $(".modal-body").append("CREATE A POST!")
      } else {
        var start_date = response.wj.start_date;
        var final_date = response["wj"].final_weigh_in_date;
        var starting_weight = response["wj"].starting_weight;
        var weight_goal = response["wj"].weight_goal;
        var total_days = response["days"];
        var wj_title = response["wj"]["title"];
        var days_remaining = response.days_remaining;
        var last_post_date = response["most_recent_weight"].entry_date;
        var last_post_weight = response["most_recent_weight"].current_weight;
        $(".modal-title").append(wj_title);
        $(".modal-body").append('<li>' + "Start Date: " + start_date + '</li>');
        $(".modal-body").append('<li>' + "Final Weigh-in Date: " + final_date);
        $(".modal-body").append('<li>' + "Starting Weight: " + starting_weight + " lbs" + '</li>');
        $(".modal-body").append('<li>' + "Weight Goal: " + weight_goal + " lbs" + '</li>');
        $(".modal-body").append('<li>' + "Duration: " + total_days + " days" + '</li>'); 
        $(".modal-body").append('<li>' + "Most Recent Weigh-in Date: " + last_post_date + '</li>');
        $(".modal-body").append('<li>' + "Most Recent Weigh-in: " + last_post_weight + " lbs" + '</li>');
        if (days_remaining > 0) {
          $(".modal-body").append('<li>' + "Day(s) Remaining: " + days_remaining + '</li>')
        } else {
          $(".modal-body").append('<li>' + "You've completed this journal!" + '</li>')
        };
      }
    });      
  });
})

// SHIA LABEOUF VIDEO (not my code)
function autoPlayYouTubeModal(){
  var trigger = $("body").find('[data-toggle="modal"]');
  trigger.click(function() {
    var theModal = $(this).data( "target" ),
    videoSRC = $(this).attr( "data-theVideo" ), 
    videoSRCauto = videoSRC+"?autoplay=1" ;
    $(theModal+' iframe').attr('src', videoSRCauto);
    $(theModal+' button.close').click(function () {
        $(theModal+' iframe').attr('src', videoSRC);
    });   
  });
}

$(document).ready(function(){
  autoPlayYouTubeModal();
});
