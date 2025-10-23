defmodule TallerConcurrencia do
  def main do
    matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    t1 = Task.async(fn -> s1(matriz) end)
    t2 = Task.async(fn -> s2(matriz) end)

    a = Task.await(t1)
    b = Task.await(t2)

    c = s3(a, b)
    s4(c)
  end

  def s1(matriz) do
    suma_debajo_diagonal(matriz)
  end

  defp suma_debajo_diagonal(matriz) do
    sumar_filas_debajo(matriz, 0)
  end

  defp sumar_filas_debajo(matriz, i) when i >= length(matriz), do: 0
  defp sumar_filas_debajo(matriz, i) do
    fila = Enum.at(matriz, i, [])
    suma_en_fila = sumar_columnas_fila_debajo(fila, i - 1)
    suma_en_fila + sumar_filas_debajo(matriz, i + 1)
  end

  defp sumar_columnas_fila_debajo(_fila, j) when j < 0, do: 0
  defp sumar_columnas_fila_debajo(fila, j) do
    Enum.at(fila, j, 0) + sumar_columnas_fila_debajo(fila, j - 1)
  end

  def s2(matriz) do
    {suma, cuenta} = suma_encima_diagonal(matriz)
    promedio = if cuenta == 0, do: 0, else: suma / cuenta
    promedio
  end

  defp suma_encima_diagonal(matriz) do
    sumar_filas_encima(matriz, 0)
  end

  defp sumar_filas_encima(matriz, i) when i >= length(matriz), do: {0, 0}
  defp sumar_filas_encima(matriz, i) do
    fila = Enum.at(matriz, i, [])
    {suma_en_fila, cuenta_en_fila} = sumar_columnas_fila_encima(fila, i + 1)
    {suma_restante, cuenta_restante} = sumar_filas_encima(matriz, i + 1)
    {suma_en_fila + suma_restante, cuenta_en_fila + cuenta_restante}
  end

  defp sumar_columnas_fila_encima(fila, j) when j >= length(fila), do: {0, 0}
  defp sumar_columnas_fila_encima(fila, j) do
    valor = Enum.at(fila, j, 0)
    {suma_rest, cnt_rest} = sumar_columnas_fila_encima(fila, j + 1)
    {valor + suma_rest, 1 + cnt_rest}
  end


  def s3(a, b) do
    a * b
  end

  def s4(c) do
    IO.puts("El valor de c = a * b es: #{c}")
  end
end

TallerConcurrencia.main()
