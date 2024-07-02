import std/math
import std/sequtils

proc drop_nan*(x: seq[float]): seq[float] =
  return filter(x, proc(v: float): bool = not is_nan(v))
