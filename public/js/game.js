$(document).ready(function(){

  var currentQuestionIndex = 0;
  var questions = [];
  var onQuestion = true;

  var newQuestion = function(clicked_object, e) {
    e.preventDefault();
    var $this = clicked_object;
    var $lastInput = $this.children().last().prev();
    var questionCount = $this.children().length - 2
    if ($lastInput.val() != '') {
      $lastInput.after("<input type='text' name='question_" + questionCount + "' placeholder='New Question'>");
      $lastInput.next().focus();
    }
  };

  var play = function(question) {
    if (onQuestion) {
      $('#question-show').text(question.query);
      onQuestion = false;
    }
    else {
      $('#question-show').text(question.answer);
      onQuestion = true;
      currentQuestionIndex += 1;
    }
  }

  $('body').keyup( function(e){
    // e.preventDefault();
    if ($('header').css('display') == 'none') {
      if (currentQuestionIndex == questions.length) {
        currentQuestionIndex = 0;
        window.location.href = '/';
      }
      if (e.keyCode == 39) {
        nextQuestion = questions[currentQuestionIndex];
        play(nextQuestion);
      }
      else if (e.keyCode == 37) {
        currentQuestionIndex -= 1;
        if (currentQuestionIndex < 0) {
          currentQuestionIndex = 0;
        }
        play(questions[currentQuestionIndex]);
      }
    }


  })

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

  $('#edit-game-form').on('submit', function(e) {
    e.preventDefault();
    var $this = $(this);
    var url = $this.attr('action');
    var data = $this.serialize();

    $.ajax({
      method: "PUT",
      url: url,
      data: data
    })
    .done(function(response) {
      console.log(response.url);
      window.location.href = response.url;
    })
  })

  $('#game-screen').on('click', '#play-button', function(e) {
    e.preventDefault();
    var $this = $(this);
    $('header').toggle();
    $('#play-button').toggle();
    $('#exit').toggle();
    $('#question-show').toggle();
    var gameId = $this.children().val();

    $.ajax({
      method: "GET",
      url: "/games/" + gameId + "/questions"
    })
    .done(function(response) {
      questions = response.questions;
      play(questions[currentQuestionIndex]);
    })
  })
})