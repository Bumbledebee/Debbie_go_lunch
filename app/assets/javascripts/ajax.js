var removeNotice = function(){
  $('.noticemessage').remove();
};


$( document ).ready(function() {
  $('.noticemessage').fadeOut(2000, removeNotice);
});


