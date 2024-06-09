import apply

proc ceil*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = ceil(v))
