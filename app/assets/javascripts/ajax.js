var removeNotice = function(){
  $('#notice').remove();
};



$( document ).ready(function() {
  $('#notice').fadeOut(2000, removeNotice);
});