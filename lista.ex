defmodule Lista do

  def tak(x) do
    [head | _] = x
    head
  end

  def drp(x) do
    case x do
    [] -> :no
    _ ->  [_|tail] = x
    tail
    end
  end

  def len(l) do
    case l do
      [] -> 0
    _ -> [head|tail] = l
    len(tail) + 1
    end
  end
  def sum(l) do
    case l do
      [] -> 0
  _-> [head|tail] = l
  sum(tail) + head
    end
  end
  def duplicate([]) do []end
  def duplicate([h|t]) do
    [h|[h|duplicate(t)]]
  end
  def add(x, []) do [x] end
  def add(x, [x|t]) do[x|t] end
  def add(x, [h|t]) do [h| add(x,t)] end

  def remove(_, []) do [] end
  def remove(x,[x|t]) do remove(x, t) end
  def remove(x, [h|t]) do [h|remove(x,t)]end

  def unique([]) do [] end
  def unique([h|t]) do [h | remove(h, t) |> unique()] end

  def place(x, []) do [x] end
  def place(x, [h|t]) do [h| add(x, t)] end

  def append([]) do [] end
  def append(n, []) do n end
  def append(n, [h|t]) do append(place(h, n), t) end

def nreverse([]) do [] end

def nreverse([h | t]) do
  r = nreverse(t)
  append(r, [h])
end
def reverse(l) do
  reverse(l, [])
end

def reverse([], r) do r end
def reverse([h | t], r) do
  reverse(t, [h | r])
end

def bench() do
  ls = [16, 32, 64, 128, 256, 512]
  n = 100
  # bench is a closure: a function with an environment.
  bench = fn(l) ->
    seq = Enum.to_list(1..l)
    tn = time(n, fn -> nreverse(seq) end)
    tr = time(n, fn -> reverse(seq) end)
    :io.format("length: ~10w  nrev: ~8w us    rev: ~8w us~n", [l, tn, tr])
  end

  # We use the library function Enum.each that will call
  # bench(l) for each element l in ls
  Enum.each(ls, bench)
end

# Time the execution time of the a function.
def time(n, fun) do
  start = System.monotonic_time(:milliseconds)
  loop(n, fun)
  stop = System.monotonic_time(:milliseconds)
  stop - start
end

# Apply the function n times.
def loop(n, fun) do
  if n == 0 do
    :ok
  else
    fun.()
    loop(n - 1, fun)
  end
end
end
