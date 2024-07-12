import apply
import std/math

export apply
export math.exp

proc exp*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = math.exp(v))
