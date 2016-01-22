defmodule Plug.AccessLog.Mixfile do
  use Mix.Project

  @url_github "https://github.com/mneudert/plug_accesslog"

  def project do
    [ app:           :plug_accesslog,
      name:          "Plug.AccessLog",
      description:   "Plug for writing access logs",
      package:       package,
      version:       "0.11.0-dev",
      elixir:        "~> 1.0",
      deps:          deps(Mix.env),
      docs:          docs,
      test_coverage: [ tool: ExCoveralls ]]
  end

  def application do
    [ applications: [ :logger, :timex, :tzdata ],
      mod:          { Plug.AccessLog.Application, [] } ]
  end

  def deps(:docs) do
    deps(:prod) ++
      [ { :earmark, "~> 0.2",  optional: true },
        { :ex_doc,  "~> 0.11", optional: true } ]
  end

  def deps(:test) do
    deps(:prod) ++
      [ { :dialyze,     "~> 0.2", optional: true },
        { :excoveralls, "~> 0.4", optional: true } ]
  end

  def deps(_) do
    [ { :timex,  "~> 1.0" },
      { :tzdata, ">= 0.5.1" },

      { :cowboy, "~> 1.0", optional: true },
      { :plug,   "~> 1.0", optional: true } ]
  end

  def docs do
    [ extras:     [ "CHANGELOG.md", "README.md" ],
      main:       "readme",
      source_ref: "master",
      source_url: @url_github ]
  end

  def package do
    %{ files:       [ "CHANGELOG.md", "LICENSE", "mix.exs", "README.md", "lib" ],
       licenses:    [ "Apache 2.0" ],
       links:       %{ "GitHub" => @url_github },
       maintainers: [ "Marc Neudert" ]}
  end
end
