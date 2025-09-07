defmodule InventarioLibreria do
  @moduledoc """
  Módulo para calcular el valor total del inventario.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 06/09/2025
  - licencia: GNU GPL v3
  """
  # ------------------------------
  # Función principal.
  # ------------------------------

  def main do

    # Pedir el titulo del libro.
    titulo_libro =
      "Ingrese el título del libro = "
      |> Util.ingresar(:texto)

    # Pedir la cantidad de libros.
    cantidad_libro =
      "Ingrese la cantidad de unidades disponibles del libro = "
      |> Util.ingresar(:entero)

    # Pedir el precio del libro.
    precio_libro =
      "Ingrese el precio del libro = "
      |> Util.ingresar(:real)

    # Calcular el valor del inventario.
    valor_inventario =
      calcular_valor_inventario(cantidad_libro, precio_libro)
    "El libro #{titulo_libro} tiene un valor total de inventario de #{valor_inventario}"
    |> Util.mostrar_mensaje()

  end

  # ------------------------------
  # Función para calcular el valor del inventario.
  # ------------------------------

  def calcular_valor_inventario(cantidad_libro, precio_libro) do
    cantidad_libro * precio_libro
    |>Float.round(3)
  end
end

# Ejecuta el programa.
InventarioLibreria.main()
