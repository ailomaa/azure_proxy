defmodule AzureProxy.AzureService do
  require Req

  defp azure_key, do: Application.fetch_env!(:azure_proxy, :azure_key)
  defp azure_region, do: Application.fetch_env!(:azure_proxy, :azure_region)

  def get_token do
    Req.post!("https://#{azure_region()}.api.cognitive.microsoft.com/sts/v1.0/issueToken",
      headers: %{"Ocp-Apim-Subscription-Key": azure_key()},
      body: ""
    ).body
  end
end
