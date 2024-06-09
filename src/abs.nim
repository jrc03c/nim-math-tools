import apply

proc abs*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = abs(v))
