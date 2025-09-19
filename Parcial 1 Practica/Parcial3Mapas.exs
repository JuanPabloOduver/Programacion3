# Una droguería necesita calcular el desempeño de ventas de un producto en un mes. Se tiene un mapa
# con los días del mes como claves y las ventas de ese día como valores.

# Crea una función analizar_ventas/1 que reciba un mapa con las ventas diarias.
# La función debe retornar una tupla con:
# (total_ventas, promedio_diario, dia_mejor_venta)
# Usa listas y Enum para calcular el total y el promedio de ventas.
# Usa case para manejar el caso en que no haya ventas (%{}), devolviendo {0, 0, "No hay datos"}.

defmodule Drogueria do
  def analizar_ventas(ventas) do
    case map_size(ventas) do
      0 ->
        {0, 0, "No hay ventas"} # Si no hay nada de ventas

      _ ->
        # Se convierte el mapa a una lista de ventas
        lista = Enum.map(ventas, fn {dia, monto} -> {dia, monto} end)

        # Total de ventas
        total = Enum.reduce(lista, 0, fn{_dia, monto}, acc -> acc + monto end)

        # Promedio por dia
        promedio = total/length(lista)

        # Mejor dia :D
        {dia_mejor, _monto_mejor} = Enum.reduce(lista, {"",0}, fn {dia, monto}, {dia_acc, monto_acc} ->
          if monto > monto_acc do
            {dia, monto}
          else
            {dia_acc, monto_acc}
          end
        end)

        {total, promedio, dia_mejor} # Devuelve la lista que pide

    end
  end
end


ventas = %{
  "Lunes" => 10,
  "Martes" => 5,
  "Miércoles" => 2,
  "Jueves" => 3
}

IO.inspect(Drogueria.analizar_ventas(ventas))
