$(document).ready(function() {
  var imgs = ['/imgs/hen-do.jpg', '/imgs/dinner-party-laughing.jpg', '/imgs/ladies-laughing.jpg'];
  var index = 0;

  var myInterval = setInterval(function () {
      $('#banner-image').remove();
      $('#scroll-bar').append(`<img src=${imgs[index]} id='banner-image'>`);
      index += 1;
      if (index > imgs.length) {
        index = 0;
      }
    },10000);

  // $('#scroll-bar').
})