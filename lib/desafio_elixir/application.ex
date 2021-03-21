defmodule DesafioElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      DesafioElixir.Repo,
      # Start the Telemetry supervisor
      DesafioElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DesafioElixir.PubSub},
      # Start the Endpoint (http/https)
      DesafioElixirWeb.Endpoint
      # Start a worker by calling: DesafioElixir.Worker.start_link(arg)
      # {DesafioElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DesafioElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    DesafioElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
