defmodule EasyChat.PageController do
  use EasyChat.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
