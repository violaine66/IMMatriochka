import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.element._insertMessageAndScroll(data) }

    );
  }
  _insertMessageAndScroll(data) {
    this.element.insertAdjacentHTML("beforeend", data)
    this.element.scrollTo(0, this.element.scrollHeight)
  }
  disconnect() {
    this.channel.unsubscribe()
  }
}
