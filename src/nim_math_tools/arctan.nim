import apply
import std/math

export apply
export math.arctan

proc arctan*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = math.arctan(v))
