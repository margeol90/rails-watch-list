import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Make custom lists", "Add your movies"],
      typeSpeed: 50,
      loop: true
    })
  }
}
