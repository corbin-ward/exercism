defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort(inventory, &(&1.price <= &2.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> item.price === nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item -> %{item | name: String.replace(item.name, old_word, new_word)} end)
  end

  def increase_quantity(item, count) do
    new_quantities = item.quantity_by_size
    |> Enum.map(fn {size, quantity} -> {size, quantity + count} end)
    |> Map.new()

    %{item | quantity_by_size: new_quantities}
  end

  def total_quantity(item) do
    quantity = item.quantity_by_size
    |> Enum.reduce(0, fn {_, quantity}, acc -> acc + quantity end)
  end
end
