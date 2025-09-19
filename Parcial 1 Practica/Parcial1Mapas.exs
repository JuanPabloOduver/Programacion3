defmodule EjemploReduce do
  def main do
  IO.puts(Enum.reduce([2, 4, 6, 8], 2, fn (x, acc) -> x + acc end) |> inspect())
  end
end

EjemploReduce.main()

# Imprime 22

defmodule Tuplas do
  def analizar_tupla({a, b}) when is_integer(a) and is_integer(b), do: a * b
  def analizar_tupla(_), do: "Formato incorrecto"
end

IO.inspect(Tuplas.analizar_tupla({4, 5}))
IO.inspect(Tuplas.analizar_tupla({4, "hola"}))

# Imprime 20 y "Formato Incorrecto"


lista = [1, 2, 3, 4]
resultado = Enum.reduce(lista, 10, fn x, acc -> acc + x end)
IO.inspect(resultado)

# Imprime 20

list = [1, 2, 3]
result = Enum.map(list, fn x -> x * 2 end)
IO.puts(result)

# Error de sintaxis
