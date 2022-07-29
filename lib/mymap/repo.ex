defmodule Mymap.Repo do
  use Ecto.Repo,
    otp_app: :mymap,
    adapter: Ecto.Adapters.Postgres
end
