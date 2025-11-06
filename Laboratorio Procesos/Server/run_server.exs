
# ----------------------------------------------
# Archivo principal que ejecuta el servidor
# ----------------------------------------------

Code.compile_file("util.ex")
Code.compile_file("data.ex")
Code.compile_file("servidor.ex")

if Node.self() == :nonode@nohost do
  IO.puts "ERROR: Debe iniciar el script como el nodo dado."
else
  Servidor.main()
  :timer.sleep(:infinity)
end

# Esto se incia con este comando: elixir --name servidor@[IP DEL SERVER] --cookie matraz run_server.exs

# Debe estar fuera de la carpeta para que sirva por la forma en la que el archivo compila los módulos.

# La ip se ve en la terminal con "ipconfig"
