defmodule Username do
  def sanitize(username) when username == [] do
    []
  end

  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
    [head | tail] = username
    case head do
      head when head >= 97 and head <= 122 -> [head] ++ sanitize(tail)
      head when [head] == ~c"_" -> [head] ++ sanitize(tail)
      head when [head] == ~c"ä" -> ~c"ae" ++ sanitize(tail)
      head when [head] == ~c"ö" -> ~c"oe" ++ sanitize(tail)
      head when [head] == ~c"ü" -> ~c"ue" ++ sanitize(tail)
      head when [head] == ~c"ß" -> ~c"ss" ++ sanitize(tail)
      _ -> sanitize(tail)
    end
  end
end
