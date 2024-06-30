import math
import apply

export apply
export ln
export log
export log_1_0

proc log*(x: float): float =
  return math.log(x, 10.0)

proc ln*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = ln(v))

proc log*[T](x: seq[T], base: float = 10.0): seq[untyped] =
  let b = log_1_0(base)
  return apply(x, proc(v: float): float = log_1_0(v) / b)

proc log_1_0*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = log_1_0(v))
