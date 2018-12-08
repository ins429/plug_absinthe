defmodule PlugAbsintheWeb.Router do
  use Plug.Router
  use Plug.Builder

  plug(Plug.Static,
    at: "/",
    from: :plug_absinthe,
    only: ~w(favicon.ico images robots.txt)
  )

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)

  forward("/api",
    to: Absinthe.Plug,
    init_opts: [schema: PlugAbsintheWeb.Schema]
  )

  forward("/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [
      schema: PlugAbsintheWeb.Schema,
      interface: :simple
    ]
  )

  match _ do
    send_resp(conn, 404, "not found")
  end
end
