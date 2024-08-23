defmodule Dulce.Repo do
  use Ecto.Repo,
    otp_app: :dulce,
    adapter: Ecto.Adapters.Postgres
end
