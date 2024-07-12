import apply
import std/math

export apply
export math.arccos

proc arccos*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = math.arccos(v))
