defmodule Pomodex.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pomodex.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        uname: "xxx", 
        email: "xxx@yyy.com", 
        hashed_password: Pomodex.Auth.User.pwd_hash("123456789012")
      })
      |> Pomodex.Accounts.create_user()

    user
  end
end
