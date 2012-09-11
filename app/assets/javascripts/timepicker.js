
$(function() {
  $('#datepicker').datepicker({ dateFormat: 'yy-mm-dd' }).val();
});

$(function() {
  $( ".timepicker" ).timepicker( {
  ampm: true,
  hourGrid: 4,
  minuteGrid: 10
});
});
