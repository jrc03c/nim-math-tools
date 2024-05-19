import operatorDiv
import std/sequtils
import std/sugar

proc divi*(a: bool, b: (bool or int)): int =
  return a / b

proc divi*(a: bool, b: float): float =
  return a / b

proc divi*(a: int, b: bool): int =
  return a / b

proc divi*(a: int, b: int): float =
  return float(a) / float(b)

proc divi*(a: int, b: float): float =
  return a / b

proc divi*(a: float, b: (bool or int or float)): float =
  return a / b

proc divi*(a: string, b: (bool or int or float)): string =
  return a / b

proc divi*[T, U](a: seq[T], b: U): seq[untyped] =
  return a.map(v => v / b)

proc divi*[T, U](a: T, b: seq[U]): seq[untyped] =
  return b.map(v => a / v)

proc divi*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return a / b
