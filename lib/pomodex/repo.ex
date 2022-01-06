defmodule Pomodex.Repo do
  use Ecto.Repo,
    otp_app: :pomodex,
    adapter: Ecto.Adapters.Postgres
end
