defmodule EasyChat.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EasyChat do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  socket "/ws", EasyChat do
    channel "rooms:*", RoomChannel
  end
end
