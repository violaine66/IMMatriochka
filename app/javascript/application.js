// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "toastr"
import "toastr-css"

// Initialisation de Toastr
document.addEventListener("DOMContentLoaded", () => {
  if (flashNotice = document.querySelector('[data-flash-notice]')) {
    toastr.success(flashNotice.dataset.flashNotice);
  }
  if (flashAlert = document.querySelector('[data-flash-alert]')) {
    toastr.error(flashAlert.dataset.flashAlert);
  }
});
