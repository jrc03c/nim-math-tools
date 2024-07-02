import flatten

export flatten

template min*[T](x: seq[T]): untyped =
  when T is seq:
    min(flatten(x))

  else:
    var lowest = high(T)

    for v in x:
      if v < lowest:
        lowest = v

    lowest

proc min*(a: int, b: int): int =
  if a < b:
    return a

  return b

proc min*(a: int, b: float): float =
  let a_float = to_float(a)

  if a_float < b:
    return a_float

  return b

proc min*(a: float, b: int): float =
  return min(b, a)
