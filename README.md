# Email Service

Sends emails in background.


## Development

* `mix deps.get`
* `iex -S mix phx.server`
* Open [localhost:4040](http://localhost:4040)


## Documentation

* `mix docs`
* Open `doc/index.html`


## Dependencies

* [Bamboo](https://hexdocs.pm/bamboo)
* [Bamboo SMTP](https://hexdocs.pm/bamboo_smtp)


## Configuration

```elixir
config :email_service, EmailService.Mailer,
  adapter: Bamboo.SMTPAdapter,
  from: {
    "Your Name",
    "email@domain.com"
  },
  server: "your-smtp.host.com",
  hostname: "your-smtp.host.com",
  port: "587",
  username: "your-smtp-user",
  password: "your-smtp-password",
  tls: :always,
  allowed_tls_versions: [:tlsv1, :"tlsv1.1", :"tlsv1.2"],
  ssl: false,
  retries: 1,
  # can be `true`
  no_mx_lookups: false
```
