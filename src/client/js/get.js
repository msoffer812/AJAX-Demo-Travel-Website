$(document).ready(function () {
    $.ajax({
        url: '../../getInfo.php',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            displayData(data);
        },
        error: function (xhr, status, error) {
            console.error('Error fetching data:', status, error);
        }
    });

    function displayData(data) {
        const activityContainer = $('#activity-container');

        if (data.length === 0) {
            activityContainer.html("<p>No data</p>");
            return;
        }

        let html = '<ul>';
        data.forEach(function (item) {
            html += '<li>' + item.activity_name + ' - ' + item.ranking + '</li>';
            // You can customize the HTML based on your data structure
        });
        html += '</ul>';

        activityContainer.html(html);
    }
});
