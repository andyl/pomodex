defmodule PomodexWeb.IntervalLive.Show do
  use PomodexWeb, :live_view

  alias Pomodex.Users

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:interval, Users.get_interval!(id))}
  end

  defp page_title(:show), do: "Show Interval"
  defp page_title(:edit), do: "Edit Interval"
end
