defmodule PomodexWeb.PageController do
  use PomodexWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def count(conn, _params) do
    conn
    |> put_layout(false)
    |> put_root_layout(false)
    |> render("count.html")
  end
end
