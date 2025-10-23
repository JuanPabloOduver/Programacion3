defmodule CarreraCaballos do
  @moduledoc """
  Simulación concurrente de una carrera de caballos.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 20/10/2025
  - licencia: GNU GPL v3
  """

  @meta 40  # longitud de la pista.

  # ------------------------------
  # Función principal
  # ------------------------------
  def main do
    caballos = ["Caballo 1", "Caballo 2", "Caballo 3", "Caballo 4"]
    padre = self() # Guarda el PID del proceso principal

    # Lista con las posiciones iniciales (todos empiezan en 0)
    posiciones = Enum.map(caballos, fn _ -> 0 end)

    # Inicia un proceso para cada caballo
    # Cada proceso ejecuta la función `correr/4`
    pids =
      Enum.map(caballos, fn nombre ->
        spawn(fn -> correr(nombre, 0, @meta, padre) end)
      end)

    # Bucle que mantiene la carrera y actualiza la pantalla
    loop(caballos, posiciones, pids)
  end

  # ------------------------------
  # Proceso individual de cada caballo
  # ------------------------------
  defp correr(nombre, pos, meta, padre) do
    receive do
      # Si recibe el mensaje :detener, el caballo se detiene (fin del proceso)
      :detener ->
        :ok
    after
      # Si no recibe mensaje, espera un tiempo aleatorio antes de avanzar
      :rand.uniform(600) ->
        # Avanza de 1 o 2 posiciones de forma aleatoria
        nuevo_pos = min(pos + :rand.uniform(2), meta)

        # Envía un mensaje al proceso principal con su nueva posición
        send(padre, {:avance, nombre, nuevo_pos})

        # Si llegó a la meta, envía un mensaje de ganador
        if nuevo_pos >= meta do
          send(padre, {:ganador, nombre})
        else
          # Si no ha llegado, sigue corriendo (recursión)
          correr(nombre, nuevo_pos, meta, padre)
        end
    end
  end

  # ------------------------------
  # Bucle principal que controla la carrera
  # ------------------------------
  defp loop(caballos, posiciones, pids) do
    receive do
      # Mensaje que llega cuando un caballo avanza
      {:avance, nombre, pos} ->
        # Encuentra el índice del caballo en la lista
        idx = Enum.find_index(caballos, &(&1 == nombre))

        # Actualiza su posición en la lista de posiciones
        nuevas_pos = List.replace_at(posiciones, idx, pos)

        # Redibuja toda la pista con las nuevas posiciones
        dibujar_pista(caballos, nuevas_pos)

        # Llama recursivamente par
        a seguir escuchando más mensajes
        loop(caballos, nuevas_pos, pids)

      # Mensaje que llega cuando un caballo gana
      {:ganador, nombre} ->
        # Dibuja una última vez la pista antes de anunciar al ganador
        dibujar_pista(caballos, posiciones)
        IO.puts("\n -------- #{nombre} ganó la carrera. --------\n")

        # Envía el mensaje :detener a todos los caballos para finalizar sus procesos
        Enum.each(pids, fn pid -> send(pid, :detener) end)
    end
  end

  # ------------------------------
  # Dibuja las 4 líneas de la carrera, una por cada caballo.
  # ------------------------------

  defp dibujar_pista(caballos, posiciones) do
    # Limpia la pantalla antes de redibujar
    # \e[H mueve el cursor al inicio
    # \e[J borra todo lo que hay en pantalla
    IO.write("\e[H\e[J")

    IO.puts("-------- CARRERA DE CABALLOS --------\n")

    # Une cada caballo con su posición actual
    Enum.zip(caballos, posiciones)
    |> Enum.each(fn {nombre, pos} ->
      # Crea la "pista": guiones antes y después del caballo
      pista =
        String.duplicate("-", pos) <>
        "🐎" <>
        String.duplicate("-", @meta - pos)

      # Muestra la línea completa de cada caballo
      IO.puts("#{nombre}: #{pista}")
    end)
  end
end

# Ejecutar el programa principal
CarreraCaballos.main()
