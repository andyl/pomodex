defmodule PomodexWeb.PeriodLive.Index do
  use PomodexWeb, :live_view

  alias Pomodex.Users
  alias Pomodex.Users.Period

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :period_collection, list_period())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Period")
    |> assign(:period, Users.get_period!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Period")
    |> assign(:period, %Period{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Period")
    |> assign(:period, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    period = Users.get_period!(id)
    {:ok, _} = Users.delete_period(period)

    {:noreply, assign(socket, :period_collection, list_period())}
  end

  defp list_period do
    Users.list_period()
  end
end
