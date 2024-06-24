import apply
import operatorRangeSeq
import random
import std/math
import std/sequtils
import std/sugar
import zeros

export apply
export zeros

proc normal*(): float =
  let u1 = random()
  let u2 = random()
  return math.sqrt(-2.0 * math.ln(u1)) * math.cos(2.0 * math.PI * u2)

proc normal*(n: int): seq[float] =
  return (0 ... n - 1).map(i => normal())

template normal*(shape: seq[int]): seq[untyped] =
  apply(ndarray(shape, float), proc(v: float): float = normal())
