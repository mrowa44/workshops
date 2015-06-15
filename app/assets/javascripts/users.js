var main = function(){
  $('.users .btn-group .btn').click(function(){
    $(this).toggleClass('active');
    $(this).siblings().toggleClass('active');
  });

  $('.user-products-btn').click(function(){
    $('.user-products').removeClass('hidden');
    $('.user-reviews').addClass('hidden');
  });

  $('.user-reviews-btn').click(function(){
    $('.user-reviews').removeClass('hidden');
    $('.user-products').addClass('hidden');
  });
}
$(document).on('page:load', main);
$(document).ready(main);
