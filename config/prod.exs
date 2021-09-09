use Mix.Config

config :logger, level: :info

config :email_service, EmailService.Endpoint,
  server: false
