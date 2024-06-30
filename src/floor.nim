import apply
import inner_type
import math

export apply
export inner_type
export math.floor

proc floor*(x: bool): float =
  if x:
    return 1.0

  return 0.0

proc floor*[T](x: seq[T]): seq[untyped] =
  type t = inner_type(x)
  return apply(x, proc(v: t): float = floor(v))
