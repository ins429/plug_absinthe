defmodule PlugAbsintheWeb.Schema.Types do
  use Absinthe.Schema.Notation

  object :obj do
    field(:id, :id)
    field(:field, :string)
  end
end
