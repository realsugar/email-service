defmodule EmailService.Mailer do
  @moduledoc false
  use Bamboo.Mailer, otp_app: :email_service
end
