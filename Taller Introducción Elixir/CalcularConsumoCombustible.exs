defmodule CalcularConsumoCombustible do
  @moduledoc """
  Módulo para calcular consumo de combustible.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 06/09/2025
  - licencia: GNU GPL v3
  """
  # ------------------------------
  # Función principal
  # ------------------------------

  def main do

    # Pedir el nombre del conductor.
    nombre =
      "Nombre del Conductor: "
      |> Util.ingresar(:texto)

    # Pedir la distancia recorrida en km.
    distancia =
      "Distancia recorrida en Kilómetros: "
      |> Util.ingresar(:real)

    # Pedir la cantidad de combustible consumido en Litros.
    combustible_consumido =
      "Cantidad de combustible consumido en Litros: "
      |> Util.ingresar(:real)

    # Calculara rendimiento del vehiculo
    rendimiento_vehiculo =
      calcular_rendimiento_vehiculo(distancia, combustible_consumido)
    "Cliente #{nombre}, el rendimiento de su vehículo es de #{rendimiento_vehiculo} km/L"
    |> Util.mostrar_mensaje()

  end

  # ------------------------------
  # Función para calcular el rendimiento del vehiculo.
  # ------------------------------

  def calcular_rendimiento_vehiculo(distancia, combustible_consumido) do
    distancia / combustible_consumido
      |>Float.round(2) # Hace que solo arroje 2 decimales.
  end
end

# Ejecuta el programa
CalcularConsumoCombustible.main()
