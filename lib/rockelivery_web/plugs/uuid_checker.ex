defmodule RockeliveryWeb.Plugs.UUIDChecker do
  import Plug.Conn

  alias Ecto.UUID
  alias Plug.Conn

  def init(options), do: options

  def call(%Conn{params: %{"id" => id}} = conn, opts) do
    case UUID.cast(id) do
      :error -> render_error(conn, opts)
      {:ok, _uuid} -> conn
    end
  end

  defp render_error(conn, _opts) do
    body = Jason.encode!(%{message: "Invalid UUID!."})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, body)
    |> halt()
  end
end
