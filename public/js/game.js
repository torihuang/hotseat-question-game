$(document).ready(function(){

  var newQuestion = function(clicked_object, e) {
    e.preventDefault();
    var $this = clicked_object;
    var $lastInput = $this.children().last().prev();
    var questionCount = $this.children().length - 2
    if ($lastInput.val() != '') {
      $lastInput.after("<input type='text' name='question_" + questionCount + "' placeholder='New Question'>");
      $lastInput.next().focus();
    }

    // var query = $this.children().last().prev().val();

    // $.ajax({
    //   method: "POST",
    //   url: '/questions',
    //   data: {query: query}
    // })
    // .done(function(response) {
    //   console.log(response);
    // })
  };

  // $('#new-game-form').on('submit', function(e) {
  //   e.preventDefault();
  //   var $this = $(this);
  //   var url = $this.attr('action');
  //   var data = $this.serialize();
  //   console.log(data);

  //   $.ajax({
  //     method: "POST",
  //     url: url,
  //     data: data
  //   })
  //   .done(function(response) {
  //     console.log(response);
  //   })
  // })

  $('#new-game-form').keypress(function(e){
    // e.preventDefault();
    var $this = $(this);
    if(e.keyCode == 13){
      newQuestion($this, e);
    }
  });

  $('#edit-game-form').keypress(function(e){
    // e.preventDefault();
    var $this = $(this);
    if(e.keyCode == 13){
      newQuestion($this, e);
    }
  });
})