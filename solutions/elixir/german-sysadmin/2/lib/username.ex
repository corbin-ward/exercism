defmodule Username do
  def sanitize(username) when username == [] do
    []
  end

  def sanitize(username) do
    [head | tail] = username
    case head do
      head when head >= ?a and head <= ?z -> [head] ++ sanitize(tail)
      head when [head] == ~c"_" -> [head] ++ sanitize(tail)
      head when [head] == ~c"ä" -> ~c"ae" ++ sanitize(tail)
      head when [head] == ~c"ö" -> ~c"oe" ++ sanitize(tail)
      head when [head] == ~c"ü" -> ~c"ue" ++ sanitize(tail)
      head when [head] == ~c"ß" -> ~c"ss" ++ sanitize(tail)
      _ -> sanitize(tail)
    end
  end
end
