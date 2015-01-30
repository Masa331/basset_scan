// var current_input   = null;
// var mouseX          = null;
// var mouseY          = null;
//
function focus_to_next_empty_select() {
  $('.current-input').removeClass('current-input');
  $('input:text').filter(function() { return $(this).val() == ""; }).first().focus().addClass('current-input');
};
//
function detect(tlc, brc) {
  $.ajax({
    url: "/invoices/detect.js?tlc=" + tlc + "&brc=" + brc,
    dataType: 'json',
    success: function(results){
      $('.current-input').val(results.detected);
      focus_to_next_empty_select();
      $('#scan-box').hide();
    }
  });
};
//
// $(document).ready(function() {
//   var tlc = null;
//   var brc = null;
//
//   $('#invoice-scan').click(function(e) {
//     var offset = $(this).offset();
//     var x = e.pageX - offset.left;
//     var y = e.pageY - offset.top;
//
//     if(tlc == null) {
//       tlc = x + "x" + y;
//       $('#tlc').html(tlc);
//     } else if(brc == null) {
//       brc = x + "x" + y;
//       $('#brc').html(brc);
//     };
//
//     if(tlc != null && brc != null) {
//       detect(tlc, brc);
//       tlc = null;
//       brc = null;
//       yy = null;
//       xx = null;
//     }
//   });
//
//   $('input:text').filter(function() { return $(this).val() == ""; }).focus(function(e){
//     current_input = $(this).addClass('current-input');
//   });
// });

//// #########################


// Click coordinates
  var x1, x2, y1, y2;

  //Variable indicates wether a mousedown event within your selection happend or not
  var selection = false;

  // Global mouse button variables
  var gMOUSEUP = false;
  var gMOUSEDOWN = false;

$( document ).ready(function() {
  // Global Events if left mousebutton is pressed or nor (usability fix)
  $(document).mouseup(function() {
    gMOUSEUP = true;
    gMOUSEDOWN = false;
  });
  $(document).mousedown(function() {
    gMOUSEUP = false;
    gMOUSEDOWN = true;
  });

  // Selection frame (playground :D)
  $("#invoice-scan").mousedown(function(e) {
    selection = true;
    // store mouseX and mouseY
    x1 = e.pageX - this.offsetLeft;
    y1 = e.pageY - this.offsetTop;
    // x1 = e.pageX;
    // y1 = e.pageY;
  });

  // If selection is true (mousedown on selection frame) the mousemove 
  // event will draw the selection div
  $('#invoice-scan').mousemove(function(e) {
    if (selection) {
      // Store current mouseposition
      x2 = e.pageX - this.offsetLeft;
      y2 = e.pageY - this.offsetTop;
      // x2 = e.pageX;
      // y2 = e.pageY;

      // Prevent the selection div to get outside of your frame
      (x2 < 0) ? selection = false : ($(this).width() < x2) ? selection = false : (y2 < 0) ? selection = false : ($(this).height() < y2) ? selection = false : selection = true;;

      // If the mouse is inside your frame resize the selection div
      if (selection) {
        // Calculate the div selection rectancle for positive and negative values
        var TOP = ((y1 < y2) ? y1 : y2) + this.offsetTop;
        var LEFT = ((x1 < x2) ? x1 : x2) + this.offsetLeft;
        var WIDTH = (x1 < x2) ? x2 - x1 : x1 - x2;
        var HEIGHT = (y1 < y2) ? y2 - y1 : y1 - y2;

        // Use CSS to place your selection div
        $("#selection").css({
          position: 'absolute',
          zIndex: 5000,
          left: LEFT,
          top: TOP,
          width: WIDTH,
          height: HEIGHT
        });
        $("#selection").show();

        // Info output
        // $('#status2').html('( x1 : ' + x1 + ' )  ( x2 : ' + x2 + ' )  ( y1 : ' + y1 + '  )  ( y2 : ' + y2 + ' ) ');
      }
    }
  });
  // Selection complete, hide the selection div (or fade it out)
  $('#invoice-scan').mouseup(function() {
    selection = false;
    $("#selection").hide();

    var tlc = x1 + 'x' + y1;
    var brc = x2 + 'x' + y2;
    detect(tlc, brc);
    x1 = null;
    x2 = null;
    y1 = null;
    y2 = null;
  });
  // Usability fix. If mouse leaves the selection and enters the selection frame again with mousedown
  $("#invoice-scan").mouseenter(function() {
    (gMOUSEDOWN) ? selection = true : selection = false;
  });
  // Usability fix. If mouse leaves the selection and enters the selection div again with mousedown
  $("#selection").mouseenter(function() {
    (gMOUSEDOWN) ? selection = true : selection = false;
  });
  // Set selection to false, to prevent further selection outside of your selection frame
  $('#invoice-scan').mouseleave(function() {
    selection = false;
  });
});
