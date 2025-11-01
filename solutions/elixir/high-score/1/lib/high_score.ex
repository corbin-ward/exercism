defmodule HighScore do
  def new() do
    Map.new()
  end

  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    {value, updated_scores} = Map.pop(scores, name)
    updated_scores
  end

  def reset_score(scores, name) do
    Map.put(scores, name, 0)
  end

  def update_score(scores, name, score) do
    case Map.fetch(scores, name) do
      {:ok, existing_score} -> Map.put(scores, name, existing_score + score)
      :error -> Map.put(scores, name, score)
    end
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
