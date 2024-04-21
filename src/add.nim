import rangeSeq
import std/sequtils
import std/sugar

type NumOrBool = (SomeNumber or bool)
type IntOrBool = (int or bool)

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

proc add*[T](a: seq[T], b: NumOrBool): seq[untyped] =
  return a.map(v => add(v, b))

proc add*[T](a: NumOrBool, b: seq[T]): seq[untyped] =
  return add(b, a)

proc add*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  assert len(a) == len(b)
  return (0 -> len(a)-1).map(i => add(a[i], b[i]))

proc `+`*(a: int, b: float): float =
  return add(a, b)

proc `+`*(a: float, b: int): float =
  return add(a, b)

proc `+`*[T](a: seq[T], b: NumOrBool): seq[untyped] =
  return add(a, b)

proc `+`*[T](a: NumOrBool, b: seq[T]): seq[untyped] =
  return add(a, b)

proc `+`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return add(a, b)

# NOTE: I haven't decided yet whether or not to keep these `+=` operators. They create restrictions on addition that aren't created by adding two things and assigning them to a new variable. (For example, `new float = int + float` works just fine, but `int += float` does not.)

proc `+=`*(a: var int, b: IntOrBool) =
  a = add(a, b)

proc `+=`*(a: var float, b: IntOrBool) =
  a = add(a, b)

proc `+=`*(a: var seq[int], b: IntOrBool) =
  a = add(a, b)

proc `+=`*(a: var seq[float], b: NumOrBool) =
  a = add(a, b)

proc `+=`*(a: var seq[int], b: seq[IntOrBool]) =
  a = add(a, b)

proc `+=`*(a: var seq[float], b: seq[NumOrBool]) =
  a = add(a, b)

proc `+=`*[T, U](a: var seq[T], b: U) =
  a = add(a, b)

proc `+=`*[T, U](a: var seq[T], b: seq[U]) =
  a = add(a, b)
