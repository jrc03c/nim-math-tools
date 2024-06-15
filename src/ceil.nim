import apply
import std/math

export apply
export math.ceil

proc ceil*(x: bool): float =
  if x:
    return 1.0

  return 0.0

proc ceil*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = math.ceil(v))
