defmodule RegistrarVehiculoPeaje do
  @moduledoc """
  Módulo para calcular una tarifa final.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 06/09/2025
  - licencia: GNU GPL v3
  """
  # ------------------------------
  # Función principal.
  # ------------------------------

  def main do

    # Pedir la placa del vehiculo.
    placa_vehiculo =
      "Ingrese la placa del vehiculo = "
      |> Util.ingresar(:texto)

    # Pedir el tipo de vehiculo.
    tipo_vehiculo =
      "Ingrese el tipo de vehiculo = "
      |> Util.ingresar(:texto)

    # Pedir el peso del vehiculo.
    peso_vehiculo =
      "Ingrese el peso del vehiculo en toneladas = "
      |> Util.ingresar(:real)

    # Calcular la tarifa final.
    {placa_vehiculo, tipo_vehiculo, tarifa_final} =
      calcular_tarifa_final(placa_vehiculo, tipo_vehiculo, peso_vehiculo)
      "Vehiculo #{placa_vehiculo} (#{tipo_vehiculo}), debe pagar #{tarifa_final}"
      |> Util.mostrar_mensaje()

  end

  # ------------------------------
  # Función para calcular la tarifa final. (Con Condicionales IF)
  # ------------------------------

  def calcular_tarifa_final(placa_vehiculo, tipo_vehiculo, peso_vehiculo) do
    if tipo_vehiculo == "Carro" do
     {placa_vehiculo, tipo_vehiculo, 10000}
    else
      if tipo_vehiculo == "Moto" do
        {placa_vehiculo, tipo_vehiculo, 5000}
      else
        if tipo_vehiculo == "Camion" do
          {placa_vehiculo, tipo_vehiculo, 20000 + (2000 * peso_vehiculo)}
        else # Si no es ninguna opcion.
          IO.puts("Ingrese un tipo de vehículo válido: Carro, Moto o Camion")
          {placa_vehiculo, tipo_vehiculo, 0}
        end
      end
    end
  end

  # ------------------------------
  # Función para calcular la tarifa final. (Con Condicional Case)
  # ------------------------------

  def calcular_tarifa_final(placa, tipo, peso) do
    case tipo do
      "Carro" ->
        {placa, tipo, 10000}

      "Moto" ->
        {placa, tipo, 5000}

      "Camion" ->
        {placa, tipo, 20000 + (2000 * peso)}

      _ -> # Si no es ninguna opcion.
        IO.puts("Ingrese un tipo valido como Carro, Moto, Camion")
    end
  end
end

# Ejecuta el programa.
RegistrarVehiculoPeaje.main()
