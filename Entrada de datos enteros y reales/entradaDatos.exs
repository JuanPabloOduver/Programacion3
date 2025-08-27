defmodule EntradaDatos do
  @moduledoc """
  Módulo para ingresar un nombre y mostrar un mensaje de bienvenida.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 26/08/2025
  - licencia: GNU GPL v3
  """

  # Función principal
  def main do
    "Ingresar nombre a ingresar: "
    |> Util.ingresar(:texto)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  # Función privada para crear el mensaje
  defp generar_mensaje(nombre) do
    "Bienvenido #{nombre} a la empresa Once Ltda"
  end
end

# Ejecución del programa
EntradaDatos.main()
