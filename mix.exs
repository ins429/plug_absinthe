defmodule PlugAbsinthe.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_absinthe,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PlugAbsinthe.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:absinthe, "~> 1.4.0"},
      {:absinthe_plug, "~> 1.4"},
      {:cors_plug, "~> 2.0"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 2.1.0"}
    ]
  end
end
