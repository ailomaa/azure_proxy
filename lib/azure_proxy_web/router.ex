defmodule AzureProxyWeb.Router do
  use AzureProxyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AzureProxyWeb do
    pipe_through :api

    get "/token", TokenController, :token
  end
end
