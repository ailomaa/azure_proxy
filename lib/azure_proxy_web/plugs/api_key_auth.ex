defmodule AzureProxyWeb.Plugs.ApiKeyAuth do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    api_key = Application.fetch_env!(:azure_proxy, :api_key)

    with ["Bearer " <> key] <- get_req_header(conn, "authorization"),
         true <- key == api_key do
      conn
    else
      _ ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(401, ~s({"error":"unauthorized"}))
        |> halt()
    end
  end
end
