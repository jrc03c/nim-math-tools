import operator_range_seq
import std/math
import std/sequtils
import std/sugar

proc `**`*(a: int, b: int): int =
  return a ^ b

proc `**`*(a: float, b: float): float =
  return pow(a, b)

proc `**`*(a: int, b: float): float =
  return float(a) ** b

proc `**`*(a: float, b: int): float =
  return a ** float(b)

proc `**`*[T](a: seq[T], b: SomeNumber): seq[untyped] =
  return a.map(v => v ** b)

proc `**`*[T](a: SomeNumber, b: seq[T]): seq[untyped] =
  return b.map(v => a ** v)

proc `**`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  assert len(a) == len(b)
  return (0 ... len(a) - 1).map(i => a[i] ** b[i])
