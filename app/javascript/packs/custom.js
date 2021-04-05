if(jQuery().fancybox) {
  $(document).ready(function(){
    $(".fancybox").fancybox({
      openEffect: "none",
      closeEffect: "none"
    });
    $(".zoom").hover(function(){
      $(this).addClass('transition');
    }, function(){   
      $(this).removeClass('transition');
    });
  });
}

$(document).on('turbolinks:load', function () {
  $('#click-here').on('click', function() { 
    $('#img-form').show();
    $('#img-button').hide();
  });
  $(".delete_it").on('ajax:success', function() {
    alert("Deleted!");
  })
});
