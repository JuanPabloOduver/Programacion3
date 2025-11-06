defmodule Concurrencia do
  def main do
    pid1 = spawn(Concurrencia, :saludar, [])
    pid2 = spawn(Concurrencia, :sumar, [5, 10])
    pid3 = spawn(Concurrencia, :encadenar, [])
    pid4 = spawn(Concurrencia, :dividir, [10, 2])


    :timer.sleep(100)
  end

  def saludar do
    IO.puts("Hola")
  end

  def sumar(a, b) do
    IO.puts("La suma es #{a + b}")
  end

  def encadenar do
    IO.puts("Proceso 1, Proceso 2")
  end

  def dividir(a, b) do
    IO.puts("La división es #{a / b}")
  end
end

Concurrencia.main()

# ----------------------------------------------

defmodule Procesos do
  def main do
    t1 = Task.async(fn -> sumar(5, 10) end)
    t2 = Task.async(fn -> multiplicar(4, 6) end)
    t3 = Task.async(fn -> promedio_listado([3, 6, 9, 12]) end)
    t4 = Task.async(fn -> division(20, 4) end)

    # Esperamos los resultados (join)
    r1 = Task.await(t1,1000)
    r2 = Task.await(t2,1000)
    r3 = Task.await(t3,1000)
    r4 = Task.await(t4,1000)

    IO.puts("Resultados:")
    IO.puts("Suma: #{r1}")
    IO.puts("Multiplicación: #{r2}")
    IO.puts("Promedio: #{r3}")
    IO.puts("División: #{r4}")
  end

  def sumar(a, b), do: a + b
  def multiplicar(a, b), do: a * b
  def promedio_listado(lista), do: Enum.sum(lista) / length(lista)
  def division(a, b), do: a / b
end

Procesos.main()
