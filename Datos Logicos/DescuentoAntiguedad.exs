defmodule DescuentoAntiguedad do
   @moduledoc """
  Módulo para verificar un descuento por la antiguedad del cliente.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 13/09/2025
  - licencia: GNU GPL v3
  """
  # ------------------------------
  # Función principal.
  # ------------------------------
  def main do
  anios =
    "Ingrese los anios de antiguedad: "
    |> Util.ingresar(:entero)

    verificar_descuento(anios)
  end

  # ------------------------------
  # Función para calcular el descuento.
  # ------------------------------

  def verificar_descuento(anios) do
    cond do
      anios >= 1 and anios <= 2 ->  # Si es de 1 a 2 anios
        IO.puts("Su descuento es del 10%")

      anios >= 3 and anios <= 6 -> # Si es de 3 a 6 anios
        IO.puts("Su descuento es del 14%")

      anios > 6 -> # Si es mas de 6 anios
        IO.puts("Su descuento es del 17%")

      true -> # Si no es ninguna opcion
        IO.puts("No aplica descuento")
    end
  end
end

# Ejecuta el programa.
DescuentoAntiguedad.main()
