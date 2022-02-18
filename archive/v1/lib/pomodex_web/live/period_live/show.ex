defmodule PomodexWeb.PeriodLive.Show do
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
     |> assign(:period, Users.get_period!(id))}
  end

  defp page_title(:show), do: "Show Period"
  defp page_title(:edit), do: "Edit Period"
end
