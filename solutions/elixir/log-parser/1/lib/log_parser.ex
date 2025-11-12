defmodule LogParser do
  def valid_line?(line) do
    String.starts_with?(line, ["[DEBUG]", "[INFO]", "[WARNING]", "[ERROR]"])
  end

  def split_line(line) do
    regex = ~r/<[~*=-]*>/
    String.split(line, regex, trim: true)
  end

  def remove_artifacts(line) do
    regex = ~r/end-of-line\d+/i
    String.replace(line, regex, "")
  end

  def tag_with_user_name(line) do
    regex = ~r/User\s+(?<username>\S+)/
    case Regex.named_captures(regex, line) do
      nil -> line
      %{"username" => username} -> "[USER] " <> username <> " " <> line
    end
  end
end
