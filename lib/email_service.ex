defmodule EmailService do
  @moduledoc """
  Sends emails in background.

  ## Usage

      params = %{
        to: "recipient@server.com",
        subject: "Hello",
        html: "<p>Welcome!</p>"
      }
      EmailService.send(params)
      iex> :ok

  ### Parameters

      :to           - String or list of strings. Required
      :cc           - String or list of strings
      :bcc          - String or list of strings
      :subject      - String. Required
      :html         - String. Required
      :text         - String
      :attachments  - List of attachments (see below)

  ### Attachment

      %{
        content_type: nil | String.t(), # "image/png"
        data: nil | binary(),
        filename: nil | String.t(),
        path: nil | String.t() # on file system
      }

  """

  alias EmailService.{Email, Mailer}

  @doc """
  Send email in background.
  """
  def send(%{} = params) do
    params
    |> Email.create()
    |> Mailer.deliver_later()

    :ok
  end
end
