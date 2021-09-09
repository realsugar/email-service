defmodule EmailServiceTest do
  use EmailService.ConnCase, async: true
  use Bamboo.Test

  test "send/1 delivers email" do
    params = %{
      to: "recipient@server.com",
      subject: "Welcome",
      html: "<h1>Hello</h1>"
    }

    assert :ok == EmailService.send(params)

    assert_email_delivered_with(to: [nil: "recipient@server.com"])
  end
end
