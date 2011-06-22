var colorfy = colorfy || {};

colorfy.update_height = function() {
  //make all cells square
  $('.cell').each(function(index, elm) {
    $(elm).height($(elm).width());
  });
}

$(document).ready(function() {
  colorfy.update_height();
});
