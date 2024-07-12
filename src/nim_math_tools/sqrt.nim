import std/math
import std/sequtils
import std/sugar

export math.sqrt

proc sqrt*(x: int): float =
  return math.sqrt(float(x))

proc sqrt*[T](x: seq[T]): seq[untyped] =
  when T is seq:
    return x.map(v => sqrt(v))

  else:
    return x.map(v => sqrt(v))
