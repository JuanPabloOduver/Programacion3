defmodule Sudoku do
 @moduledoc """
  Módulo para verificar un descuento por la antiguedad del cliente.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 13/09/2025
  - licencia: GNU GPL v3
  """

  # ------------------------------
  # Función principal para mostrar el sudoku e intentar resolverlo.
  # ------------------------------

  def solve(grid) do
    IO.puts("--- Tablero Inicial ---")
    print_grid(grid)
    IO.puts("--- Iniciando Solución ---")

    case solve_sudoku(grid) do
      {:ok, solved_grid} ->
        IO.puts("--- Solución Encontrada ---")
        print_grid(solved_grid)

      :no_solution ->
        IO.puts("No existe solución para el tablero dado.")
    end
  end

  # ------------------------------
  # Funcion que imprime el tablero de sudoku en un formato legible.
  # ------------------------------

  def print_grid(grid) do
    grid
    |> Enum.with_index()
    |> Enum.each(fn {row, r_idx} ->

      # Formato de línea con separación de cajas 3x3
      row_str = row
        |> Enum.with_index()
        |> Enum.map_join(" ", fn {cell, c_idx} ->
          val = if cell == 0, do: ".", else: Integer.to_string(cell)
          if rem(c_idx + 1, 3) == 0 and c_idx < 8, do: "#{val} |", else: val
        end)

      IO.puts(row_str)

      # Separador horizontal de cajas 3x3
      if rem(r_idx + 1, 3) == 0 and r_idx < 8 do
        IO.puts("---------------------")
      end
    end)
  end

  # ------------------------------
  # Función para solucionar a través de backtracking el sudoku.
  # ------------------------------

  defp solve_sudoku(grid) do
    case find_empty_location(grid) do
      # Caso base: No hay celdas vacías (0), el tablero está resuelto.
      :done ->
        {:ok, grid}

      # Caso recursivo: Encontramos una celda vacía en {row, col}.
      {:ok, {row, col}} ->
        # Iteramos sobre los números del 1 al 9.
        Enum.reduce_while(1..9, :no_solution, fn num, _acc ->
          if safe?(grid, row, col, num) do
            # 1. Asignación tentativa (crear un nuevo tablero inmutable)
            new_grid = place_number(grid, row, col, num)

            # 2. Llamada recursiva
            case solve_sudoku(new_grid) do
              {:ok, solved_grid} ->
                # Éxito: Detener la iteración y devolver el tablero resuelto.
                {:halt, {:ok, solved_grid}}

              :no_solution ->
                # Falla: Continuar la iteración (se intentará con el siguiente 'num').
                {:cont, :no_solution}
            end
          else
            # No es seguro: Continuar la iteración (se intentará con el siguiente 'num').
            {:cont, :no_solution}
          end
        end)
    end
  end
  # ------------------------------
  # Función que busca la primera celda vacía (0) y devuelve {:ok, {row, col}} o :done.
  # ------------------------------

  defp find_empty_location(grid) do
    result = grid
    |> Enum.with_index()
    |> Enum.reduce_while(:not_found, fn {row_list, r}, _acc ->
      case Enum.find_index(row_list, fn cell -> cell == 0 end) do
        nil ->
          # La fila no tiene 0s, continuar buscando.
          {:cont, :not_found}
        c ->
          # Encontrado, detener y devolver {r, c}.
          {:halt, {:ok, {r, c}}}
      end
    end)

    case result do
      :not_found -> :done
      {:ok, {r, c}} -> {:ok, {r, c}}
    end
  end

  # ------------------------------
  # Función que crea un nuevo tablero inmutable colocando 'num' en {row_idx, col_idx}.
  # ------------------------------

  defp place_number(grid, row_idx, col_idx, num) do
    # 1. Obtener la fila a modificar.
    row_to_update = Enum.at(grid, row_idx)
    # 2. Modificar la fila (el valor anterior es ignorado por fn _ -> num end)
    new_row = List.replace_at(row_to_update, col_idx, num)
    # 3. Reemplazar la fila en el grid.
    List.replace_at(grid, row_idx, new_row)
  end

  # ------------------------------
  # Función que verifica que el número 'num' sea válido en la ubicación {row, col}.
  # ------------------------------

  defp safe?(grid, row, col, num) do
    not used_in_row(grid, row, num) and
    not used_in_col(grid, col, num) and
    not used_in_box(grid, row, col, num)
  end

  # ------------------------------
  # Función que retorna 'true' si 'num' ya está en la fila.
  # ------------------------------

  defp used_in_row(grid, row, num) do
    row_list = Enum.at(grid, row)
    Enum.member?(row_list, num)
  end

  # ------------------------------
  # Función que retorna 'true' si 'num' ya está en la columna.
  # ------------------------------

  defp used_in_col(grid, col, num) do
    grid
    |> Enum.map(fn row_list -> Enum.at(row_list, col) end)
    |> Enum.member?(num)
  end

  # ------------------------------
  # Función que retorna 'true' si 'num' ya está en la caja 3x3.
  # ------------------------------

  defp used_in_box(grid, row, col, num) do
    start_row = row - rem(row, 3)
    start_col = col - rem(col, 3)

    # Extraer las celdas de la caja y verificar si el número es miembro.
    1..3
    |> Enum.flat_map(fn i ->
      row_idx = start_row + i - 1
      row_list = Enum.at(grid, row_idx)
      1..3
      |> Enum.map(fn j ->
        col_idx = start_col + j - 1
        Enum.at(row_list, col_idx)
      end)
    end)
    |> Enum.member?(num)
  end
end


# Tablero inicial.

grid = [
  [3, 0, 6, 5, 0, 8, 4, 0, 0],
  [5, 2, 0, 0, 0, 0, 0, 0, 0],
  [0, 8, 7, 0, 0, 0, 0, 3, 1],
  [0, 0, 3, 0, 1, 0, 0, 8, 0],
  [9, 0, 0, 8, 6, 3, 0, 0, 5],
  [0, 5, 0, 0, 9, 0, 6, 0, 0],
  [1, 3, 0, 0, 0, 0, 2, 5, 0],
  [0, 0, 0, 0, 0, 0, 0, 7, 4],
  [0, 0, 5, 2, 0, 6, 3, 0, 0]
]

# Llamamos a la función principal
Sudoku.solve(grid)
