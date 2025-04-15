import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }

  connect() {
    console.log("Subscribe to tge chatrrolm with id:", this.chatroomIdValue);
  }
}
