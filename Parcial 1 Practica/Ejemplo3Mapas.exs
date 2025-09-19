defmodule Restaurante do
  def analizar_ingresos(ingresos) do
    if map_size(ingresos) == 0 do
      {0, 0, "No hay datos"}
    else
      # calcular total del mes
      total_mes = Enum.reduce(ingresos, 0, fn {_dia, turnos}, acc ->
        acc + Enum.reduce(turnos, 0, fn {_turno, monto}, acc2 -> acc2 + monto end)
      end)

      # promedio por día
      promedio = total_mes / map_size(ingresos)

      # encontrar el día con más ventas
      {dia_mejor, _monto_mejor} =
        Enum.reduce(ingresos, {"", 0}, fn {dia, turnos}, {dia_acc, monto_acc} ->
          suma_turnos = Enum.reduce(turnos, 0, fn {_t, m}, acc3 -> acc3 + m end)
          if suma_turnos > monto_acc do
            {dia, suma_turnos}
          else
            {dia_acc, monto_acc}
          end
        end)

      # encontrar el mejor turno de ese día
      turnos_dia = Map.get(ingresos, dia_mejor) |> Enum.to_list()
      {turno_mejor, monto_turno} =
        Enum.reduce(turnos_dia, {:ninguno, 0}, fn {turno, monto}, {t_acc, m_acc} ->
          if monto > m_acc do
            {turno, monto}
          else
            {t_acc, m_acc}
          end
        end)

      {total_mes, promedio, {dia_mejor, turno_mejor, monto_turno}}
    end
  end
end

# Ejemplo:
ing = %{
  "Lunes" => %{mañana: 120.5, tarde: 200.0, noche: 80.0},
  "Martes" => %{mañana: 90.0, tarde: 140.0, noche: 60.0},
  "Miércoles" => %{mañana: 100.0, tarde: 120.0, noche: 50.0}
}

IO.inspect(Restaurante.analizar_ingresos(ing))
# => {910.5, 303.5, {"Lunes", :tarde, 200.0}}
