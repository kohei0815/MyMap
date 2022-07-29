defmodule Mymap.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Mymap.Repo,
      # Start the Telemetry supervisor
      MymapWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Mymap.PubSub},
      # Start the Endpoint (http/https)
      MymapWeb.Endpoint
      # Start a worker by calling: Mymap.Worker.start_link(arg)
      # {Mymap.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mymap.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MymapWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
