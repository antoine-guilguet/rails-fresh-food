function initializeAutocomplete(id) {
    var options = {
        componentRestrictions: {country: "FR"}
    };

    var element = document.getElementById(id);
    if (element) {
        var autocomplete = new google.maps.places.Autocomplete(element, options, { types: ['geocode'] });
        google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    }
}

function onPlaceChanged() {
    var place = this.getPlace();
    console.log(place.address_components);
    for (var i in place.address_components) {
        var component = place.address_components[i];
        for (var j in component.types) {  // Some types are ["country", "political"]
            var type_element = document.getElementById('lead_' + component.types[j]);
            if (type_element) {
                type_element.value = component.long_name;
            }
        }
    }
}

google.maps.event.addDomListener(window, 'load', function() {
    initializeAutocomplete('lead_address');
});