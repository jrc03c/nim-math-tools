import math
import std/sequtils
import std/sugar

export math.ceil

proc ceil*(x: int): int =
  return x

proc ceil*(x: bool): float =
  if x:
    return 1.0

  return 0.0

proc ceil*[T](x: seq[T]): seq[untyped] =
  return x.map(v => ceil(v))
