defmodule Util do
  @moduledoc """
  Módulo con funciones que se reutilizan en varios programas (Cliente y Servidor).
  """

  # ------------------------------------
  # Mostrar mensaje en consola (Elixir) - ARIDAD 1
  # ------------------------------------
  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end

  # ------------------------------------
  # Mostrar mensaje en consola con etiqueta (TAG) - ARIDAD 2
  # Utilizado para identificar el origen del mensaje (CLIENT, SERVER, ERROR, etc.)
  # ------------------------------------
  def mostrar_mensaje(mensaje, etiqueta) do
    "[#{etiqueta}] #{mensaje}"
    |> IO.puts()
  end

  # ------------------------------------
  # Funciones ingresar/2 - AGRUPADAS POR ARIDAD
  # Permiten ingresar diferentes tipos de datos desde consola
  # ------------------------------------

  # Ingresar texto desde consola (Elixir)
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  # Ingresar número entero desde consola
  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        mostrar_error("Error: se espera que ingrese un número entero\n")
        ingresar(mensaje, :entero)
    end
  end

  # Ingresar número real (float) desde consola
  def ingresar(mensaje, :real) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_float()
    rescue
      ArgumentError ->
        mostrar_error("Error: se espera que ingrese un número real\n")
        ingresar(mensaje, :real)
    end
  end

  # Ingresar valores booleanos (sí / no)
  def ingresar(mensaje, :booleano) do
    valor =
      mensaje
      |> ingresar(:texto)
      |> String.downcase()

    Enum.member?(["si", "sí", "s"], valor)
  end

  # ------------------------------------
  # Mostrar mensaje de error en la salida de error estándar
  # ------------------------------------
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end

  # ------------------------------------
  # Lógica de Negocio / Presentación (Específico del Laboratorio)
  # Funciones para formatear y mostrar autores en consola
  # ------------------------------------
  def formatear_autores(autores) do
    Enum.map(autores, fn a ->
      """
      Nombre: #{a.nombre} #{a.apellidos}
        Cédula: #{a.cedula}
        Programa: #{a.programa}
        Título Profesional: #{a.titulo_profesional}
      """
    end)
    |> Enum.join("\n---\n")
  end

  # ------------------------------------
  # Otras funciones de utilidad
  # ------------------------------------

  # Validar datos de registro (ejemplo genérico)
  # Verifica que los campos de cédula y contraseña no estén vacíos
  def validar_datos_registro(%{cedula: cedula, contrasena: contrasena}) do
    if cedula != nil and cedula != "" and contrasena != nil and contrasena != "" do
      {:ok, "Datos básicos presentes"}
    else
      {:error, "La cédula o la contraseña no pueden estar vacías."}
    end
  end
end
