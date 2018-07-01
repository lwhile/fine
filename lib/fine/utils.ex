defmodule Fine.Utils do
  @is_supported_currency {:usd, :cny}

  def is_supported_currency(currency) do
    curr = String.to_atom(currency)
    Enum.member?(Tuple.to_list(@is_supported_currency), curr)
  end

end
