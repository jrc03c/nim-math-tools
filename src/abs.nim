import std/sequtils
import std/sugar

proc abs*(x: bool): float =
  if x:
    return 1.0

  return 0.0

proc abs*[T](x: seq[T]): seq[untyped] =
  return x.map(v => abs(v))
