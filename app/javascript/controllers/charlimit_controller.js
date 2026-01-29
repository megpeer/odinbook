import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = [ "input", "output" ]
    static values = { number: Number }

    connect() {
        this.update()
    }
    update() {
        const remaining = this.numberValue - this.inputTarget.value.length
        this.outputTarget.textContent = remaining
    }
}