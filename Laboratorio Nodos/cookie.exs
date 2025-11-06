defmodule Cookie do
  @longitud_llave 128

  def main() do
    :crypto.strong_rand_bytes(@longitud_llave)
    |> Base.encode64()
    |> Util.mostrar_mensaje("el pepe")
  end
end

Cookie.main()
