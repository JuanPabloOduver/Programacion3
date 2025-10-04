defmodule Quiz do
  def main do
    lista = [1, 2, 3, 4, 5]
    IO.puts mayor(lista)
  end

  def mayor([]), do: "ok"
  def mayor([x]), do: x

  def mayor([x | xs]) do
    y = mayor(xs)
    if x > y, do: x, else: y
  end
end

Quiz.main()
