defmodule AzureProxyWeb.TokenController do
  use AzureProxyWeb, :controller
  alias AzureProxy.AzureService

  require Logger

  def token(conn, _params) do
    token = AzureService.get_token()
    text(conn, token)
  end
end
