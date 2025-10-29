defmodule LoginServer do
  @moduledoc """
  Programa servidor para manejo de login y registro de usuarios.

  - autor: Juan Pablo Oduver Garcia
  - fecha: 19/08/2025
  - licencia: GNU GPL v3
  """

  use GenServer
  require Logger
  alias ClientData
  alias Util, as: LoginUtil

  # ------------------------------
  # Interfaz del cliente
  # ------------------------------

  def start_link(_args) do
    # El estado guarda los clientes, indexados por cédula (id_number)
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def register(client_data), do: GenServer.call(__MODULE__, {:register, client_data})
  def login(id_number, password), do: GenServer.call(__MODULE__, {:login, id_number, password})

  # ------------------------------
  # Callbacks del Server
  # ------------------------------

  @impl true
  def init(state) do
    Logger.info("SERVER: Login Server iniciado.")
    {:ok, state}
  end

  # ------------------------------
  # Manejo del Registro (handle_call)
  # ------------------------------

  @impl true
  def handle_call({:register, %ClientData{id_number: id} = client}, _from, clients) do

    # Validar datos básicos
    case LoginUtil.validate_registration_data(client) do
      {:error, reason} ->
        {:reply, {:error, {:validation_failed, reason}}, clients}

      {:ok, _} ->
        # Verificar duplicado
        if Map.has_key?(clients, id) do
          {:reply, {:error, :account_exists}, clients}
        else
          # Almacenar el cliente directamente (incluyendo la contraseña en texto)
          new_clients = Map.put(clients, id, client)
          Logger.info("SERVER: Cliente registrado (ID: #{id})")

          # Respuesta simple: "Creado"
          {:reply, {:ok, :created}, new_clients}
        end
    end
  end

  # ------------------------------
  # Manejo del Login (handle_call)
  # ------------------------------
  @impl true
  def handle_call({:login, id, password}, _from, clients) do
    case Map.get(clients, id) do
      # Usuario no encontrado
      nil ->
        {:reply, {:error, :user_not_found}, clients}

      # Usuario encontrado, verificar contraseña comparando strings directamente
      %ClientData{password: stored_password} ->
        if password == stored_password do
          Logger.info("SERVER: Login exitoso para usuario: #{id}")
          {:reply, {:ok, :logged_in}, clients}
        else
          {:reply, {:error, :invalid_password}, clients}
        end
    end
  end

  # ------------------------------
  # Maneja llamadas desconicidas
  # ------------------------------
  @impl true
  def handle_call(request, _from, state) do
    {:reply, {:error, :unknown_request}, state}
  end
end
