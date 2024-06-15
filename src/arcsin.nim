from math import arcsin
import apply

export apply
export arcsin

proc arcsin*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = arcsin(v))
