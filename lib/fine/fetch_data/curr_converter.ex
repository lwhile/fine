defmodule Fine.FetchData.CurrConverter do
  @api_base "http://free.currencyconverterapi.com/api"

  def fill_url(from, to) do
    path = "/v5/convert"
    q = "?q=#{from}_#{to}"
    "#{@api_base}#{path}#{q}"
  end

  def extract_value(data) do
    # IO.inspect
    elem(Enum.at(elem(Enum.at(elem(Enum.at(data, 1),1),0),1),1),1)
    # value = elem(result,0)
    # IO.inspect value
    # IO.inspect Enum.at(data, 1)
  end

  def fetch(from, to) do
    fill_url(from, to)
    |> HTTPoison.get
    |> Fine.Decode.decode_response
    |> extract_value
  end
end
