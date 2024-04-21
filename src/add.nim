import rangeSeq
import std/sequtils
import std/sugar

proc add*(a: int, b: int): int =
  return a + b

proc add*(a: float, b: float): float =
  return a + b

proc add*(a: int, b: float): float =
  return float(a) + b

proc add*(a: float, b: int): float =
  return add(b, a)

proc add*(a: int, b: bool): int =
  if b:
    return a + 1

  return a

proc add*(a: bool, b: int): int =
  return add(b, a)

proc add*(a: float, b: bool): float =
  if b:
    return a + 1.0

  return a

proc add*(a: bool, b: float): float =
  return add(b, a)

type NumberOrBool = (SomeNumber or bool)

proc add*[T](a: seq[T], b: NumberOrBool): seq[untyped] =
  return a.map(v => add(v, b))

proc add*[T](a: NumberOrBool, b: seq[T]): seq[untyped] =
  return add(b, a)

proc add*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return (0 -> len(a)-1).map(i => add(a[i], b[i]))

proc `+`*(a: int, b: float): float =
  return add(a, b)

proc `+`*(a: float, b: int): float =
  return add(a, b)

proc `+`*[T](a: seq[T], b: NumberOrBool): seq[untyped] =
  return add(a, b)

proc `+`*[T](a: NumberOrBool, b: seq[T]): seq[untyped] =
  return add(a, b)

proc `+`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return add(a, b)
