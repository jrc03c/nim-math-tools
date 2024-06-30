import operator_div
import std/sequtils
import std/sugar

proc divide*(a: bool, b: (bool or int)): int =
  return a / b

proc divide*(a: bool, b: float): float =
  return a / b

proc divide*(a: int, b: bool): int =
  return a / b

proc divide*(a: int, b: int): float =
  return float(a) / float(b)

proc divide*(a: int, b: float): float =
  return a / b

proc divide*(a: float, b: (bool or int or float)): float =
  return a / b

proc divide*(a: string, b: (bool or int or float)): string =
  return a / b

proc divide*[T, U](a: seq[T], b: U): seq[untyped] =
  return a.map(v => v / b)

proc divide*[T, U](a: T, b: seq[U]): seq[untyped] =
  return b.map(v => a / v)

proc divide*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return a / b
