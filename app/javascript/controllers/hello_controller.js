import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["init", "name", "output"]

  connect() {
    this.initTarget.textContent = "Hello World!"
  }

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}`
  }
}
