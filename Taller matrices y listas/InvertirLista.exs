defmodule InvertirLista do
  def invertir([]), do: []
  def invertir([cabeza | cola]), do: invertir(cola) ++ [cabeza]
end

lista = [1, 2, 3, 4, 5]
IO.puts("Lista invertida:")
IO.inspect(InvertirLista.invertir(lista))
