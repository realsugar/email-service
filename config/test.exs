use Mix.Config

config :logger, level: :warn

config :email_service, EmailService.Mailer,
  adapter: Bamboo.TestAdapter,
  from: {
    "Email Service",
    "noreply@email.service"
  }

config :email_service, EmailService.Endpoint,
  http: [port: 4041],
  server: false
