import apply
import innerType
import math

export apply
export innerType
export math.floor

proc floor*(x: bool): float =
  if x:
    return 1.0

  return 0.0

proc floor*[T](x: seq[T]): seq[untyped] =
  type t = innerType(x)
  return apply(x, proc(v: t): float = floor(v))
