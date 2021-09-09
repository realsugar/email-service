defmodule EmailService.EmailTest do
  use EmailService.ConnCase, async: true
  use Bamboo.Test

  test "create/1 takes sender email from configuration" do
    params = %{
      to: "recipient@server.com",
      subject: "Welcome",
      html: "<h1>Hello</h1>"
    }

    email = EmailService.Email.create(params)

    assert email.from == {"Email Service", "noreply@email.service"}
  end

  test "create/1 puts attachments" do
    tmp_file =
      System.tmp_dir!()
      |> Path.join("file")

    File.write!(tmp_file, "content")

    attachment = %{
      path: tmp_file,
      filename: "dummy"
    }

    email = EmailService.Email.create(%{
      to: "recipient@server.com",
      attachments: [attachment]
    })

    assert [%Bamboo.Attachment{filename: "dummy", data: "content", path: ^tmp_file}] = email.attachments
  end
end
