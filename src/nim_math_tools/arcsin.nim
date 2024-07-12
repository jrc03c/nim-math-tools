import apply
import std/math

export apply
export math.arcsin

proc arcsin*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = math.arcsin(v))
