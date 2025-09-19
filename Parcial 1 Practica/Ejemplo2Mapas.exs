defmodule Tienda do
  def vender(inventario, fruta, cantidad) do
    if Map.has_key?(inventario, fruta) do
      stock = Map.get(inventario, fruta)
      if cantidad <= stock do
        Map.put(inventario, fruta, stock - cantidad)
      else
        IO.puts("No hay suficiente inventario jhsahd")
        inventario
      end
    end
  end
end

frutas = %{"manzana" => 10, "pera" => 5, "uva" => 8}
IO.inspect(Tienda.vender(frutas, "manzana", 11))
