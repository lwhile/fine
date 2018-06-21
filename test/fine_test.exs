defmodule FineTest do
  use ExUnit.Case
  doctest Fine

  test "greets the world" do
    assert Fine.hello() == :world
  end
end
