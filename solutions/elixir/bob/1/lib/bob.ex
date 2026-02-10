defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    input = String.trim(input)
    silence = input === ""
    question = String.ends_with?(input, "?")
    yelling = String.upcase(input) === input and input =~ ~r/\p{L}/
    cond do
      silence -> "Fine. Be that way!"
      question and yelling -> "Calm down, I know what I'm doing!"
      question -> "Sure."
      yelling -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
