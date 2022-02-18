defmodule PomodexWeb.PageController do
  use PomodexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
