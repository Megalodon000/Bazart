import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
<<<<<<< HEAD
  static values = { chatroomId: Number }
  static targets = ["messages"]

connect() {
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`);
    console.log("Connected to the chatroom")
    this.channel = createConsumer().subscriptions.create(
        { channel: "ChatroomChannel", id: this.chatroomIdValue },
        { received: data => this.#insertMessageAndScrollDown(data) }, // Add a comma here
        ); // Add a closing parenthesis here
        
}; 

#insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
}

resetForm(event) {
    event.target.reset()
    }; 
    disconnect() {
        console.log("Unsubscribed from the chatroom")
        this.channel.unsubscribe()
      };
} 
=======
  static targets = ["messages"];
  static values = { 
    chatroomId: Number 
  };
  connect() {
    console.log(`Connecting to the actionCable channel with id ${this.chatroomIdValue}`)
    this.channel = createConsumer().subscriptions.create({ channel: "ChatroomChannel", chatroom_id: this.chatroomIdValue },
    { received: (data) => { this.#insertMessage(data) } }
    )
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
>>>>>>> e37754df70e9b768f1c8ce16fa7e90a53f6cb274
