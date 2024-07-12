import apply
import std/math

export apply
export math.cos

proc cos*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = math.cos(v))
