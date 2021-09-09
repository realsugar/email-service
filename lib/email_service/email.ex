defmodule EmailService.Email do
  @moduledoc """
  Compose emails.
  """

  import Bamboo.Email

  @email_template_path "priv/templates/email.html.eex"

  @doc """
  Composes email from given parameters.

  See `EmailService` for more info on `params`.
  """
  def create(%{} = params) do
    new_email()
    |> from(sender())
    |> to(params[:to])
    |> cc(params[:cc])
    |> bcc(params[:bcc])
    |> subject(params[:subject])
    |> put_html(params[:html])
    |> text_body(params[:text])
    |> put_attachments(params[:attachments])
  end

  defp sender do
    :email_service
    |> Application.get_env(EmailService.Mailer)
    |> Keyword.get(:from)
  end

  defp put_html(email, body) do
    html =
      :email_service
      |> Application.app_dir()
      |> Path.join(@email_template_path)
      |> EEx.eval_file(body: body)

    # FIXME: sanitize

    email
    |> html_body(html)
  end

  defp put_attachments(email, attachments)

  defp put_attachments(email, nil), do: email
  defp put_attachments(email, attachments) when is_list(attachments) do
    Enum.reduce(attachments, email, fn attachment, email -> 
      put_attachment(email, Bamboo.Attachment.new(attachment[:path],
        content_type: attachment[:content_type],
        filename: attachment[:filename],
        data: attachment[:data]
      ))
    end)
  end
end
