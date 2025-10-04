defmodule MayorRecursivo do
  # Manejar lista vacía
  def max_divide([]), do: raise(ArgumentError, "la lista está vacía")

  # Caso base: un solo elemento
  def max_divide([x]), do: x

  # Caso recursivo: lista con 2 o más elementos
  def max_divide(lista) when is_list(lista) and length(lista) > 1 do
    mitad = div(length(lista), 2)
    {izq, der} = Enum.split(lista, mitad)

    max(max_divide(izq), max_divide(der))
  end
end

IO.puts MayorRecursivo.max_divide([1,2,3,4]) # => 4
