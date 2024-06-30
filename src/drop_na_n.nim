import std/math
import std/sequtils

proc drop_na_n*(x: seq[float]): seq[float] =
  return filter(x, proc(v: float): bool = not is_na_n(v))
