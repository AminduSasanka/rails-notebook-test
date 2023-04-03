import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Connect method of comments_controller.js");
  }

  toggleForm(event) {
    console.log("Comment edit button action");
    event.preventDefault();

    const formId = event.params["form"];
    const contentId = event.params["content"];

    console.log(formId, contentId);

    document.getElementById(formId).classList.toggle("d-none");
    document.getElementById(contentId).classList.toggle("d-none");
  }
}
