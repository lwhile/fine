defmodule Fine.Cli do

  def parse_argv(argv) do
    parse = OptionParser.parse(argv, [switches: [help: :boolean], aliases: [h: :help]])
    # IO.inspect parse
    case parse do
      { [help: true], _ , _ }
      -> :help

      { [base: base, target: target], _, _}
      -> {base, target}
    end
  end

  def process(:help) do
    IO.puts """
    usage: fine <base currency> <target currency>
    """
  end

  def process({base, target}) do
    rate = Fine.FetchData.CurrConverter.fetch(base, target)
    IO.puts "1 #{base} can exchange #{rate} #{target}"
  end

  def main(argv \\ []) do
    argv
    |> parse_argv
    |> process
  end

end
