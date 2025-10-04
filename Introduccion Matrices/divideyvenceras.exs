defmodule DivideyVenceras do
  # Caso base: lista vacía
  def recorrer([]), do: []
  # Caso base: lista con un solo elemento
  def recorrer([x]), do: [x]

  def recorrer(lista) do
    # Dividimos la lista en dos mitades
    mitad = div(length(lista), 2)
    {izq, der} = Enum.split(lista, mitad)

    # Resolvemos cada mitad recursivamente
    recorrer(izq) ++ recorrer(der)
  end
end


# Ejemplo de uso
IO.inspect DivideyVenceras.recorrer([1, 2, 3, 4, 5])
