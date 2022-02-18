# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pomodex.Repo.insert!(%Pomodex.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pomodex.Auth
alias Pomodex.Users 
alias Pomodex.Repo

Repo.delete_all(Auth.User)
Repo.delete_all(Users.Interval)
Repo.delete_all(Users.Period)

Repo.insert(%Auth.User{
  uname: "aaa",
  email: "aaa@aaa.com",
  hashed_password: Auth.User.pwd_hash("123456789012"),
  }
)

Repo.insert(%Auth.User{
  uname: "bbb",
  email: "bbb@bbb.com",
  hashed_password: Auth.User.pwd_hash("123456789012"),
  }
)

Repo.insert(%Auth.User{
  uname: "ccc",
  email: "ccc@ccc.com",
  hashed_password: Auth.User.pwd_hash("123456789012")
  }
)
