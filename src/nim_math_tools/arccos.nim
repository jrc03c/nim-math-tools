from math import arccos
import apply

export apply
export arccos

proc arccos*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = arccos(v))
