// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener('turbolinks:load', () => {
  const flashMessage = document.querySelector('#notice_wrapper');
  const fadeOutFlashMessage = () => {
    const timer_id = setInterval(() => {
      const opacity = flashMessage.style.opacity;

      if (opacity > 0) {
          flashMessage.style.opacity = opacity - 0.02;
        } else {
          flashMessage.style.display = 'none';
          clearInterval(timer_id);
        };
      }, 50);
    }
  
    if (flashMessage !== null) {
      flashMessage.style.opacity = 1;
      setTimeout(fadeOutFlashMessage, 2000);
    };
  });
