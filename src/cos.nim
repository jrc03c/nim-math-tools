from math import cos
import apply

export apply
export cos

proc cos*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = cos(v))
