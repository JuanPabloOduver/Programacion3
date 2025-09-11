defmodule CalcularSalario do
  @moduledoc """
  Módulo para calcular salario de un empleado.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 06/09/2025
  - licencia: GNU GPL v3
  """

  # ------------------------------
  # Función principal
  # ------------------------------

  def main do
    # Pedir el nombre del empleado.
    nombre =
      "Ingrese el nombre del empleado = "
      |> Util.ingresar(:texto)

    # Pedir el salario del empleado.
    salario =
      "Ingrese el salario del empleado = "
      |> Util.ingresar(:real)

    # Pedir las horas extras que trabajó el empleado.
    horas_extras =
      "Ingrese el numero de horas extras = "
      |> Util.ingresar(:entero)

    # Calcular salario total.
    salario_total =
      calcular_salario_total(salario, horas_extras)

    "El salario total de #{nombre} es $#{salario_total}"
    |> Util.mostrar_mensaje()
  end

  # ------------------------------
  # Función para calcular el salario total
  # ------------------------------

  def calcular_salario_total(salario, horas_extras) do
    case horas_extras do
      0 ->
        salario

      _ ->
        # Se calcula el valor por hora normal
        valor_hora = salario / 45
        # Se pagan horas extras al 150%
        salario_extra = horas_extras * valor_hora * 1.5
        # Total = salario base + extras
        (salario + salario_extra)
        |> Float.round(2)
    end
  end
end

# Ejecuta el programa.
CalcularSalario.main()
