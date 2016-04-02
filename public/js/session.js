$(document).ready(function(){

  var loginOff = true;
  var newUserOff = true;

  var login = function(response) {
    if (loginOff) {
      $('header').after(response);
      $('#login-form').slideDown();
      loginOff = false;
    }
    else {
      $('#login-form').remove();
      loginOff = true;
    }
  }

  var logout = function() {
    location.reload();
  }

  var newUserForm = function(response) {
    if (newUserOff) {
      $('header').after(response);
      $('#new-user-form').slideDown();
      newUserOff = false;
    }
    else {
      $('#new-user-form').remove();
      newUserOff = true;
    }
  }

  $('header').on('click', 'a', function(e) {
    e.preventDefault();
    var $this = $(this);
    var url = $this.attr('href');
    var command = url.split('/')[1];

    console.log("------")
    console.log(command);

    $.ajax({
      method: "GET",
      url: url
    })
    .done(function(response){
      if (command=='login') {
        console.log('here');
        login(response);
      }
      else if (command=='logout') {
        logout();
      }
      else if (url == '/users/new') {
        newUserForm(response);
      }
    })
  })

  $('body').on('submit', '#login-form', function(e) {
    e.preventDefault();
    var $this = $(this);
    var url = $this.attr('action');
    var data = $this.serialize();

    $.ajax({
      method: "POST",
      url: url,
      data: data
    })
    .done(function(response) {
      if (response.logged_in) {
        location.reload();
      }
      else {
        $('.error').remove();
        $('#login-form').append(response.erb_value);
      }
    })
  })

  $('body').on('submit', '#new-user-form', function(e) {
    e.preventDefault();
    var $this = $(this);
    var url = $this.attr('action');
    var data = $this.serialize();

    $.ajax({
      method: "POST",
      url: url,
      data: data
    })
    .done(function(response) {
      if (response.logged_in) {
        location.reload();
      }
      else {
        $('.error').remove();
        $('#login-form').append(response.erb_value);
      }
    })
  })
});