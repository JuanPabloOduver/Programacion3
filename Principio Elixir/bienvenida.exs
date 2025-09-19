Code.require_file("util.ex", __DIR__)

defmodule MensajeEx do
  @moduledoc """
Módulo para mostrar un mensaje
- autor: Juan Pablo Oduver Garcia.
- fecha: 19/08/2025
- licencia: GNU GPL v3
"""
  def main do
    Util.mostrar_mensaje("Bienvenidos a la empresa Once LTDA") ## Mensaje a mostrar
  end
end

MensajeEx.main()
