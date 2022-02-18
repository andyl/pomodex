defmodule PomodexWeb.IntervalLive.FormComponent do
  use PomodexWeb, :live_component

  alias Pomodex.Users

  @impl true
  def update(%{interval: interval} = assigns, socket) do
    changeset = Users.change_interval(interval)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"interval" => interval_params}, socket) do
    changeset =
      socket.assigns.interval
      |> Users.change_interval(interval_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"interval" => interval_params}, socket) do
    save_interval(socket, socket.assigns.action, interval_params)
  end

  defp save_interval(socket, :edit, interval_params) do
    case Users.update_interval(socket.assigns.interval, interval_params) do
      {:ok, _interval} ->
        {:noreply,
         socket
         |> put_flash(:info, "Interval updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_interval(socket, :new, interval_params) do
    case Users.create_interval(interval_params) do
      {:ok, _interval} ->
        {:noreply,
         socket
         |> put_flash(:info, "Interval created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
