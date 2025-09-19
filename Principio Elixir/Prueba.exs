defmodule SumaCuadrados do
  def suma_cuadrados (lista) do
    lista
    |> Enum.map(&(&1 * &1))
    |> Enum.sum()
  end
end

numeros = [1, 2, 3, 4]
resultado = SumaCuadrados.suma_cuadrados(numeros)
IO.puts("Suma de los cuadrados (declarativo): #{resultado}")
