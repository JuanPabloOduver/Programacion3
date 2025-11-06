

# ----------------------------------------------
# Archivo principal que ejecuta el servidor
# ----------------------------------------------

Code.compile_file("Util.ex")
Code.compile_file("data.ex")
Code.compile_file("cliente.ex")

if Node.self() == :nonode@nohost do
  IO.puts "ERROR: Debe iniciar el script con el nodo dado."
else
  Cliente.main()
  :timer.sleep(:infinity)
end


# Esto se incia con este comando: elixir --name cliente@[IP DEL COMPUTADOR DEL CLIENTE] --cookie matraz run_cliente.exs

# Debe estar fuera de la carpeta para que sirva por la forma en la que el archivo compila los módulos.

# La ip se ve en la terminal con "ipconfig"
