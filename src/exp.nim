from math import exp
import apply

export exp

proc exp*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = exp(v))
