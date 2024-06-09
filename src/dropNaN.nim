import std/math
import std/sequtils

proc dropNaN*(x: seq[float]): seq[float] =
  return filter(x, proc(v: float): bool = not isNaN(v))
