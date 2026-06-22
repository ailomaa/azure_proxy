defmodule AzureProxyWeb.Router do
  use AzureProxyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug AzureProxyWeb.Plugs.ApiKeyAuth
  end

  scope "/api", AzureProxyWeb do
    pipe_through :api

    get "/token", TokenController, :token
  end
end
