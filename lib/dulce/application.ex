defmodule Dulce.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DulceWeb.Telemetry,
      Dulce.Repo,
      {DNSCluster, query: Application.get_env(:dulce, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Dulce.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Dulce.Finch},
      # Start a worker by calling: Dulce.Worker.start_link(arg)
      # {Dulce.Worker, arg},
      # Start to serve requests, typically the last entry
      DulceWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dulce.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DulceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
