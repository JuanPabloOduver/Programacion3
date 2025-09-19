# Un profesor tiene un mapa donde la clave es el nombre del estudiante y el valor es una lista con sus
# calificaciones en tres criterios de evaluación.

# Implementa una función evaluar_proyecto/2 que reciba el mapa de calificaciones y el nombre del estudiante.
# Retorna una tupla con:
# (promedio, estado), donde estado es "Aprobado" si el promedio es mayor o igual a 6, y "Reprobado" si es menor.
# Usa if o cond para determinar el estado.
# Si el estudiante no está en el mapa, debe retornar {0, "No encontrado"}.

defmodule Evaluacion do
  def evaluar_proyecto(calificaciones, estudiante) do
    if Map.has_key?(calificaciones, estudiante) do
      # Recoge una lista de las notas del estudiante segun su llave (Su nombre)
      notas = Map.get(calificaciones, estudiante)

      # Recoge las notas del estudiante y las suma
      suma = Enum.reduce(notas, 0, fn nota, acc -> acc + nota end)

      # Calcula el promedio
      promedio = suma / length(notas)

      # Revisa si esta aprobado o no
      estado = if promedio >= 6 do
        "Aprobado"
      else
        "Reprobado"
      end
      {promedio, estado}
    else
    {0, "No encontrado"}
    end
  end
end

calificaciones = %{
  "Pablo" => [6, 3, 9],
  "Matraz" => [5, 1, 10],
  "Fernely" => [9, 9, 10]
}

IO.inspect(Evaluacion.evaluar_proyecto(calificaciones, "Pablo"))

IO.inspect(Evaluacion.evaluar_proyecto(calificaciones, "Matraz"))

IO.inspect(Evaluacion.evaluar_proyecto(calificaciones, "Fernely"))
