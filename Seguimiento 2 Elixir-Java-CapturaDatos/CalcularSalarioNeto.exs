defmodule CalculoSalarioNeto do
    @moduledoc """
  Módulo para calcular un salario neto de cada empleado.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 19/08/2025
  - licencia: GNU GPL v3
  """
  # ------------------------------
  # Función principal
  # ------------------------------
  def main do
    # Pedir nombre del empleado
    nombre =
      "Nombre del Empleado: "
      |> Util.ingresar_java(:texto)

    # Pedir horas trabajadas (se convierte a entero)
    horas_trabajadas =
      "Horas Trabajadas: "
      |> Util.ingresar_java(:texto)
      |> String.to_integer()

    # Pedir valor por hora (se convierte a entero)
    valor_por_hora =
      "Valor Por Hora: "
      |> Util.ingresar_java(:texto)
      |> String.to_integer()

    # Calcular salario neto
    salario =
      calcular_salario_neto(horas_trabajadas, valor_por_hora)
      |> to_string()

    # Mostrar mensaje final al usuario
    "Empleado #{nombre} su salario neto es: #{salario}"
    |> Util.mostrar_mensaje_java()
  end

  # ------------------------------
  # Función para calcular salario neto
  # ------------------------------
  def calcular_salario_neto(horas_trabajadas, valor_por_hora) do
    limite = 160
    porcentaje_pago_extra = 1.25

    if horas_trabajadas > limite do
      # Cálculo si trabajó horas extras
      horas_extra = horas_trabajadas - limite
      salario_base = limite * valor_por_hora
      pago_extra = horas_extra * valor_por_hora * porcentaje_pago_extra

      salario_base + pago_extra
    else
      # Cálculo si no superó el límite
      horas_trabajadas * valor_por_hora
    end
  end
end

# Ejecutar el programa
CalculoSalarioNeto.main()
