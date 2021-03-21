defmodule DesafioElixir.Repo do
  use Ecto.Repo,
    otp_app: :desafio_elixir,
    adapter: Ecto.Adapters.Postgres
end
