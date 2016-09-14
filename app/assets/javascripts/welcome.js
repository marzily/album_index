function search() {
  $('#search').click(function() {
    $.ajax({
      method: "GET",
      url: "/",
      data: { song: $('#song').val(),
              album: $('#album').val(),
              artist: $('#artist').val() },
      error: function(message) {
        console.log(message);
      },
      success: function() {
        console.log('print me!');
      }
    });
  });
}

$(document).ready(function() {
  search();
});
