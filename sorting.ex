defmodule Sorting do
  def insert(element, []) do [element] end

  def insert(element, [h|t]) do
    case h do
      h when element < h -> [element|[h|t]]
      _-> [h|insert(element, t)]
    end
  end

  def isort([h|t]) do isort([h],t) end

  def isort(sorted, [h|t]) do
    cond do
      t == [] -> insert(h,sorted)
      true-> isort(insert(h, sorted), t)
    end
  end

  def msort(l) do
    case l do
        [x] -> [x]
        _ ->
            {left, right} = msplit(l, [], [])
            merge(msort(left), msort(right))
    end
end

def merge([], right) do right end
def merge(left, []) do left end
def merge([lhead|ltail], [rhead|rtail]) do
    if lhead < rhead do
        [lhead|merge( ltail, [rhead|rtail])]
    else
        [rhead|merge([lhead|ltail], rtail)]
end
end
def msplit(l, left, right) do
    case l do
        []  -> {left, right}
        [head|tail] -> msplit(tail, right, [head|left])
    end
end
def qsort([]) do [] end
def qsort([p | l]) do
  {small, large} = qsplit(p, l, [], [])
  small = qsort(small)
  large = qsort(large)
  append(small, [p | large])
end


def qsplit(_, [], small, large) do {small, large} end
def qsplit(p, [h | t], small, large) do
  if h <= p  do
    qsplit(p, t, [h|small], large)
  else
    qsplit(p, t, small, [h|large])
  end
end

def append(left, right) do
  case left do
    [] -> right
    [h | t] -> [h|append(t,right)]
  end
end
end
