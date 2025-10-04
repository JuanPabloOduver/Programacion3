defmodule MatrizRecursiva do
  # ---- Recorrer matriz completa ----
  def recorrer_matriz([]), do: :ok

  def recorrer_matriz([fila | resto_filas]) do
    recorrer_fila(fila)
    IO.puts("")   # Salto de línea después de cada fila
    recorrer_matriz(resto_filas)
  end

  def recorrer_fila([]), do: :ok

  def recorrer_fila([elemento | resto]) do
    IO.write("#{elemento} ")
    recorrer_fila(resto)
  end

  # ---- Recorrer la diagonal principal ----
  def recorrer_diagonal(matriz), do: recorrer_diagonal(matriz, 0)

  defp recorrer_diagonal([], _), do: :ok
  defp recorrer_diagonal([fila | resto], indice) do
    IO.puts(Enum.at(fila, indice))
    recorrer_diagonal(resto, indice + 1)
  end

  # ---- Sumar todos los elementos ----
  def sumar_matriz([]), do: 0
  def sumar_matriz([fila | resto]) do
    sumar_fila(fila) + sumar_matriz(resto)
  end

  defp sumar_fila([]), do: 0
  defp sumar_fila([elemento | resto]) do
    elemento + sumar_fila(resto)
  end
end


# Ejemplo
matriz = [
  [1, 2],
  [3, 4]
]

IO.puts("Matriz completa:")
MatrizRecursiva.recorrer_matriz(matriz)

IO.puts("\nDiagonal:")
MatrizRecursiva.recorrer_diagonal(matriz)

IO.puts("\nSuma total:")
IO.puts(MatrizRecursiva.sumar_matriz(matriz))
