defmodule Pomodex.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pomodex.Users` context.
  """

  @doc """
  Generate a interval.
  """
  def interval_fixture(attrs \\ %{}) do
    {:ok, interval} =
      attrs
      |> Enum.into(%{
        desc: "some desc",
        hotkey: "some hotkey",
        name: "some name",
        position: 42,
        seconds: 42
      })
      |> Pomodex.Users.create_interval()

    interval
  end

  @doc """
  Generate a period.
  """
  def period_fixture(attrs \\ %{}) do
    {:ok, period} =
      attrs
      |> Enum.into(%{
        end_at: ~N[2022-01-05 05:22:00],
        note: "some note",
        seconds: 42,
        start_at: ~N[2022-01-05 05:22:00],
        status: "some status",
        tags: "some tags",
        title: "some title"
      })
      |> Pomodex.Users.create_period()

    period
  end
end
