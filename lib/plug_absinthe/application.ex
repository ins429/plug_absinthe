defmodule PlugAbsinthe.Application do
  use Application
  require Logger

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      Plug.Adapters.Cowboy2.child_spec(
        scheme: :http,
        # plug: PlugAbsintheWeb.Router,
        options: [port: 3003],
        dispatch: dispatch
      )
    ]

    Logger.info("Started application")

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  defp dispatch do
    [
      {:_,
       [
         {"/ws", PlugAbsintheWeb.WebSocket, []},
         {:_, Plug.Adapters.Cowboy.Handler, {PlugAbsintheWeb.Router, []}}
       ]}
    ]
  end
end
