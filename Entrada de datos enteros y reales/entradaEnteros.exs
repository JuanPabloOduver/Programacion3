defmodule EntradaEnteros do
  @moduledoc """
  Módulo para calcular la devuelta de una factura.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 26/08/2025
  - licencia: GNU GPL v3
  """

  # Función principal
  def main do
    valor_total = "Ingrese valor total de la factura: "
    |> ingresar(:entero)

    valor_entregado = "Ingrese valor entregado para el pago: "
    |> ingresar(:entero)

    calcular_devuelta(valor_entregado, valor_total)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  # Función privada para ingresar enteros
  defp ingresar(mensaje, :entero) do
    mensaje
    |> Util.ingresar(:texto)
    |> String.to_integer()
  end

  # Función privada para calcular la devuelta
  defp calcular_devuelta(valor_pago, valor_total) do
    valor_pago - valor_total
  end

  # Función privada para generar el mensaje final
  defp generar_mensaje(devuelta) do
    "El valor de devuelta es $ #{devuelta}"
  end
end

# Ejecución del programa
EntradaEnteros.main()
