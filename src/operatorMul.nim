import operatorRangeSeq
import std/sequtils
import std/sugar

type NumberOrBool = (SomeNumber or bool)
type IntOrBool = (int or bool)

proc `*`*(a: int, b: bool): int =
  if b:
    return a

  return 0

proc `*`*(a: bool, b: int): int =
  if a:
    return b

  return 0

proc `*`*(a: float, b: bool): float =
  if b:
    return a

  return 0.0

proc `*`*(a: bool, b: float): float =
  if a:
    return b

  return 0.0

proc `*`*(a: int, b: float): float =
  return float(a) * b

proc `*`*(a: float, b: int): float =
  return a * float(b)

proc `*`*[T](a: seq[T], b: NumberOrBool): seq[untyped] =
  return a.map(v => v * b)

proc `*`*[T](a: NumberOrBool, b: seq[T]): seq[untyped] =
  return b.map(v => a * v)

proc `*`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return (0 -> len(a)-1).map(i => a[i] * b[i])

proc `-`*(a: bool): bool =
  return not a

proc `-`*[T](a: seq[T]): seq[T] =
  return a.map(v => -v)

# NOTE: I haven't decided yet whether or not to keep these `*=` operators. They create restrictions on addition that aren't created by multiplying two things and assigning them to a new variable. (For example, `new float = int * float` works just fine, but `int *= float` does not.)

proc `*=`*(a: var int, b: IntOrBool) =
  a = a * b

proc `*=`*(a: var float, b: IntOrBool) =
  a = a * b

proc `*=`*(a: var seq[int], b: IntOrBool) =
  a = a * b

proc `*=`*(a: var seq[float], b: NumberOrBool) =
  a = a * b

proc `*=`*(a: var seq[int], b: seq[IntOrBool]) =
  a = a * b

proc `*=`*(a: var seq[float], b: seq[NumberOrBool]) =
  a = a * b

proc `*=`*[T, U](a: var seq[T], b: U) =
  a = a * b

proc `*=`*[T, U](a: var seq[T], b: seq[U]) =
  a = a * b
