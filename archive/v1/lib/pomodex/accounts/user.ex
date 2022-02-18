defmodule Pomodex.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :uname, :string
    field :email, :string
    field :hashed_password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:uname, :email, :hashed_password])
    |> validate_required([:uname, :email, :hashed_password])
  end
end
