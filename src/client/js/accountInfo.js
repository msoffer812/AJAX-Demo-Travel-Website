// Define createEditableReview globally
function createEditableReview(review) {
    var editableReview = `
                <div class="review-item">
                    <p>Ranking: ${review.ranking}</p>
                    <p>Review: ${review.review}</p>
                    <form>
                        <button type="submit" class="btn btn-primary btn-sm" value="${review.id}" name="edit">Edit</button>
                    </form>
                </div>
            `;
    return editableReview;
}

// Function to fetch and display user reviews
function loadReviews() {
    $.ajax({
        url: '../../server/getUserReviews.php',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            $('#reviews_container').empty();

            data.forEach(function(review) {
                var reviewItem = `
                            <div class="review-item">
                                <h3>${review.activity_name}</h3>
                                <p>Country: ${review.country_name}</p>
                                <p>Ranking: ${review.ranking}</p>
                                <p>Review: ${review.review}</p>
                                <form>
                                    <button type="submit" class="btn btn-primary btn-sm" value="${review.id}" name="edit">Edit</button>
                                </form>
                            </div>
                        `;
                $('#reviews_container').append(reviewItem);
            });
        },
        error: function(xhr, status, error) {
            console.error('Error fetching data:', status, error);
        }
    });
}

let currency = "$";
// Document ready function
$(document).ready(function() {
    $.ajax({
        type: 'GET',
        url: '../../server/getSession.php',
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                // Access the session variable
                let balance = response.balance;
                let name = response.name;
                let country = response.countryName;
                //If the user's signed in, we have it direct to their account and it displays their name
                //Otherwise, it redirects to login
                if(balance.length === 0)
                {
                    console.log("No balance");

                }else
                {
                    $('#balance_display').val(balance);
                    $('#user_name').text(name);
                    $('#user_country').text(country);
                    $('#currency').text(currency);
                }
            } else {
                console.error('Failed to retrieve session variable');
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error:', status, error);
        }
    });
    $.ajax({
        type: 'GET',
        url: '../../server/getUserCurrency.php',
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                // Access the currency
                currency = response.currency;
                $('#currency').text(currency);
            } else {
                console.error('Failed to retrieve session variable');
            }
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error:', status, error);
        }
    });
    //Call loadReviews to load initial reviews into the page
    loadReviews();

    // Event listener for the edit button click
    $(document).on('click', '.review-item button[name="edit"]', function(event) {
        event.preventDefault(); // Prevent default form submission

        // Get the parent div of the clicked button
        var parentDiv = $(this).closest('.review-item');
        // Get the ID value from the clicked button, so we know which to edit
        var reviewId = $(this).val();
        // Get the current values for editing
        var activityName = parentDiv.find('h3').text();
        var countryName = parentDiv.find('p:eq(0)').text().replace('Country: ', '');
        var ranking = parentDiv.find('p:eq(1)').text().replace('Ranking: ', '');
        var reviewText = parentDiv.find('p:eq(2)').text().replace('Review: ', '');

        // Create an editing form HTML
        var editForm = `
                    <form class="edit-form" method="POST" action="../../server/editReviews.php">
    <h3>${activityName}</h3>
    <p>Country: ${countryName}</p>
    <div class="mb-3">
        <label for="edit-ranking" class="form-label">Ranking</label>
        <input type="number" id="edit-ranking" name="newRanking" value="${ranking}" min="0" max="5" step="0.5" class="form-control" style="width: 70px">
    </div>
    <div class="mb-3">
        <label for="edit-review-text" class="form-label">Review</label>
        <textarea id="edit-review-text" name="newReview" minlength="1" maxlength="300" class="form-control">${reviewText}</textarea>
    </div>
    <!--One button to save and one to cancel. Save button comes with a warning just in case-->
    <button type="submit" class="btn btn-success btn-sm" name="review_id" value="${reviewId}" onclick="return confirm('Are you sure you want to change?')">Save</button>
    <button type="button" class="btn btn-danger btn-sm cancel-edit">Cancel</button>
</form>

                `;

        // Replace the review details with the edit form
        parentDiv.html(editForm);
    });

    // Event listener to cancel editing and revert to original view
    $(document).on('click', '.cancel-edit', function(event) {
        event.preventDefault(); // Prevent default button behavior

        // Reload the reviews without editing
        loadReviews();
    });
});