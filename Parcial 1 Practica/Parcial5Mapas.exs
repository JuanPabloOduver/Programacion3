# Una tienda ofrece descuentos en una lista de productos,
# donde cada producto es una tupla con (nombre, precio).

# Implementa una función calcular_descuentos/2 que reciba: Una lista de productos.
# Un porcentaje de descuento a aplicar a cada producto.
# La función debe retornar una tupla con: (lista_descuentos, total_descuento).
# Usa Enum.map/2 para calcular el precio con descuento y generar la nueva lista.
# Usa Enum.sum/1 para calcular el total de descuento aplicado.
# Si la lista está vacía, retorna {[], 0}.

defmodule Tienda do
  def calcular_descuento(productos, descuento) do
    case productos do
      [] ->
        {[], 0}

      _ ->
        # Lista de productos con el precio ya descontado
        lista_descuentos =
          Enum.map(productos, fn {nombre, precio} ->
            precio_descuento = precio - (precio * descuento / 100)
            {nombre, precio_descuento}
          end)

        # Total de descuento aplicado
        total_descuento =
          Enum.sum(
            Enum.map(productos, fn {_nombre, precio} -> precio * descuento / 100  end))
        {lista_descuentos, total_descuento}
    end
  end
end

productos = [
  {"Chocorramo", 2000},
  {"Jumbo", 1000},
  {"Jett", 1500}
]

IO.inspect(Tienda.calcular_descuento(productos, 20))
