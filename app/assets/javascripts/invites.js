$(function() { $(document).foundation();
  $('input.accept').on('click', function(event) {
    event.preventDefault();
    var url = $(this).parent().attr('action');
    var userId = $('#username').attr('val');
    var lunchtimeId = $(this).attr('id');
    var userName = $('#username').attr('user');
    var acceptedPeople = $(this).parent().parent().parent().children('#lunchTime_' + lunchtimeId).find('.accepted');
    var undecidedPeople = $(this).parent().parent().parent().children('#lunchTime_' + lunchtimeId).find('.invited');
    var declinedPeople = $(this).parent().parent().parent().children('#lunchTime_' + lunchtimeId).find('.declined');
    var declineButton = $(this).parent().parent().find('.decline.button');
    $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      data: {
        user_id: userId,
        lunchtime_id: lunchtimeId
      }
    }).done(function(data) {
      $(acceptedPeople).empty();
      data["invitesAccepted"].forEach(function(person) {
        $(acceptedPeople).append("<p>" + person + "</p>");
      })
      $(undecidedPeople).empty();
      data["invitesUnanswered"].forEach(function(person) {
        $(undecidedPeople).append("<p>" + person + "</p>");
      })
      $(declinedPeople).empty();
      data["invitesDeclined"].forEach(function(person) {
        $(declinedPeople).append("<p>" + person + "</p>");
      })
      $(this).hide();
      $(declineButton).show()
    });
  });

  $('input.decline').on('click', function(event) {
    event.preventDefault();
    var url = $(this).parent().attr('action');
    var userId = $('#username').attr('val');
    var lunchtimeId = $(this).attr('id');
    var userName = $('#username').attr('user');
    var acceptedPeople = $(this).parent().parent().parent().children('#lunchTime_' + lunchtimeId).find('.accepted');
    var undecidedPeople = $(this).parent().parent().parent().children('#lunchTime_' + lunchtimeId).find('.invited');
    var declinedPeople = $(this).parent().parent().parent().children('#lunchTime_' + lunchtimeId).find('.declined');
    var acceptButton = $(this).parent().parent().find('.accept.button');
    $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      data: {
        user_id: userId,
        lunchtime_id: lunchtimeId
      }
    }).done(function(data) {
      $(acceptedPeople).empty();
      data["invitesAccepted"].forEach(function(person) {
        $(acceptedPeople).append("<p>" + person + "</p>");
      })
      $(undecidedPeople).empty();
      data["invitesUnanswered"].forEach(function(person) {
        $(undecidedPeople).append("<p>" + person + "</p>");
      })
      $(declinedPeople).empty();
      data["invitesDeclined"].forEach(function(person) {
        $(declinedPeople).append("<p>" + person + "</p>");
      })
      $(this).hide();
      $(acceptButton).show();
    });
  });
});
