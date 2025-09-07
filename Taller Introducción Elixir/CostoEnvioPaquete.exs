defmodule CostoEnvioPaquete do
  @moduledoc """
  Módulo para calcular el costo de un envio.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 06/09/2025
  - licencia: GNU GPL v3
  """
  # ------------------------------
  # Función principal.
  # ------------------------------

  def main do

    # Pedir el nombre del cliente.
    nombre =
      "Ingrese el nombre del cliente = "
      |> Util.ingresar(:texto)

    # Pedir el peso del paquete.
    peso =
      "Ingrese el peso del paquete = "
      |> Util.ingresar(:real)

    # Pedir el tipo de envio.
    tipo_envio =
      "Ingrese el tipo de envio = "
      |> Util.ingresar(:texto)

    # Calcular el costo total.
    {nombre, peso, tipo_envio, costo_total} =
      calcular_tarifa(nombre, peso, tipo_envio)
      "Don #{nombre}, su paquete (#{peso}kg) enviado por #{tipo_envio}, tiene un costo de envio de #{costo_total}"
      |> Util.mostrar_mensaje()
  end

  # ------------------------------
  # Función para calcular la tarifa. (Con Condicionales Case e IF).
  # ------------------------------

  def calcular_tarifa(nombre, peso, tipo) do

    # Condicional tipo de envio en case.
    case tipo do

      # Si el tipo de envio es Economico
      "Economico" ->
        {nombre, peso, tipo, 5000 * peso}

      # Si el tipo de envio es Express
      "Express" ->
        {nombre, peso, tipo, 8000 * peso}

      # Si el tipo de envio es Internacional
      "Internacional" ->
        if peso <= 5 do # Si el peso es menos que 5
          {nombre, peso, tipo, 15000 * peso}
        else
          {nombre, peso, tipo, 12000 * peso}
        end

      _ ->
        IO.puts("Ingrese un envio como Economico, Express o Internacional")
    end
  end

   # ------------------------------
  # Función para calcular la tarifa. (Con Cond).
  # ------------------------------

  def calcular_tarifa(nombre, peso, tipo)do
    cond do

      # Si el tipo es Economico
      tipo == "Economico" -> {nombre, peso, tipo, 5000 * peso}
      # Si el tipo es Express
      tipo == "Express" -> {nombre, peso, tipo, 8000 * peso}
      # Si el tipo es Internacional
      tipo == "Internacional" and peso <= 5 -> {nombre, peso, tipo, 15000 * peso}
      tipo == "Internacional" and peso > 5 -> {nombre, peso, tipo, 12000 * peso}
      true -> IO.puts("Ingrese un envio valido")

    end
  end

end



CostoEnvioPaquete.main()
