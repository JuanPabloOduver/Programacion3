defmodule Validador do
  @moduledoc """
  Módulo para validar la fortaleza de una contraseña, imprimiendo el resultado directamente.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 17/09/2025
  - licencia: GNU GPL v3
  """

  # ------------------------------
  # Función de validación
  # ------------------------------
  def validar_contrasena(contrasena) do
    errores =
      []
      |> validar_longitud(contrasena)
      |> validar_mayuscula(contrasena)
      |> validar_numero(contrasena)
      |> validar_espacios(contrasena)

    if Enum.empty?(errores) do
      {:ok, "Contraseña segura"}
    else
      mensaje_error = "Error: " <> Enum.join(Enum.reverse(errores), ", ") <> "."
      {:error, mensaje_error}
    end
  end

  # --- Funciones auxiliares de validación ---

  # Valida si su longitud es de por lo menos 8 caracteres.
  defp validar_longitud(lista_errores, contrasena) do
    if String.length(contrasena) < 8, do: ["Debe tener al menos 8 caracteres" | lista_errores], else: lista_errores
  end

  # Valida si tiene Mayuscula.
  defp validar_mayuscula(lista_errores, contrasena) do
    if contrasena == String.downcase(contrasena), do: ["Debe contener al menos una letra mayúscula" | lista_errores], else: lista_errores
  end

  # Valida si tiene un numero.
  defp validar_numero(lista_errores, contrasena) do
  if not Enum.any?(String.graphemes(contrasena), fn caracter ->
    head = String.to_charlist(caracter) |> hd
    head >= ?0 and head <= ?9
  end),
    do: ["Debe contener al menos un número" | lista_errores], else: lista_errores
end

  # Valida si tiene espacios.
  defp validar_espacios(lista_errores, contrasena) do
    if String.contains?(contrasena, " "), do: ["No debe contener espacios" | lista_errores], else: lista_errores
  end
end

IO.puts("--- Validación de Contraseñas ---")

# Caso 1: Contraseña segura y válida
contrasena_1 = "Contrasena123"
IO.puts("\nValidando: '#{contrasena_1}'")
IO.inspect(Validador.validar_contrasena(contrasena_1))

# Caso 2: Contraseña con errores
contrasena_2 = "hola"
IO.puts("\nValidando: '#{contrasena_2}'")
IO.inspect(Validador.validar_contrasena(contrasena_2))

# Caso 3: Contraseña con múltiples errores
contrasena_3 = "mas larga que la anterior"
IO.puts("\nValidando: '#{contrasena_3}'")
IO.inspect(Validador.validar_contrasena(contrasena_3))

# Caso 4: Contraseña con espacios y sin mayúsculas
contrasena_4 = "solo minusculas"
IO.puts("\nValidando: '#{contrasena_4}'")
IO.inspect(Validador.validar_contrasena(contrasena_4))

# Caso 5: Contraseña con solo espacios
contrasena_5 = "   "
IO.puts("\nValidando: '#{contrasena_5}'")
IO.inspect(Validador.validar_contrasena(contrasena_5))
