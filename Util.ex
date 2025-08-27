defmodule Util do
  @moduledoc """
  Módulo con funciones que se reutilizan en varios programas.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 19/08/2025
  - licencia: GNU GPL v3
  """

  # ------------------------------
  # Mostrar mensaje desde Java
  # ------------------------------
  def mostrar_mensaje_java(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end

  # ------------------------------
  # Mostrar mensaje en consola (Elixir)
  # ------------------------------
  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  # ------------------------------
  # Ingresar texto desde consola (Elixir)
  # ------------------------------
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  # ------------------------------
  # Ingresar texto desde Java
  # ------------------------------
  def ingresar_java(mensaje, :texto) do
    case System.cmd("java", ["-cp", ".", "Mensaje", "input", mensaje]) do
      {output, 0} ->
        IO.puts("Texto ingresado correctamente.")
        IO.puts("Entrada: #{output}")
        String.trim(output)

      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")

      nil ->
        IO.puts("Error: no se recibió respuesta del programa Java.")
    end
  end

  # ------------------------------
  # Ingresar número entero desde consola
  # ------------------------------
  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número entero\n"
        |> mostrar_error()

        mensaje
        |> ingresar(:entero)
    end
  end

  # ------------------------------
  # Ingresar número real (float) desde consola
  # ------------------------------
  def ingresar(mensaje, :real) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_float()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número real\n"
        |> mostrar_error()

        mensaje
        |> ingresar(:real)
    end
  end

  # ------------------------------
  # Mostrar mensaje de error en la salida de error estándar
  # ------------------------------
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
