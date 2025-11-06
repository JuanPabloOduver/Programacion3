defmodule Cliente do
  @moduledoc """
  Módulo para iniciar el cliente y establecer conexión con el servidor.
  """

  @nodo_servidor :'servidor@[IP DEL SERVER]' # Debe tener la IP del servidor
  @servicio_servidor :servidor_tesis

  # ----------------------------------------------
  # Función que inicia el cliente y gestiona la conexión con el servidor
  # ----------------------------------------------
  def main() do
    Util.mostrar_mensaje("Iniciando Cliente", "CLIENT")

    case Node.connect(@nodo_servidor) do
      true ->
        Util.mostrar_mensaje("Conexión establecida con éxito", "CLIENT")
        pid_servidor = esperar_servicio(@servicio_servidor, @nodo_servidor)

        case pid_servidor do
          nil ->
            Util.mostrar_mensaje("Fallo: El servicio #{@servicio_servidor} no se registró a tiempo.", "ERROR")

          pid ->
            Util.mostrar_mensaje("Servicio activo (PID: #{inspect(pid)}).", "CLIENT")
            titulos = obtener_todas_las_tesis(pid)

            if titulos != :error do
              mostrar_tesis(titulos)
              seleccionar_y_consultar(titulos, pid)
            end
        end

      false ->
        Util.mostrar_mensaje("No se pudo conectar al servidor.", "ERROR")
    end
  end

  # ----------------------------------------------
  # Función que espera a que el servicio del servidor esté disponible
  # ----------------------------------------------
  defp esperar_servicio(servicio, nodo, intentos \\ 50, retraso_ms \\ 100)

  defp esperar_servicio(_servicio, _nodo, 0, _retraso_ms), do: nil

  defp esperar_servicio(servicio, nodo, intentos, retraso_ms) do
    Process.sleep(retraso_ms)

    case :rpc.call(nodo, Process, :whereis, [servicio]) do
      pid when is_pid(pid) -> pid
      _ -> esperar_servicio(servicio, nodo, intentos - 1, retraso_ms)
    end
  end

  # ----------------------------------------------
  # Función que obtiene todas las tesis del servidor
  # ----------------------------------------------
  defp obtener_todas_las_tesis(pid_servidor) do
    send(pid_servidor, {self(), {:obtener_todas_las_tesis}})

    receive do
      titulos when is_list(titulos) ->
        titulos

      _ ->
        Util.mostrar_mensaje("Error: Respuesta inesperada del servidor.", "ERROR")
        :error
    after
      5_000 ->
        Util.mostrar_mensaje("Error: Tiempo de espera agotado (5s) al obtener títulos.", "ERROR")
        :error
    end
  end

  # ----------------------------------------------
  # Función que muestra todas las tesis disponibles
  # ----------------------------------------------
  defp mostrar_tesis(titulos) do
    IO.puts("\nTesis Disponibles:")
    Enum.each(titulos, &IO.puts("- #{&1}"))
  end

  # ----------------------------------------------
  # Función que permite seleccionar una tesis y consultar sus autores
  # ----------------------------------------------
  defp seleccionar_y_consultar(titulos, pid_servidor) do
    titulo_a_consultar = Util.ingresar("\nBuscar por título de Tesis:", :texto)

    if Enum.member?(titulos, titulo_a_consultar) do
      obtener_autores_de_tesis(titulo_a_consultar, pid_servidor)
    else
      Util.mostrar_mensaje("Título no encontrado. Intente de nuevo.", "ERROR")
      seleccionar_y_consultar(titulos, pid_servidor)
    end
  end

 # ----------------------------------------------
# Función que obtiene los autores de una tesis específica
# ----------------------------------------------
defp obtener_autores_de_tesis(titulo, pid_servidor) do
  send(pid_servidor, {self(), {:obtener_autores, titulo}})

  receive do
    autores when is_list(autores) ->
      IO.puts("\nAutores Asociados:\n")
      Util.formatear_autores(autores) |> IO.puts()

    _ ->
      Util.mostrar_mensaje("No se pudo obtener los autores del trabajo seleccionado.", "ERROR")
  after
    5_000 ->
      Util.mostrar_mensaje("Error: Tiempo de espera agotado (5s) al consultar autores.", "ERROR")
  end

  # Preguntar si desea continuar consultando.

  continuar =
    Util.ingresar("\n¿Desea consultar otra tesis? (S/N): ", :texto)
    |> String.downcase()

  if continuar in ["si", "sí", "s"] do
    obtener_todas_las_tesis(pid_servidor)
    |> then(fn titulos ->
      mostrar_tesis(titulos)
      seleccionar_y_consultar(titulos, pid_servidor)
    end)
  else
    Util.mostrar_mensaje("Finalizando sesión del cliente.", "CLIENT")
    :timer.sleep(1000)
    System.halt(0) # Saca al cliente
  end
end


end
