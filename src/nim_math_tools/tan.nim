import apply
import std/math

export apply
export math.tan

proc tan*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = math.tan(v))
