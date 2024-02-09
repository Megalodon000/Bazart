import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"];
  static values = {
    chatroomId: Number
  };
  connect() {
    console.log(`Connecting to the actionCable channel with id ${this.chatroomIdValue}`)
    this.channel = createConsumer().subscriptions.create({ channel: "ChatroomChannel", chatroom_id: this.chatroomIdValue },
    { received: (data) => { this.#insertMessage(data) } }
    )
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    console.log('Connected to the channel');
  }

  disconnect() {
    console.log('Disconnecting from the channel')
    this.channel.unsubscribe()
  }

  resetForm(event) {
    const form = event.target
    form.reset()
  }

  #insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML('beforeend', data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
