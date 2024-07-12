import apply
import std/math

export apply
export math.sin

proc sin*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = math.sin(v))
