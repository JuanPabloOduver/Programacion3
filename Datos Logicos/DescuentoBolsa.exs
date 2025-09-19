defmodule DescuentoBolsa do
   @moduledoc """
  Módulo para verificar un descuento por el tipo de bolsa del cliente.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 13/09/2025
  - licencia: GNU GPL v3
  """
  # ------------------------------
  # Función principal.
  # ------------------------------
  def main do
    bolsa =
      "Ingrese el tipo de bolsa: "
      |> Util.ingresar(:texto)

    verificar_descuento(bolsa)
  end

  # ------------------------------
  # Función para calcular el descuento.
  # ------------------------------

  def verificar_descuento (bolsa) do
    case bolsa do

      # Si la bolsa es de plastico
      "plastico" ->
        IO.puts("Su descuento es del 2%")

      # Si la bolsa es biodegradable
      "biodegradable" ->
      IO.puts("Su descuento es del 12%")

      # Si la bolsa es reutilizable
      "reutilizable" ->
      IO.puts("Su descuento es del 17%")

      _ -> # Si no es ninguna opcion.
        IO.puts("No aplica descuento")
    end
  end
end

# Ejecuta el programa.
DescuentoBolsa.main()
