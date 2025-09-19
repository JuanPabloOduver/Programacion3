defmodule DescuentoPorCedula do
   @moduledoc """
  Módulo para verificar un descuento por la cedula del cliente.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 13/09/2025
  - licencia: GNU GPL v3
  """
  # ------------------------------
  # Función principal.
  # ------------------------------
  def main do
    cedula =
      "Ingrese su cedula: "
      |> Util.ingresar(:entero)

    verificar_descuento(cedula)
  end

  # ------------------------------
  # Función para calcular el descuento.
  # ------------------------------

  def verificar_descuento (cedula) do
    if rem(cedula, 1991) == 0 do
      IO.puts("Aplica para el descuento") # Si la cedula es divisible entre 1991
    else
      IO.puts("No aplica para el descuento")
    end
  end

end

# Ejecuta el programa.
DescuentoPorCedula.main()
