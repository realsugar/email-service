defmodule EmailService.Endpoint do
  @moduledoc """
  For development purpose only.
  """
  use Phoenix.Endpoint, otp_app: :email_service

  plug Plug.RequestId
  plug Plug.Logger

  plug Bamboo.SentEmailViewerPlug
end
