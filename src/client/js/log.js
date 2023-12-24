$(document).ready(function() {
    // Make an AJAX request to get the session variable
    //Specifically for if there's an error message from logging in to display
    $.ajax({
        type: 'GET',
        url: '../../server/getSession.php',
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                // Access the session variable
                let errLogin = response.errLogin;
                //write login error message into div
                $("#errorMessage").text(errLogin);
                console.log(errLogin);
            } else {
                console.error('Failed to retrieve session variable');
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error:', status, error);
        }
    });
});