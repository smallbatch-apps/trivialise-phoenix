defmodule Trivialise.Repo do
  use Ecto.Repo,
    otp_app: :trivialise,
    adapter: Ecto.Adapters.Postgres
end
