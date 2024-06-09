from math import floor
import apply

export floor

proc floor*[T](x: seq[T]): seq[untyped] =
  return apply(x, proc(v: float): float = floor(v))
