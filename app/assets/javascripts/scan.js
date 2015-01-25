function detect(tlc, brc) {
  $.ajax({
    url: "/invoices/detect.js?tlc=" + tlc + "&brc=" + brc,
    dataType: 'json',
    success: function(results){
      $('#detected-text').html(results.detected);
    }
  });
};

$(document).ready(function() {
  var tlc = null;
  var brc = null;

  $('#invoice-scan').click(function(e) {
    var offset = $(this).offset();
    var x = e.pageX - offset.left;
    var y = e.pageY - offset.top;

    if(tlc == null) {
      tlc = x + "x" + y;
      $('#tlc').html(tlc);
    } else if(brc == null) {
      brc = x + "x" + y;
      $('#brc').html(brc);
    };

    if(tlc != null && brc != null) {
      detect(tlc, brc);
      tlc = null;
      brc = null;
    }
  });
});
