$(function() { $(document).foundation();
  $('#signIn').find('form#sign_in_user').on('submit', function(event) {
    event.preventDefault();
    var url = $(this).attr('action');
    var signInModal = $('#signIn');
    var email = $("#user_email").val();
    var password = $("#user_password").val();
    var rememberMe = $("#user_remember_me").val();

    $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      data: {
        user: {
          email: email,
          password: password,
          remember_me: rememberMe
        }
      }
    }).done(function(data) {
      signInModal.toggle();
      window.location = "/"
    });
  });

  $('#signUp').find('form#new_user').on('submit', function(event) {
    event.preventDefault();
    var url = $(this).attr('action');
    var signUpModal = $('#signUp');
    var firstName = $('#user_first_name').val();
    var lastName = $('#user_last_name').val();
    var email = $('#new_user').find('#user_email').val();
    var address = $('#new_user').find('#user_address').val();
    var password = $('#new_user').find('#user_password').val();
    var passwordConfirmation = $('#new_user').find('#user_password_confirmation').val();

    $.ajax({
      type: 'POST',
      url: url,
      dataType: 'json',
      data: {
        user: {
          first_name: firstName,
          last_name: lastName,
          email: email,
          address: address,
          password: password,
          password_confirmation: passwordConfirmation
        }
      }
    }).done(function(data) {
      signUpModal.toggle();
      window.location = "/"
    });
  });

  // $('#editAccount').find('form#new_user').on('submit', function(event) {
  //   event.preventDefault();
  //   var url = $(this).attr('action');
  //   var editModal = $('#editAccount');
  //   var firstName = $('#user_first_name').val();
  //   var lastName = $('#user_last_name').val();
  //   var email = $('#new_user').find('#user_email').val();
  //   var address = $('#new_user').find('#user_address').val();
  //   var password = $('#new_user').find('#user_password').val();
  //   var passwordConfirmation = $('#new_user').find('#user_password_confirmation').val();
  //   var currentPassword = $('#new_user').find('#user_current_password').val();
  //   debugger;
  //   $.ajax({
  //     type: 'PUT',
  //     url: url,
  //     dataType: 'json',
  //     data: {
  //       user: {
  //         first_name: firstName,
  //         last_name: lastName,
  //         email: email,
  //         address: address,
  //         password: password,
  //         password_confirmation: passwordConfirmation,
  //         current_password: currentPassword
  //       }
  //     }
  //   }).done(function(data) {
  //     debugger;
  //     editModal.toggle();
  //     window.location = "/"
  //   });
  // });
});

// There will be an addon to the second one for destroying/canceling an account
// This second one will be for testing the sign out
