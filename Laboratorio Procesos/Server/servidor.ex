defmodule Servidor do
  @moduledoc """
   Módulo que gestiona el servidor de tesis.
  """

  @nombre_servicio_local :servidor_tesis

  # ----------------------------------------------
  # Función que inicia el servidor y sus procesos
  # ----------------------------------------------
  def main() do
    Util.mostrar_mensaje("SERVER TESIS: ON", "SERVER")
    datos = Datos.datos_iniciales()
    registrar_servicio(@nombre_servicio_local)
    procesar_mensajes(datos)
  end

  # ----------------------------------------------
  # Función que registra el servicio localmente
  # ----------------------------------------------
  defp registrar_servicio(nombre_servicio_local),
    do: Process.register(self(), nombre_servicio_local)

  # ----------------------------------------------
  # Función que procesa los mensajes entrantes
  # ----------------------------------------------
  defp procesar_mensajes(datos) do
    receive do
      {productor, mensaje} ->
        respuesta = procesar_mensaje(mensaje, datos)
        send(productor, respuesta)
        procesar_mensajes(datos)
    end
  end

  # ----------------------------------------------
  # Función que procesa la solicitud de todas las tesis
  # ----------------------------------------------
  defp procesar_mensaje({:obtener_todas_las_tesis}, %{tesis: tesis}) do
    Enum.map(tesis, &(&1.titulo))
  end

  # ----------------------------------------------
  # Función que procesa la solicitud de autores por título
  # ----------------------------------------------
  defp procesar_mensaje({:obtener_autores, titulo}, %{tesis: tesis, autores: mapa_autores}) do
    trabajo = Enum.find(tesis, fn t -> t.titulo == titulo end)

    case trabajo do
      nil ->
        :no_encontrado

      t ->
        Enum.map(t.autores_cedulas, fn cedula ->
          Map.get(mapa_autores, cedula)
        end)
    end
  end

  # ----------------------------------------------
  # Función que maneja mensajes no reconocidos o cierre
  # ----------------------------------------------
  defp procesar_mensaje(:fin, _datos), do: :fin
  defp procesar_mensaje(mensaje, _datos),
    do: "El mensaje \"#{inspect mensaje}\" es desconocido."
end
