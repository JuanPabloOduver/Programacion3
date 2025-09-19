# Una tienda de tecnología almacena su inventario en un mapa,
# donde las claves son los nombres de los productos y los valores son la cantidad disponible

# 1. Define un mapa llamado inventario con al menos tres productos y sus cantidades.
# 2. Crea una función actualizar_inventario/3 que reciba el inventario, un producto y la cantidad vendida, y devuelva el inventario
# actualizado.
# 3. Si el producto no está en el inventario, debe mostrar un mensaje "Producto no encontrado".
# 4. Si la cantidad a vender es mayor que la disponible, debe mostrar "Stock insuficiente”.

# Con if else

defmodule TiendaTecnologia do
  def actualizar_inventario(inventario, producto, cantidad) do
    if Map.has_key?(inventario, producto) do
      stock = Map.get(inventario, producto)
      if cantidad <= stock do
        Map.put(inventario, producto, stock - cantidad)
      else
        IO.puts("Stock insuficiente")
        inventario
      end
    else
      IO.puts("Producto no encontrado")
      inventario
    end
  end
end

# Con cond

defmodule TiendaTecnologia do
  def actualizar_inventario(inventario, producto, cantidad) do
  stock = Map.get(inventario, producto)
    cond do
      stock == nil -> IO.puts("No esta disponible el producto")
      stock < cantidad -> IO.puts("No hay suficientes productos")
      true -> Map.put(inventario, producto, stock - cantidad)
    end
  end
end


productos = %{"rtx 6090" => 10, "intel core i10" => 5, "g502" => 2}
IO.inspect(TiendaTecnologia.actualizar_inventario(productos, "rtx 6090", 3))
