defmodule ConversionTemperatura do
  @moduledoc """
  Módulo para pasar de celsius a farenheit y kelvin.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 06/09/2025
  - licencia: GNU GPL v3
  """
  # ------------------------------
  # Función principal.
  # ------------------------------

  def main do

    # Pedir el nombre.
    nombre =
      "Ingrese su nombre = "
      |> Util.ingresar(:texto)

    # Pedir la temperatura en celsius.
    temperatura_celsius =
      "Ingrese la temperatura en celsius = "
      |> Util.ingresar(:real)

    # Calcular la temperatura farenheit.
    temperatura_farenheit =
      calcular_temperatura_farenheit(temperatura_celsius)

    # Calcular la temperatura kelvin.
    temperatura_kelvin =
      calcular_temperatura_kelvin(temperatura_celsius)

    # Generar el mensaje con las dos temperaturas.
    generar_mensaje(nombre, temperatura_farenheit, temperatura_kelvin)

  end

  # ------------------------------
  # Función para calcular la temperatura farenheit.
  # ------------------------------

  def calcular_temperatura_farenheit(temperatura_celsius) do
    temperatura_celsius * 9/5 + 32 |> Float.round(1)
  end

  # ------------------------------
  # Función para calcular la temperatura kelvin.
  # ------------------------------

  def calcular_temperatura_kelvin(temperatura_celsius) do
    temperatura_celsius + 275.15 |> Float.round(1)
  end

  # ------------------------------
  # Función para generar mensaje.
  # ------------------------------

  def generar_mensaje(nombre, temperatura_farenheit, temperatura_kelvin) do
    "#{nombre}, la temperatura es \n - #{temperatura_farenheit} °F \n - #{temperatura_kelvin}° K "
    |> Util.mostrar_mensaje()
  end
end

# Ejecuta el programa.
ConversionTemperatura.main()
