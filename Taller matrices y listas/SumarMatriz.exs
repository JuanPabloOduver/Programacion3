defmodule SumarMatriz do
  def sumar([]), do: 0
  def sumar([fila | resto]), do: sumar_fila(fila) + sumar(resto)

  defp sumar_fila([]), do: 0
  defp sumar_fila([cabeza | cola]), do: cabeza + sumar_fila(cola)
end

matriz = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

IO.puts("Suma total de la matriz: #{SumarMatriz.sumar(matriz)}")
