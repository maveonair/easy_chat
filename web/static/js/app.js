import {Socket} from "phoenix"

class App {
  static init() {
    let messageContainer = $("#messages")
    let messageInput     = $("#message-input")
    let username         = $("#username")

    let socket = new Socket("/ws")
    socket.connect()

    socket.join("rooms:lobby", {"username" : username.val()}).receive("ok", channel => {
      console.log("Welcome to Easy Chat") 

      channel.on("user_entered", message => {
        messageContainer.append(`<br/><i>[${message.username} entered]</i>`)
      })

      messageInput.off("keypress").on("keypress", event => {
        if (event.keyCode == 13) {
          channel.push("new_msg", { username: username.val(), body: messageInput.val()})
          messageInput.val("")
        }
      })

      channel.on("new_msg", message => {
        console.log(message)
        messageContainer.append(`<br/>[@${message.username}] ${message.body}`)
      })
    })
  }
}

$(() => App.init())

export default App
