import operatorRangeSeq
import std/sequtils
import std/sugar

type NumOrBool = (SomeNumber or bool)
type IntOrBool = (int or bool)

proc `/`*(a: int, b: bool): int =
  if b:
    return a

  raise newException(Exception, "Integer division by 0 is not possible!")

proc `/`*(a: bool, b: int): int =
  if a:
    return 1 div b

  return 0

proc `/`*(a: float, b: bool): float =
  if b:
    return a

  return NaN

proc `/`*(a: bool, b: float): float =
  if a:
    return 1.0 / b

  return 0.0

proc `/`*(a: int, b: int): float =
  return float(a) / float(b)

proc `/`*(a: int, b: float): float =
  return float(a) / b

proc `/`*(a: float, b: int): float =
  return a / float(b)

proc `/`*[T](a: seq[T], b: NumOrBool): seq[untyped] =
  when T is seq or T is NumOrBool:
    return a.map(v => v / b)

  else:
    raise newException(Exception, "$# and $# types cannot be divided by one another!" %
          [T, typeof b])

proc `/`*[T](a: NumOrBool, b: seq[T]): seq[untyped] =
  when T is seq or T is NumOrBool:
    return b.map(v => a / v)

  else:
    raise newException(Exception, "$# and $# types cannot be divided by one another!" %
          [typeof a, T])

proc `/`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  assert len(a) == len(b), "Two sequences can only be divided by one another if they have the same length!"

  return (0 -> len(a)-1).map(i => a[i] / b[i])

# NOTE: I haven't decided yet whether or not to keep these `/=` operators. They create restrictions on division that aren't created by dividing two things and assigning them to a new variable. (For example, `new float = int / float` works just fine, but `int /= float` does not.)

proc `/=`*(a: var int, b: IntOrBool) =
  a = a / b

proc `/=`*(a: var float, b: IntOrBool) =
  a = a / b

proc `/=`*(a: var seq[int], b: IntOrBool) =
  a = a / b

proc `/=`*(a: var seq[float], b: NumOrBool) =
  a = a / b

proc `/=`*(a: var seq[int], b: seq[IntOrBool]) =
  a = a / b

proc `/=`*(a: var seq[float], b: seq[NumOrBool]) =
  a = a / b

proc `/=`*[T, U](a: var seq[T], b: U) =
  a = a / b

proc `/=`*[T, U](a: var seq[T], b: seq[U]) =
  a = a / b
