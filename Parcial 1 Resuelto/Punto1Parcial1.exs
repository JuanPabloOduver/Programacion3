# Se asume que el módulo Util está disponible.
# require Util

defmodule Paqueteria do
  @moduledoc """
  Módulo para calcular la tarifa de envío de un paquete.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 17/09/2025
  - licencia: GNU GPL v3
  """

  # ------------------------------
  # Función principal de ejecución
  # ------------------------------
  def main do
    # Pedir el peso del paquete.
    peso = Util.ingresar("Ingrese el peso del paquete (kg): ", :entero)

    # Pedir el tipo de cliente.
    IO.puts("Seleccione el tipo de cliente:\n1. Corporativo\n2. Estudiante\n3. Regular")
    tipo_cliente_num = Util.ingresar("Opción: ", :entero)

    # Pedir el tipo de servicio.
    IO.puts("Seleccione el tipo de servicio:\n1. Express\n2. Estandar")
    tipo_servicio_num = Util.ingresar("Opción: ", :entero)

    # Convertir las opciones numéricas a átomos.
    tipo_cliente =
      case tipo_cliente_num do
        1 -> :corporativo
        2 -> :estudiante
        _ -> :regular
      end

    tipo_servicio =
      case tipo_servicio_num do
        1 -> :express
        _ -> :estandar
      end

    # Calcular la tarifa.
    calcular_tarifa(peso, tipo_cliente, tipo_servicio)
  end

  # ------------------------------
  # Función de cálculo
  # ------------------------------
  def calcular_tarifa(peso, tipo_cliente, tipo_servicio) when peso > 0 do
    base = determinar_tarifa_base(peso)
    porcentaje_descuento = determinar_descuento(tipo_cliente)
    porcentaje_recargo = determinar_recargo(tipo_servicio)

    valor_descuento = base * porcentaje_descuento
    subtotal = base - valor_descuento
    valor_recargo = subtotal * porcentaje_recargo
    total = subtotal - valor_recargo

    mostrar_desglose(base, valor_descuento, subtotal, valor_recargo, total)
  end

  # Caso para cuando el peso no es válido.
  def calcular_tarifa(peso, _, _) when peso <= 0 do
    Util.mostrar_error("Error: El peso debe ser un número mayor a 0.")
  end

  # --- Funciones para determinar la tarifa final
  defp determinar_tarifa_base(peso) do
    cond do
      peso <= 5 -> 8_000
      peso <= 10 -> 12_000
      true -> 20_000
    end
  end
  defp determinar_descuento(:corporativo), do: 0.15
  defp determinar_descuento(:estudiante), do: 0.10
  defp determinar_descuento(:regular), do: 0.0
  defp determinar_recargo(:express), do: 0.25
  defp determinar_recargo(:estandar), do: 0.0
  defp mostrar_desglose(base, descuento, subtotal, recargo, total) do
    IO.puts("\n--- Desglose del Envío ---")
    IO.puts("Tarifa Base:   $#{base}")
    IO.puts("Descuento:     -$#{descuento}")
    IO.puts("Subtotal:      $#{subtotal}")
    IO.puts("Descuento extra: -#{recargo}")
    IO.puts("--------------------------")
    IO.puts("Total a Pagar: $#{total}")
  end
end

# Ejecuta el programa.
Paqueteria.main()
