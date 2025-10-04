defmodule Recursividad do

  def main do
    imprimir(lista)
  end

  def imprimir([]), do: "ok"
  def imprimir([x]), do: IO.puts(x)

  def imprimir([head | tail]) do
    imprimir(tail)
  end

end

Recursividadlistas.main()
