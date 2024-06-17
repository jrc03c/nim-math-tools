from math import sin
import apply

export apply
export sin

proc sin*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = sin(v))
