defmodule PomodexWeb.IntervalLive.Index do
  use PomodexWeb, :live_view

  alias Pomodex.Users
  alias Pomodex.Users.Interval

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :intervals, list_intervals())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Interval")
    |> assign(:interval, Users.get_interval!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Interval")
    |> assign(:interval, %Interval{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Intervals")
    |> assign(:interval, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    interval = Users.get_interval!(id)
    {:ok, _} = Users.delete_interval(interval)

    {:noreply, assign(socket, :intervals, list_intervals())}
  end

  defp list_intervals do
    Users.list_intervals()
  end
end
