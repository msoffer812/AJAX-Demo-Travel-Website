//Function to get the country coordinates from database
// Function to get country coordinates
function getCountryCoordinates(callback) {
    function getQueryParam(name) {
        let urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }
//Function to display correct currency
function displayCurrency(currency)
{
    document.getElementById("convertedCurrency").innerHTML =
        '<option selected value="'+ currency + '" >' + currency + '</option>';
}

    let selectedCountry = getQueryParam('country');
    $.ajax({
        url: '../../server/getCountryCoord.php',
        type: 'GET',
        data: { country: selectedCountry },
        dataType: 'json',
        success: function (data) {
            if (data.status === 'success') {
                // Access the coordinates
                let coord_lat = parseFloat(data.coord_lat);
                let coord_long = parseFloat(data.coord_long);
                let currency = data.currency;
                callback(coord_lat, coord_long);
                displayCurrency(currency);
            }
        },
        error: function (xhr, status, error) {
            console.error('Error fetching data:', status, error);
        }
    });
}
// Function to create the map; called by the Google Maps API
function initMap(coord_lat, coord_long) {
    let loc;
    $(document).ready(
        ()=> {
            console.log('Latitude:', coord_lat);
            console.log('Longitude:', coord_long);
            loc = {lat: coord_lat, lng: coord_long};
            displayMap(loc);
        }
    )
    function displayMap(loc){
        const map = new google.maps.Map(document.getElementById("map"), {
            center: loc,
            zoom: 10,
        });
        const marker = new google.maps.Marker({
            position: loc,
            map: map
        })
    }

}
getCountryCoordinates(function(coord_lat, coord_long) {
    initMap(coord_lat, coord_long);
    // Continue with other asynchronous operations if needed
});
let user;
$(document).ready(function () {
    function getQueryParam(name) {
        let urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(name);
    }

    let selectedCountry = getQueryParam('country');
    getCountries()
    //Function to get the base currencies and all the currencies
    function getCountries() {
        let baseCountry;
        $.ajax({
            url: '../../server/getSession.php',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
               baseCountry = data.country;
               user = data.user;
            },
            error: function (xhr, status, error) {
                console.error('Error fetching data:', status, error);
            }
        });
        $.ajax({
            url: '../../server/getCountries.php',
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                $('#reviews_container').empty();

                data.forEach(function(currency) {
                    var currencyOption;
                    if(baseCountry === currency.country_id)
                    {
                        currencyOption = `
                            <option value="${currency.currName}" selected>${currency.currName}</option>
                        `;
                    } else
                    {
                        currencyOption = `
                            <option value="${currency.currName}">${currency.currName}</option>
                        `;
                    }
                    $('#baseCurrency').append(currencyOption);
                });
            },
            error: function (xhr, status, error) {
                console.error('Error fetching data:', status, error);
            }
        });
    }
    getCountries()
    //Get the data from the php that sends the selected sql data and call method that prints it out
    $.ajax({
        url: '../../server/getInfo.php',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            displayData(data);
        },
        error: function (xhr, status, error) {
            console.error('Error fetching data:', status, error);
        }
    });

    //Create the function to judge whether the user needs more money or not
    function seeIfNeedMoreMoney(totalCost) {
        //Get the balance
        $.ajax({
            type: 'GET',
            url: '../../server/getSession.php',
            dataType: 'json',
            success: function(response) {
                if (response.status === 'success') {
                    // Access the session variable
                    let balance = response.balance;
                    let homeCountry = response.homeCountry;
                    //If the user's signed in, we have it direct to their account and it displays their name
                    //Otherwise, it redirects to login
                    if(balance.length === 0)
                    {
                        console.log("No balance");

                    }else if(homeCountry.length > 0);
                    {
                       if(balance < totalCost)
                       {

                           console.log(balance);
                           console.log(totalCost);
                           alert('You do not have enough money in your balance. Go to your account to add more.');
                       }
                    }
                } else {
                    console.error('Failed to retrieve session variable');
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error:', status, error);
            }
        });
    }

    function displayData(data) {
        //defines div container that contains the activities
        const activityContainer = $('#activity-container');
        const table = $('#table tbody');
        //defines the div where the name of the country goes
        const nm = $('#country h1');
        //defines the div where the description of the country goes
        const descr = $('#description p em');

        //check if there is no data. If not, returns "no data"
        if (data.length === 0) {
            activityContainer.html("<tr><td class ='no-data' colspan='8'> No data</td></tr>");
            return;
        }

        // If there's data
        let cn = "";
        let cd = "";
        let tableHtml = "";
        //object stores reviews by activity id
        const reviewsByActivity = {};
        data.forEach(function (item) {
            if (item.country_id == selectedCountry) {
                cn = item.country_name;
                cd = item.country_description;
                //Add each review to the proper activity array. If activity array for that review wasn't initialized, initializes it
                if (!reviewsByActivity[item.activity_name]) {
                    reviewsByActivity[item.activity_name] = {
                        reviews: [],//it's an array, each review has its own data
                        rank: item.average_activity_ranking,
                        cost: item.cost,
                        timeMins : item.timeMins,
                        activity_id: item.activity_id
                    };
                }
                reviewsByActivity[item.activity_name].reviews.push({
                    user_name: item.user_name,
                    ranking: item.ranking,
                    review: item.review
                });
            }
        });

        // Iterate through the reviewsByActivity object and populate the HTML
        activityContainer.html(""); // Clear the container
        let totalCost = 0;
        for (const activityName in reviewsByActivity) {
            const {reviews, rank, timeMins, cost, activity_id} = reviewsByActivity[activityName];
            totalCost += parseFloat(cost);
            const activityHtml = `
            <div id="activity-${activityName.toLowerCase().replace(/\s+/g, '-')}">
                <h3>${activityName}</h3>
                <p>Time in Minutes: ${timeMins} minutes</p>
                <p>Cost: $ ${cost}</p>
                <!-- Form to write a review -->
                <div id="write_new_review">
                    <form class = "container">
                        Visited? <button type="submit" id="newReview" name="activity" value="${activity_id}" class="btn btn-link">Leave a review!</button>
                    </form>
                </div>
                <div class="rating rating-primary" data-rating="${rank}"></div>
                <div id="reviews-${activityName.toLowerCase().replace(/\s+/g, '-')}">
                    ${reviews.map(review => `
                        <div class="review">
                            <blockquote>${review.review}</blockquote>
                            <div class="rating rating-secondary" data-rating="${review.ranking}"></div>
                            <p><small>-${review.user_name}</small></p>
                        </div>
                    `).join('')}
                </div>
            </div>
        `;
            activityContainer.append(activityHtml);
        }
        //For the popup group
        $('.open-popup').on('click', function() {
            $('.overlay').fadeIn();
            $('.popup').fadeIn();
            seeIfNeedMoreMoney(totalCost);
        });

        $('.close-popup, .overlay').on('click', function() {
            $('.overlay').fadeOut();
            $('.popup').fadeOut();
        });
        // Initialize star ratings
        $(".rating").starRating();
        table.html(tableHtml);
        nm.html("Visit " + cn);
        descr.html(cd);
    }

    //Function to clear out form when canceling
    $(document).on('click', '.cancel-edit', function(event) {
        event.preventDefault(); // Prevent default button behavior

        // Remove the created form
        $('#newReviewForm').remove();
    });
    //Function to write a new review
    $(document).on('click', '#newReview', function(event) {
        event.preventDefault();

        if(user.length === 0){
            alert('Please sign in to write a review');
        } else{
            let reviewContainer = $(this).closest('#write_new_review');
            //Button value of the activity
            let activityName = $(this).val();

            let newReviewForm = `
            <form method=POST action="../../server/newReview.php" id="newReviewForm">
                <div class="mb-3">
                    <label for="edit-ranking" class="form-label">Ranking</label>
                    <input type="number" id="edit-ranking" name="newRanking" value="5" min="0" max="5" step="0.5" class="form-control" style="width: 70px">
                </div>
                <div class="mb-3">
                    <label for="edit-review-text" class="form-label">Review</label>
                    <textarea id="edit-review-text" name="newReview" minlength="1" maxlength="300" class="form-control"></textarea>
                </div>
            <!--One button to save and one to cancel. Save button comes with a warning just in case-->
                <button type="submit" class="btn btn-success btn-sm" name="reviewName" value="${activityName}" onclick="return confirm('Are you sure you want to save?')">Save</button>
                <button type="button" class="btn btn-danger btn-sm cancel-edit">Cancel</button>
            </form>
        `;
            reviewContainer.append(newReviewForm);
        }
    });
    //function to deal with currency converter submission
    $('#currencyConverter').submit(function (event) {
        event.preventDefault();

        //get input value
          let original = parseFloat($('#original').val());
          let base = document.querySelector('#baseCurrency').value;
          let other = document.querySelector('#convertedCurrency').value;
        // Get currency rates from base currency to other currency
          fetch('https://v6.exchangerate-api.com/v6/b1d04f12d4505b848e4df035/pair/' + base + '/' + other)
              .then(api => api.json())
              .then(data => {
                  if (data.result === "success") {
                      let rate = data.conversion_rate;
                      let newAmount = (original * rate.toFixed(2));
                      $('#result').attr("value", newAmount);
                  } else {
                      // I should display this error message somewhere on the HTML but for now it's being sent
                      // to the console
                      console.log("Cannot find conversion rates right now.")
                  }
              })
            .catch(error => {
              //Error message is sent both to user and to console
              console.error("Cannot connect to server")
              document.getElementById("currencyConverter").innerHTML = "Cannot connect to server";
            })
    });


// Code to switch the base and conversion currencies in the form

  document.getElementById('switchCurrency').addEventListener('click', switchCurrencyFunction);

  function switchCurrencyFunction(){
      // set up the variables to make the actual switching more readable
      let converted = document.getElementById('convertedCurrency');
      let base = document.getElementById('baseCurrency');
      let inputBox = document.getElementById('original');
      let resultBox = document.getElementById('result');

      //Now let's perform the actual switch
      // Switch the html between the input and result boxes
      let temp = converted.innerHTML;  // a temporary variable to hold onto the html of converted
      converted.innerHTML = base.innerHTML;
      base.innerHTML = temp;
      // We'll also switch the value which was in the result into the input box
      inputBox.value = resultBox.value;
  }


});