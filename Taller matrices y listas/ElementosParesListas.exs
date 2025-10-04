defmodule ElementosParesListas do
  def contar([]), do: 0

  def contar([cabeza | cola]) do
    if rem(cabeza, 2) == 0 do
      1 + contar(cola)
    else
      contar(cola)
    end
  end
end

lista = [1, 2, 3, 4, 5, 6, 7, 8]
IO.puts("Cantidad de pares: #{ElementosParesListas.contar(lista)}")
