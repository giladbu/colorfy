
$(document).ready(function() {
  //make all cells square
  $('.cell').each(function(index, elm) {
    $(elm).height($(elm).width());
  });
});

