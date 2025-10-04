defmodule TransponerMatriz do
  def transponer([]), do: []
  def transponer([[] | _]), do: []
  def transponer(matriz) do
    primera_columna = obtener_primera_columna(matriz)
    resto_columnas = obtener_resto_columnas(matriz)
    [primera_columna | transponer(resto_columnas)]
  end

  def obtener_primera_columna([]), do: []
  def obtener_primera_columna([[cabeza | _] | cola]), do: [cabeza | obtener_primera_columna(cola)]

  def obtener_resto_columnas([]), do: []
  def obtener_resto_columnas([[_ | cola] | resto]), do: [cola | obtener_resto_columnas(resto)]
end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

IO.puts("Matriz transpuesta:")
IO.inspect(TransponerMatriz.transponer(matriz))
