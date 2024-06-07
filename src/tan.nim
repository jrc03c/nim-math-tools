from math import tan
import apply

export tan

proc tan*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = tan(v))
