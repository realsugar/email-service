use Mix.Config

config :email_service, EmailService.Mailer,
  adapter: Bamboo.LocalAdapter,
  from: {
    "[dev] Email Service",
    "noreply@domain.com"
  }

config :email_service, EmailService.Endpoint,
  url: [host: "localhost"],
  http: [port: 4040],
  debug_errors: true,
  code_reloader: false,
  check_origin: false
