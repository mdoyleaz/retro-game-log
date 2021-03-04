defmodule RetroGameLogWeb.Resolvers.Common do
  alias Absinthe.Resolution

  def empty, do: fn _, _ -> {:ok, %{}} end

  def alias_of(field) when is_atom(field) do
    fn parent, _, _ ->
      {:ok, Map.get(parent, field)}
    end
  end

  def list_length(field) when is_atom(field) do
    fn parent, _, _ ->
      case Map.get(parent, field) do
        list when is_list(list) -> {:ok, length(list)}
        _ -> {:error, :not_a_list_field}
      end
    end
  end

  def enumify do
    fn parent, _args, res ->
      field = get_field_name(res)

      case Map.get(parent, field) do
        nil ->
          {:ok, nil}

        value when is_binary(value) ->
          {:ok, String.to_existing_atom(value)}

        value when is_atom(value) ->
          {:ok, value}
      end
    end
  end

  defp get_field_name(%Resolution{definition: %{schema_node: %{identifier: id}}}) do
    id
  end

  def child_field(path) when is_list(path) do
    fn parent, _, _ ->
      keys = Enum.map(path, &Access.key/1)
      {:ok, get_in(parent, keys)}
    end
  end

  def transform(resolver, transformer)
      when is_function(resolver, 2) and is_function(transformer, 1) do
    fn args, resolution ->
      case resolver.(args, resolution) do
        {:ok, result} -> {:ok, transformer.(result)}
        other -> other
      end
    end
  end

  def transform(resolver, transformer)
      when is_function(resolver, 3) and is_function(transformer, 1) do
    fn parent, args, resolution ->
      case resolver.(parent, args, resolution) do
        {:ok, result} -> {:ok, transformer.(result)}
        other -> other
      end
    end
  end
end
