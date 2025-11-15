defmodule BasketballWebsite do
  def extract_from_path(data, path) when is_binary(path) do
    keys = String.split(path, ".")
    extract_from_path(data, keys)
  end

  def extract_from_path(current_data, []) do
    current_data
  end

  def extract_from_path(current_data, [head | tail]) when is_map(current_data) do
    next_data = Access.get(current_data, head)
    extract_from_path(next_data, tail)
  end

  def extract_from_path(_non_map_data, [_ | _]) do
    nil
  end

  def get_in_path(data, path) do
    keys = String.split(path, ".")
    get_in(data, keys)
  end
end
