defmodule Fine.FetchData.Fixer do
  @fix_api_base "http://data.fixer.io/api/latest"

  def setup_access_key(url) do
    token = Application.get_env(:fine, :token_fixer)
    "#{url}?access_key=#{token}"
  end

  def setup_symbol(url, base, target) do
    "#{url}&base=#{base}&symbols=#{target}"
  end

  def fill_url(base, target) do
    @fix_api_base
    |> setup_access_key
    |> setup_symbol(base, target)
  end

  def fetch(base, target) do
    fill_url(base, target)
    |> HTTPoison.get
    |> IO.inspect
  end
end
