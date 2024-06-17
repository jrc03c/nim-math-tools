from std/random import rand
import apply
import ndarray
import operatorRangeSeq
import std/sequtils
import std/sugar

export apply
export ndarray

proc random*(): float =
  return rand(1.0)

proc random*(n: int): seq[float] =
  return (0 -> n - 1).map(i => random())

template random*(shape: seq[int]): seq[untyped] =
  apply(ndarray(shape, float), proc(v: float): float = random())
