defmodule EntradaReales do
  @moduledoc """
  Módulo para calcular el descuento y valor final de un producto.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 26/08/2025
  - licencia: GNU GPL v3
  """

  # Función principal
  def main do
    valor_producto = "Ingrese el valor del producto: "
    |> Util.ingresar(:entero)

    porcentaje_descuento = "Ingrese el porcentaje de descuento: "
    |> Util.ingresar(:real)

    valor_descuento = calcular_valor_descuento(valor_producto, porcentaje_descuento)
    valor_final = calcular_valor_final(valor_producto, valor_descuento)

    generar_mensaje(valor_descuento, valor_final)
    |> Util.mostrar_mensaje()
  end

  # Función privada para calcular el valor del descuento
  defp calcular_valor_descuento(valor_producto, porcentaje_descuento) do
    valor_producto * porcentaje_descuento
  end

  # Función privada para calcular el valor final
  defp calcular_valor_final(valor_producto, valor_descuento) do
    valor_producto - valor_descuento
  end

  # Función privada para generar el mensaje final
  defp generar_mensaje(valor_descuento, valor_final) do
    valor_descuento = valor_descuento |> Float.round(1)
    valor_final = valor_final |> Float.round(1)

    "Valor de descuento de $#{valor_descuento} y el valor final $#{valor_final}"
  end
end

# Ejecución del programa
EntradaReales.main()
