defmodule Recursion do

  @doc """
  Compute the product between of n and m.

  product of n and m :
    if n is 0
      then ...
    otherwise
      the result ...
  """
  def prod(m, n) do
    case m do
      m when m==0 -> 0
      m when m > 0 -> n + prod(m-1, n)
      m when m < 0 -> prod(m+1, n) - n
      _ -> "not numeric!"
    end
  end

  def power(m, n, o) do
    case m do
      m when m == 0 -> 1
      m when m == 1 -> n
      _ -> power(m-1, prod(o, n), o)
    end
  end

  def fib(n) do
    case n do
      0 -> 0
      1 -> 1
      _ -> fib(n-1) + fib(n-2)
      end
  end
end
