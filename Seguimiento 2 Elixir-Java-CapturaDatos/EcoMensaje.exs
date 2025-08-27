defmodule EcoMensaje do
  @moduledoc """
  Módulo para mostrar un mensaje en eco.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 19/08/2025
  - licencia: GNU GPL v3
  """

  # ------------------------------
  # Función principal del programa
  # ------------------------------
  def main do
    "Ingrese mensaje: "
    |> Util.ingresar_java(:texto)
    |> String.upcase()
    |> Util.mostrar_mensaje()
  end
end

# Ejecutar el programa
EcoMensaje.main()
