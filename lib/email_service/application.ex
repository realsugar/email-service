defmodule EmailService.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      EmailService.Endpoint,
    ]

    opts = [strategy: :one_for_one, name: EmailService.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    EmailService.Endpoint.config_change(changed, removed)
    :ok
  end
end
