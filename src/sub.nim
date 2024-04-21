import mul
import rangeSeq
import std/sequtils
import std/sugar

type NumOrBool = (SomeNumber or bool)
type IntOrBool = (int or bool)

proc sub*(a: int, b: int): int =
  return a - b

proc sub*(a: float, b: float): float =
  return a - b

proc sub*(a: int, b: float): float =
  return float(a) - b

proc sub*(a: float, b: int): float =
  return a - float(b)

proc sub*(a: int, b: bool): int =
  if b:
    return a - 1

  return a

proc sub*(a: bool, b: int): int =
  if a:
    return 1 - b

  return -b

proc sub*(a: float, b: bool): float =
  if b:
    return a - 1.0

  return a

proc sub*(a: bool, b: float): float =
  if a:
    return 1.0 - b

  return -b

proc sub*[T](a: seq[T], b: NumOrBool): seq[T] =
  return a.map(v => sub(v, b))

proc sub*[T](a: NumOrBool, b: seq[T]): seq[T] =
  return b.map(v => sub(a, v))

proc sub*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  assert len(a) == len(b)
  return (0 -> len(a) - 1).map(i => sub(a[i], b[i]))

proc `-`*(a: int, b: float): float =
  return sub(a, b)

proc `-`*(a: float, b: int): float =
  return sub(a, b)

proc `-`*[T](a: seq[T], b: NumOrBool): seq[untyped] =
  return sub(a, b)

proc `-`*[T](a: NumOrBool, b: seq[T]): seq[untyped] =
  return sub(a, b)

proc `-`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return sub(a, b)

# NOTE: I haven't decided yet whether or not to keep these `-=` operators. They create restrictions on addition that aren't created by subtracting two things and assigning them to a new variable. (For example, `new float = int - float` works just fine, but `int -= float` does not.)

proc `-=`*(a: var int, b: IntOrBool) =
  a = sub(a, b)

proc `-=`*(a: var float, b: NumOrBool) =
  a = sub(a, b)

proc `-=`*(a: var seq[int], b: IntOrBool) =
  a = sub(a, b)

proc `-=`*(a: var seq[float], b: NumOrBool) =
  a = sub(a, b)

proc `-=`*(a: var seq[int], b: seq[IntOrBool]) =
  a = sub(a, b)

proc `-=`*(a: var seq[float], b: seq[NumOrBool]) =
  a = sub(a, b)

proc `-=`*[T, U](a: var seq[T], b: U) =
  a = sub(a, b)

proc `-=`*[T, U](a: var seq[T], b: seq[U]) =
  a = sub(a, b)
