import std/sequtils
import std/sugar

proc remap*(x, a, b, c, d: float): float =
  return (d - c) * (x - a) / (b - a) + c

proc remap*[T](x: seq[T], a, b, c, d: float): seq[T] =
  return x.map(v => remap(v, a, b, c, d))
