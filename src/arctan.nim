from math import arctan
import apply

proc arctan*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = arctan(v))
