// app/javascript/controllers/dark_mode_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button"]  // ← define your button target

  connect() {
    this.applyTheme();
  }

  toggle() {
    const html = document.documentElement;

    if (html.classList.contains("dark")) {
      html.classList.remove("dark");
      localStorage.theme = "light";
    } else {
      html.classList.add("dark");
      localStorage.theme = "dark";
    }

    this.updateButtonText();
  }

  applyTheme() {
    const html = document.documentElement;

    // Apply theme on page load
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      html.classList.add('dark');
    } else {
      html.classList.remove('dark');
    }

    this.updateButtonText();
  }

  updateButtonText() {
    // Check correct class
    if (document.documentElement.classList.contains("dark")) {
      this.buttonTarget.textContent = "☼";
    } else {
      this.buttonTarget.textContent = "☾";
    }
  }
}
