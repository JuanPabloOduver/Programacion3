defmodule LongitudPalabra do
  @moduledoc """
  Módulo para calcular la longitud de una palabra ingresada por el usuario.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 26/08/2025
  - licencia: GNU GPL v3
  """

  # ------------------------------
  # Función principal del programa
  # ------------------------------
  def main do
    "Ingrese palabra: "
    |> Util.ingresar_java(:texto)
    |> String.length()
    |> to_string()
    |> Util.mostrar_mensaje_java()
  end
end

# Ejecutar el programa
LongitudPalabra.main()
