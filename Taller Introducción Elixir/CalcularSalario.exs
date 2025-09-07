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

    # Pedir las horas extras que trabajo el empleado.
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
    horas_extras *(salario * 1.5) |> Float.round(2) # ESTO ESTA RARO XDDDDDDD
  end

end

# Ejecuta el programa.
CalcularSalario.main()
