from math import ln, log, log10
import apply

export ln, log, log10

proc ln*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = ln(v))

proc log*[T](x: seq[T], base: float = 10.0): seq[untyped] =
  let b = log10(base)
  return apply(x, proc(v: float): float = log10(v) / b)

proc log10*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = log10(v))
