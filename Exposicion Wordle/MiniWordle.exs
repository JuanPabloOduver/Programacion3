defmodule MiniWordle do

  def palabras do # Lista de palabras. Lo ideal es que seaan todas en minúscula.
    ["pasas", "perro", "tarro", "silla", "suave", "libro", "corto", "comer", "tomar", "plato", "mesas", "padre", "huevo", "amigo", "salud", "nieve", "arena"]
  end

  def main do
    palabra = Enum.random(palabras()) # Elige una palabra aleatoria
    intentos = 6

    IO.puts("
  ===============================
    ░█──░█ █▀▀█ █▀▀█ █▀▀▄ █── █▀▀
    ░█░█░█ █──█ █▄▄▀ █──█ █── █▀▀
    ░█▄▀▄█ ▀▀▀▀ ▀─▀▀ ▀▀▀─ ▀▀▀ ▀▀▀
Tienes 6 intentos para adivinar la palabra de 5 letras
  ===============================
   ")

    ciclo(palabra, intentos) # Empieza el ciclo
  end

defp ciclo(palabra, 0) do
  IO.puts("Perdiste. La palabra era: #{palabra}") # Si el ciclo llega a 0 intentos, se termina.
end

defp ciclo(palabra, intentos_restantes) do
  intento =
  "Escribe tu intento: "
  |> Util.ingresar(:texto)
  |> String.trim()
  |> String.downcase() # Hace que todos los intentos sean como sean siempre sean en minúscula.

  cond do
    String.length(intento) != 5 ->
      IO.puts("Debes ingresar una palabra de 5 letras.\n") # Aquí solo deja poner una palabra de 5 letras.
      ciclo(palabra, intentos_restantes)

    intento == palabra ->
      IO.puts("¡Felicidades! Adivinaste la palabra: #{palabra}") # Mensaje cuando adivinas la palabra.
      :ok

    true -> # True == Todo lo demás que no sea lo de arriba
      pista = generar_pista(palabra, intento)
      IO.puts("Pista: #{pista}")
      IO.puts("Te quedan #{intentos_restantes - 1} intentos.\n")
      ciclo(palabra, intentos_restantes - 1) # Vuelve a hacer el ciclo y resta un intento.
  end
end

  # Genera pista: letra correcta en posición correcta se muestra,
  # letra incorrecta se reemplaza por "_"
  defp generar_pista(palabra, intento) do
  palabra_lista = String.graphemes(palabra) # El .graphemes es para convertir palabras en una lista de letras.
  intento_lista = String.graphemes(intento)

  pista = # Se utiliza un ciclo que reemplaza las letras incorrectas por "_" y deja las correctas
    for i <- 0..(length(palabra_lista) - 1) do
      if Enum.at(palabra_lista, i) == Enum.at(intento_lista, i) do
        Enum.at(palabra_lista, i)
      else
        "_"
      end
    end

  Enum.join(pista, "") # Une la lista de letras para formar la palabra como tal. El "" es para juntarlas sin nada en medio.
end


end

MiniWordle.main()
