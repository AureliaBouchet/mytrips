function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var stepAddress = document.getElementById('step_address');

    if (stepAddress) {
      var autocomplete = new google.maps.places.Autocomplete(stepAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(stepAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
