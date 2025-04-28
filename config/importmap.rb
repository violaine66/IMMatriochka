# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "flatpickr" # @4.6.13
pin "mapbox-gl", to: "https://ga.jspm.io/npm:mapbox-gl@3.1.2/dist/mapbox-gl.js"
pin "process", to: "https://ga.jspm.io/npm:@jspm/core@2.1.0/nodelibs/browser/process-production.js"
pin "star-rating.js", to: "https://cdn.jsdelivr.net/npm/star-rating.js@4.3.1/dist/star-rating.esm.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@8.0.200/app/assets/javascripts/actioncable.esm.js"
pin "toastr", to: "https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"
pin "toastr-css", to: "https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css"
