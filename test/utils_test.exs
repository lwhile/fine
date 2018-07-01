defmodule UtilsTest do
  use ExUnit.Case

  import Fine.Utils

  test "check the currency is supported" do
    assert is_supported_currency("usd") == true
    assert is_supported_currency("cny") == true

    assert is_supported_currency("abc") == false
  end
end
