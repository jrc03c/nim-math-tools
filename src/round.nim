import apply
import std/math

export apply
export math.round

proc round*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = round(v))
