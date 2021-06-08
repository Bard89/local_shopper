// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

require("custom/status")


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
import { initChatroomCable } from '../channels/chatroom_channel';
import {navbarToggle} from '../channels/navbar_toggle';
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initSweetalert } from '../plugins/init_sweetalert';
import { initStarRating } from '../plugins/init_star_rating';
import { sidebar } from '../custom/sidebar';
import 'aos/dist/aos.css';
import AOS from 'aos';
//import {togglePopup} from '../channels/pop_up';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  // Turbolinks.clearCache()
  initChatroomCable();
  navbarToggle();
  initSweetalert('#sweet-alert-demo', {
    title: "A nice alert",
    text: "This is a great alert, isn't it?",
    icon: "success"
  });
  initStarRating();
  AOS.init();
//  togglePopup();
});

