defmodule Matrushka do
  # Caso base: lista vacía
  def recorrer([]), do: []
  # Caso base: lista con un solo elemento
  def recorrer([x]), do: [x]

  # Divide y vencerás con split
  def recorrer(lista) do
    mitad = div(length(lista), 2)
    {izq, der} = Enum.split(lista, mitad)
    recorrer(izq) ++ recorrer(der)
  end
end

IO.inspect Matrushka.recorrer([1, 2, 3, 4, 5])
