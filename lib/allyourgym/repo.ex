defmodule Allyourgym.Repo do
  use Ecto.Repo,
    otp_app: :allyourgym,
    adapter: Ecto.Adapters.Postgres
end
