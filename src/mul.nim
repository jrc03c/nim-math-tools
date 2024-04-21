import rangeSeq
import std/sequtils
import std/sugar

type NumberOrBool = (SomeNumber or bool)
type IntOrBool = (int or bool)

proc mul*(a: int, b: int): int =
  return a * b

proc mul*(a: float, b: float): float =
  return a * b

proc mul*(a: int, b: float): float =
  return float(a) * b

proc mul*(a: float, b: int): float =
  return mul(b, a)

proc mul*(a: int, b: bool): int =
  if b:
    return a

  return 0

proc mul*(a: bool, b: int): int =
  return mul(b, a)

proc mul*(a: float, b: bool): float =
  if b:
    return a

  return 0

proc mul*(a: bool, b: float): float =
  return mul(b, a)

proc mul*[T](a: seq[T], b: NumberOrBool): seq[untyped] =
  return a.map(v => mul(v, b))

proc mul*[T](a: NumberOrBool, b: seq[T]): seq[untyped] =
  return mul(b, a)

proc mul*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return (0 -> len(a)-1).map(i => mul(a[i], b[i]))

proc `*`*(a: int, b: float): float =
  return mul(a, b)

proc `*`*(a: float, b: int): float =
  return mul(a, b)

proc `*`*[T](a: seq[T], b: NumberOrBool): seq[untyped] =
  return mul(a, b)

proc `*`*[T](a: NumberOrBool, b: seq[T]): seq[untyped] =
  return mul(a, b)

proc `*`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return mul(a, b)

proc `-`*(a: bool): bool =
  return not a

proc `-`*[T](a: seq[T]): seq[T] =
  return a.map(v => -v)

# NOTE: I haven't decided yet whether or not to keep these `*=` operators. They create restrictions on addition that aren't created by multiplying two things and assigning them to a new variable. (For example, `new float = int * float` works just fine, but `int *= float` does not.)

proc `*=`*(a: var int, b: IntOrBool) =
  a = mul(a, b)

proc `*=`*(a: var float, b: IntOrBool) =
  a = mul(a, b)

proc `*=`*(a: var seq[int], b: IntOrBool) =
  a = mul(a, b)

proc `*=`*(a: var seq[float], b: NumberOrBool) =
  a = mul(a, b)

proc `*=`*(a: var seq[int], b: seq[IntOrBool]) =
  a = mul(a, b)

proc `*=`*(a: var seq[float], b: seq[NumberOrBool]) =
  a = mul(a, b)

proc `*=`*[T, U](a: var seq[T], b: U) =
  a = mul(a, b)

proc `*=`*[T, U](a: var seq[T], b: seq[U]) =
  a = mul(a, b)
