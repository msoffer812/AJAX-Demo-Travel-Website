$(document).ready(function() {
    // Make an AJAX request to get the session variable
    //Specifically for if the user is signed in or not, the value of the account icon will be different
    $.ajax({
        type: 'GET',
        url: '../../server/getSession.php',
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                // Access the session variable
                let name = response.name;
                //If the user's signed in, we have it direct to their account and it displays their name
                //Otherwise, it redirects to login
                if(name.length === 0)
                {
                    $('#account_icon').attr('href', 'logIn.html');
                    $('#account_specs').text("Login");
                }else
                {
                    $('#account_icon').attr('href', 'account.html');
                    $('#account_specs').text("Hello, " + name);
                }
            } else {
                console.error('Failed to retrieve session variable');
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error:', status, error);
        }
    });
    $(document).ready(function() {
        // Make an AJAX request to get the session variable
        //Specifically for if the user is signed in or not, the value of the account icon will be different
        $.ajax({
            type: 'GET',
            url: '../../server/getSession.php',
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    // Access the session variable
                    let name = response.name;
                    //If the user's signed in, we have it direct to their account and it displays their name
                    //Otherwise, it redirects to login
                    if(name.length === 0)
                    {
                        $('#account_link').attr('href', 'logIn.html');
                        $("#account_action").text("Login");
                    }else
                    {
                        $("#account_action").attr('href', '../../server/logout.php');
                    }
                } else {
                    console.error('Failed to retrieve session variable');
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error:', status, error);
            }
        });
        // Add the search bar functionality
        const countries = [
            { name: "Israel", value: "1" },
            { name: "USA", value: "2" },
            { name: "Britain", value: "4" },
            { name: "Europe", value: "5" },
            { name: "Canada", value: "7" },
            { name: "Mexico", value: "8" },
            { name: "Japan", value: "9" },
            { name: "China", value: "10" },
            { name: "Australia", value: "11" },
            { name: "Switzerland", value: "12" },
        ];

        function filterCountries(searchTerm) {
            return countries.filter((country) =>
                country.name.toLowerCase().includes(searchTerm.toLowerCase())
            );
        }

        function displayResults(results) {
            const resultsContainer = $("#searchResults");
            resultsContainer.empty();

            const resultList = $("<ul>").addClass("list-group");

            results.forEach((result) => {
                const resultItem = $("<li>")
                    .addClass("list-group-item country-search-result")
                    .attr("data-country-value", result.value)
                    .text(result.name);

                resultsContainer.append(resultItem);
            });
            resultsContainer.append(resultList);
        }

        $("#countrySearch").on("input", function () {
            const searchTerm = $(this).val();
            const filteredCountries = filterCountries(searchTerm);

            displayResults(filteredCountries);
        });

        $(document).on("click", ".country-button", function () {
            const countryValue = $(this).val();
            window.location.href = "Information.html?country=" + countryValue;
        });
        $(document).on("click", ".country-search-result", function () {
            const countryValue = $(this).data("country-value");
            window.location.href = "Information.html?country=" + countryValue;
        });
    });
});