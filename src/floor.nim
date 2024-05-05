import math
import std/sequtils
import std/sugar

export math.floor

proc floor*(x: int): int =
  return x

proc floor*(x: bool): float =
  if x:
    return 1.0

  return 0.0

proc floor*[T](x: seq[T]): seq[untyped] =
  return x.map(v => floor(v))
