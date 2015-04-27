defmodule EasyChat.PageControllerTest do
  use EasyChat.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert conn.resp_body =~ "Welcome to Phoenix!"
  end
end
