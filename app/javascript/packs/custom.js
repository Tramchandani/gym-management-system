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

window.addEventListener("load", () => {
  const links = document.querySelectorAll("a[data-remote]");
  links.forEach((element) => {
    element.addEventListener("ajax:success", () => {
      alert("Deleted!");
    });
  });
});

$(document).on('turbolinks:load', function () {
  $('#click-here').on('click', function() { 
    document.getElementById('img-form').style.display = "block";
    document.getElementById('img-button').style.display = "none";
  });
});
