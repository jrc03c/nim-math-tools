import flatten

export flatten

template max*[T](x: seq[T]): untyped =
  when T is seq:
    max(flatten(x))

  else:
    var highest = low(T)

    for v in x:
      if v > highest:
        highest = v

    highest

proc max*(a: int, b: int): int =
  if a > b:
    return a

  return b

proc max*(a: int, b: float): float =
  let a_float = to_float(a)

  if a_float > b:
    return a_float

  return b

proc max*(a: float, b: int): float =
  return max(b, a)
