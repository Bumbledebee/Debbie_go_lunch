var removeNotice = function(){
  $('#noticemessage').remove();
};

var clickOnYes = function() {
  $(".participating").click(function() {
    $(".textparticipating").html('I AM COMING');
  });
};

var clickOnNO = function() {
  $(".notParticipating").click(function() {
    $(".textparticipating").html('NOT ATTENDING');
  });
};

$( document ).ready(function() {
  $('#noticemessage').fadeOut(2000, removeNotice);
  clickOnYes();
  clickOnNo();
});


