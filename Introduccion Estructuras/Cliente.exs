defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def generar_mensaje_clientes(lista_clientes, parser) do
    lista_clientes
    |> Enum.map(parser)
    |> Enum.join()
  end

  def escribir_csv(clientes, nombre) do
    clientes
    |> generar_mensaje_clientes(&convertir_cliente_linea_csv/1)
    |> (&("nombre,edad,altura\n" <> &1)).() # agrega encabezados
    |> (&File.write(nombre, &1)).()
  end

  defp convertir_cliente_linea_csv(cliente) do
    "#{cliente.nombre},#{cliente.edad},#{cliente.altura}\n"
  end

  def leer_csv(nombre) do
    nombre
    |> File.stream!()
    |> Stream.drop(1) # ignora los encabezados
    |> Enum.map(&convertir_cadena_cliente/1)
  end

  defp convertir_cadena_cliente(cadena) do
    [nombre, edad, altura] =
      cadena
      |> String.split(",")
      |> Enum.map(&String.trim/1)

    edad = edad |> String.to_integer()
    altura = altura |> String.to_float()

    Cliente.crear(nombre, edad, altura)
  end
end
