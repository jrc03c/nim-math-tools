from math import round
import apply

export round

proc round*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = round(v))
