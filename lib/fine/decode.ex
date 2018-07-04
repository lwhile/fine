defmodule Fine.Decode do
  def decode_response({:ok, response}) do
    # IO.inspect response.db
    :jsx.decode(response.body)
  end
end
