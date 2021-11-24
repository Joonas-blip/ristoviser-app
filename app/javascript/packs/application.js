// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

const geoLoc = () => {

const btnSearch = document.querySelector("#btn-search");

  if (btnSearch) {
    console.log("button is here")
    // btnSearch.addEventListener("click", () => {


    function appendLocation(location, verb) {
      verb = verb || 'updated';
      var newLocation = document.createElement('h1');
      newLocation.innerHTML = 'Location ' + verb + ': ' + location.coords.latitude + ', ' + location.coords.longitude + '';
      document.body.appendChild(newLocation);

      const url = new URL(window.location.href);
      url.searchParams.set('param1', 'val1');
      url.searchParams.delete('param2');
      window.history.replaceState(null, null, url);


    }

      if ('geolocation' in navigator) {
        btnSearch.addEventListener('click', function () {
          navigator.geolocation.getCurrentPosition(function (location) {
            appendLocation(location, 'fetched');
          });
          let watchId = navigator.geolocation.watchPosition(appendLocation);
        });
      } else {
        console.log('Geolocation API not supported.');
      }


    // })
  }
}


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  geoLoc();
});
