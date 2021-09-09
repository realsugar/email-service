defmodule EmailService.Mixfile do
  use Mix.Project

  def project do
    [
      app: :email_service,
      version: "0.0.3",
      build_path: "_build",
      config_path: "config/config.exs",
      deps_path: "deps",
      lockfile: "mix.lock",
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: preferred_cli_env(),
      aliases: aliases(),
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      mod: {EmailService.Application, []},
      extra_applications: [:logger, :runtime_tools, :bamboo, :bamboo_smtp]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:excoveralls, "~> 0.14.2", only: :test},
      {:ex_doc, "~> 0.25", only: :dev, runtime: false},
      {:phoenix, "~> 1.5.12"},
      {:plug_cowboy, "~> 2.0"},
      {:plug, "~> 1.7"},
      {:jason, "~> 1.1"},
      {:bamboo, "~> 2.2"},
      {:bamboo_smtp, "~> 4.1"}
    ]
  end

  defp aliases do
    []
  end

  defp preferred_cli_env do
    [
      coveralls: :test,
      "coveralls.detail": :test,
      "coveralls.html": :test
    ]
  end

  defp docs do
    [
      extras: [
        "README.md": [filename: "readme", title: "Readme"],
      ],
      main: "readme"
    ]
  end
end
