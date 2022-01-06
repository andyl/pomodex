defmodule PomodexWeb.PeriodLive.FormComponent do
  use PomodexWeb, :live_component

  alias Pomodex.Users

  @impl true
  def update(%{period: period} = assigns, socket) do
    changeset = Users.change_period(period)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"period" => period_params}, socket) do
    changeset =
      socket.assigns.period
      |> Users.change_period(period_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"period" => period_params}, socket) do
    save_period(socket, socket.assigns.action, period_params)
  end

  defp save_period(socket, :edit, period_params) do
    case Users.update_period(socket.assigns.period, period_params) do
      {:ok, _period} ->
        {:noreply,
         socket
         |> put_flash(:info, "Period updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_period(socket, :new, period_params) do
    case Users.create_period(period_params) do
      {:ok, _period} ->
        {:noreply,
         socket
         |> put_flash(:info, "Period created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
