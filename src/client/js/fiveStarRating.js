//jQuery plugin to have rating displayed by stars. Accepts the rating and responds accordingly
(function ($) {
        $.fn.starRating = function () {
            return this.each(function () {
                var $rating = $(this);
                var rating = parseFloat($rating.data("rating"));

                $rating.html('');
                for (var i = 1; i <= 5; i++) {
                    var star = $("<span>").addClass("star").text("★");
                    if (i <= rating) {
                        star.addClass("active");
                    }
                    $rating.append(star);
                }
            });
        };
    })(jQuery);

    // Initialize the rating system on all elements with the "rating" class
    $(document).ready(function () {
        $(".rating").starRating();
    });