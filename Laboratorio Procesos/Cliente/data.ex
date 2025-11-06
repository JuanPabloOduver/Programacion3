# ----------------------------------------------
# Módulo que define la estructura de una tesis
# ----------------------------------------------
defmodule Datos.Tesis do
  defstruct [fecha: nil, titulo: nil, descripcion: nil, autores_cedulas: []]
end

# ----------------------------------------------
# Módulo que define la estructura de un autor
# ----------------------------------------------
defmodule Datos.Autor do
  defstruct [nombre: nil, apellidos: nil, cedula: nil, programa: nil, titulo_profesional: nil]
end

# ----------------------------------------------
# Módulo principal de datos del sistema
# ----------------------------------------------
defmodule Datos do

  # ----------------------------------------------
  # Función que carga los datos iniciales del sistema
  # ----------------------------------------------
  def datos_iniciales do
    autores = %{
      "0001" => %Datos.Autor{
        nombre: "Juan Pablo",
        apellidos: "Oduver García",
        cedula: "0001",
        programa: "Ingeniería de Sistemas",
        titulo_profesional: "Licenciado en Bases de Datos"
      },
      "0002" => %Datos.Autor{
        nombre: "Juan José",
        apellidos: "Marín",
        cedula: "0002",
        programa: "Ingeniería de Sistemas",
        titulo_profesional: "Licenciado en Redes"
      },
      "0003" => %Datos.Autor{
        nombre: "Robinson",
        apellidos: "Arias Muñoz",
        cedula: "0003",
        programa: "Ingeniería Electrónica",
        titulo_profesional: "Doctor en Telecomunicaciones"
      },
      "0004" => %Datos.Autor{
        nombre: "Fernely",
        apellidos: "Trujillo",
        cedula: "0004",
        programa: "Filosofía",
        titulo_profesional: "Magíster en Teorías"
      },
      "0005" => %Datos.Autor{
        nombre: "Diego Brandom",
        apellidos: "García Márquez",
        cedula: "0005",
        programa: "Derecho",
        titulo_profesional: "Abogado"
      }
    }

    tesis = [
      %Datos.Tesis{
        fecha: "03 - 10 - 2025",
        titulo: "La Magia de las Redes",
        descripcion: "Se cuentan las redes a profundidad, desde lo básico a lo más intrigante del tema",
        autores_cedulas: ["0001", "0002"]
      },
      %Datos.Tesis{
        fecha: "01 - 5 - 2024",
        titulo: "Las redes sociales a detalle, ¿Cómo afectan a futuro?",
        descripcion: "Perspectiva basada en cómo TikTok puede influir en la tienda del Fortnite",
        autores_cedulas: ["0003", "0004"]
      },
      %Datos.Tesis{
        fecha: "06 - 1 - 2023",
        titulo: "Cómo manejar bien los casos Joestars",
        descripcion: "wry",
        autores_cedulas: ["0004", "0005"]
      }
    ]

    %{tesis: tesis, autores: autores}
  end
end
