defmodule SumaObjetivo do
  def existe_combinacion(lista, objetivo), do: buscar(lista, objetivo, 0)

  defp buscar([], objetivo, suma_actual), do: suma_actual == objetivo
  defp buscar([cabeza | cola], objetivo, suma_actual) do
    buscar(cola, objetivo, suma_actual + cabeza) or buscar(cola, objetivo, suma_actual)
  end
end

lista = [2, 4, 6, 9]
objetivo = 10

IO.puts("¿Existe combinación que sume a #{objetivo}?")
IO.inspect(SumaObjetivo.existe_combinacion(lista, objetivo))
