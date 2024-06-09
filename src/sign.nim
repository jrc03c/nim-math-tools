import std/sequtils
import std/sugar

proc sign*(x: float): float =
  if x > 0.0:
    return 1.0

  if x < 0.0:
    return -1.0

  return 0.0

proc sign*(x: int): int =
  return int(sign(float(x)))

proc sign*[T](x: seq[T]): seq[untyped] =
  return x.map(v => sign(v))
