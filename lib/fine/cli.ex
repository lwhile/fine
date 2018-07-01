defmodule Fine.Cli do

  def parse_argv(argv) do
    parse = OptionParser.parse(argv, [switches: [help: :boolean], aliases: [h: :help]])
    case parse do
      { [help: true], _ , _ }
      -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage: fine <base currency> <target currency>
    """
  end

  def main(argv \\ []) do
    argv
    |> parse_argv
    |> process
  end

end
