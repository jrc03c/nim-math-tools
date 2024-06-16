import math
import apply

export apply
export ln
export log
export log10

proc log*(x: float): float =
  return math.log(x, 10.0)

proc ln*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = ln(v))

proc log*[T](x: seq[T], base: float = 10.0): seq[untyped] =
  let b = log10(base)
  return apply(x, proc(v: float): float = log10(v) / b)

proc log10*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = log10(v))
