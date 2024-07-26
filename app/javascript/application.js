import Rails from "@rails/ujs";
import { Turbo } from "@hotwired/turbo-rails";
import "controllers";  // Import all Stimulus controllers
import "trix"
import "@rails/actiontext"
Rails.start();
Turbo.start();


