defmodule EasyChat.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", message, socket) do
    send(self, {:after_join, message})

    {:ok, socket}
  end

  def join("rooms:" <> _private_room_id, _message, socket) do
    :ignore
  end

  def handle_in("new_msg", message, socket) do
    broadcast!(socket, "new_msg", %{username: message["username"], body: message["body"]})
    {:noreply, socket}
  end

  def handle_info({:after_join, message}, socket) do
    broadcast!(socket, "user_entered", %{username: message["username"]})
    push(socket, "join", %{status: "connected"})
    {:noreply, socket}
  end
end
