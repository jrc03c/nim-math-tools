import operatorRangeSeq
import std/sequtils
import std/sugar

proc lerp*(a: float, b: float, f: float): float =
  return f * (b - a) + a

proc lerp*[T](a: seq[T], b: seq[T], f: float): seq[untyped] =
  return (0 -> len(a) - 1).map(i => lerp(a[i], b[i], f))
