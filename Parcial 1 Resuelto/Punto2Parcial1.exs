defmodule Cine do
  @moduledoc """
  Modulo para reservar sillas en una sala de cine, actualizando el mapa de salas.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 17/09/2025
  - licencia: GNU GPL v3
  """

  # ------------------------------
  # Función de reservar sillas
  # ------------------------------
  def reservar_sillas(mapa_salas, numero_sala, sillas_solicitadas) do
    case Map.get(mapa_salas, numero_sala) do
      nil ->
        IO.puts("Error: La sala no existe.")
        mapa_salas

      sillas_disponibles when sillas_solicitadas > sillas_disponibles or sillas_solicitadas <= 0 ->
        IO.puts("Error: Cantidad de sillas inválida o insuficiente ")
        mapa_salas

      sillas_disponibles ->
        nuevas_sillas = sillas_disponibles - sillas_solicitadas
        nuevo_mapa = Map.put(mapa_salas, numero_sala, nuevas_sillas)
        IO.puts("Reserva exitosa, #{sillas_solicitadas} sillas reservadas en la sala #{numero_sala}.")
        nuevo_mapa
    end
  end
end


salas_inicial = %{
  1 => 20,
  2 => 35,
  3 => 50
}


IO.puts("=== Estado inicial de las salas ===")
IO.inspect(salas_inicial)

IO.puts("\n=== Reservar 5 sillas en la sala 1 ===")
salas_despues_reserva = Cine.reservar_sillas(salas_inicial, 12, 21)
IO.inspect(salas_despues_reserva)
