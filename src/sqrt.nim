from math import sqrt
import std/sequtils
import std/sugar

proc sqrt*[T](x: seq[T]): seq[untyped] =
  return x.map(v => sqrt(v))
