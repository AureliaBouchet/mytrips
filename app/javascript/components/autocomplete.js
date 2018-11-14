function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var stepAddress = document.getElementById('step_address');
    var tripAddress = document.getElementById('trip_address');
    var hotelAddress = document.getElementById('hotel_address');
    var barAddress = document.getElementById('bar_address');
    var restaurantAddress = document.getElementById('restaurant_address');
    var searchAddress = document.getElementById('index-search');

    if (searchAddress) {
      var autocomplete = new google.maps.places.Autocomplete(searchAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(searchAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

    if (stepAddress) {
      var autocomplete = new google.maps.places.Autocomplete(stepAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(stepAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

    if (tripAddress) {
      var autocomplete = new google.maps.places.Autocomplete(tripAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(tripAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

    if (hotelAddress) {
      var autocomplete = new google.maps.places.Autocomplete(hotelAddress, { types: [ 'establishment' ] });
      google.maps.event.addDomListener(hotelAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

    if (barAddress) {
      var autocomplete = new google.maps.places.Autocomplete(barAddress, { types: [ 'establishment' ] });
      google.maps.event.addDomListener(barAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

    if (restaurantAddress) {
      var autocomplete = new google.maps.places.Autocomplete(restaurantAddress, { types: [ 'establishment' ] });
      google.maps.event.addDomListener(restaurantAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }

  });
}

export { autocomplete };
