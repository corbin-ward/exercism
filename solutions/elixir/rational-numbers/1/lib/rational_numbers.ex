defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {a1, a2} = a
    {b1, b2} = b
    sum = {(a1 * b2 + b1 * a2), (a2 * b2)}
    reduce(sum)
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {a1, a2} = a
    {b1, b2} = b
    difference = {(a1 * b2 - b1 * a2), (a2 * b2)}
    reduce(difference)
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {a1, a2} = a
    {b1, b2} = b
    product = {(a1 * b1), (a2 * b2)}
    reduce(product)
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {a1, a2} = num
    {b1, b2} = den
    quotient = {(a1 * b2), (a2 * b1)}
    reduce(quotient)
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {a1, a2} = a
    abs = {Kernel.abs(a1), Kernel.abs(a2)}
    reduce(abs)
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {a1, a2} = a
    pow =
      cond do
        n > 0 -> {Integer.pow(a1, n), Integer.pow(a2, n)}
        n < 0 -> {Integer.pow(a2, -n), Integer.pow(a1, -n)}
        n == 0 -> {1, 1}
      end

    reduce(pow)
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    {n1, n2} = n
    x ** (n1 / n2)
  end

  @spec gcd(a :: rational) :: integer
  def gcd(a) do
    {a1, a2} = a
    if a2 == 0 do
      a1
    else
      gcd({a2, rem(a1, a2)})
    end
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) do
    common_divisor = Kernel.abs(gcd(a))
    {a1, a2} = a
    if a2 < 0 do
      reduced = {div(a1, common_divisor) * -1, div(a2, common_divisor) * -1}
    else
      reduced = {div(a1, common_divisor), div(a2, common_divisor)}
    end
  end
end
