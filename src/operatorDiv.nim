import operatorMul
import operatorRangeSeq
import std/sequtils
import std/sugar

proc `/`*(a: bool, b: bool): int =
  if a:
    if b:
      return 1

    raise newException(Exception, "Boolean division by 0 is not possible!")

  if b:
    return 0

  raise newException(Exception, "Boolean division by 0 is not possible!")

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

proc `/`*(a: int, b: float): float =
  return float(a) / b

proc `/`*(a: float, b: int): float =
  return a / float(b)

proc `/`*(a: string, b: bool): string =
  if b:
    return a

  raise newException(Exception, "String division by 0 is not possible!")

proc `/`*(a: string, b: int): string =
  if b == 0:
    raise newException(Exception, "String division by 0 is not possible!")

  return a * (1.0 / float(b))

proc `/`*(a: string, b: float): string =
  if b == 0.0:
    raise newException(Exception, "String division by 0.0 is not possible!")

  return a * (1.0 / b)

proc `/`*[T](a: seq[T], b: (bool or int or float)): seq[untyped] =
  when T is seq or T is (bool or int or float):
    return a.map(v => v / b)

  else:
    let message = "$# and $# types cannot be divided by one another!" % [
        typeof a, T]

    raise newException(Exception, message)

proc `/`*[T](a: (bool or int or float), b: seq[T]): seq[untyped] =
  when T is seq or T is (bool or int or float):
    return b.map(v => a / v)

  else:
    let message = "$# and $# types cannot be divided by one another!" % [
        typeof a, T]

    raise newException(Exception, message)

proc `/`*(a: seq[string], b: (bool or int or float)): seq[string] =
  return a.map(v => v / b)

proc `/`*(a: string, b: seq[(bool or int or float)]): seq[string] =
  return b.map(v => a / v)

proc `/`*(a: seq[string], b: seq[(bool or int or float)]): seq[string] =
  assert len(a) == len(b), "Two sequences can only be divided by one another if they have the same length!"

  return (0 -> len(a)-1).map(i => a[i] / b[i])

proc `/`*[T, U](a: seq[T], b: U): seq[untyped] =
  return a.map(v => v / b)

proc `/`*[T, U](a: T, b: seq[U]): seq[untyped] =
  return b.map(v => a / v)

proc `/`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  assert len(a) == len(b), "Two sequences can only be divided by one another if they have the same length!"

  return (0 -> len(a)-1).map(i => a[i] / b[i])

# NOTE: I haven't decided yet whether or not to keep these `/=` operators. They create restrictions on division that aren't created by dividing two things and assigning them to a new variable. (For example, `new float = int / float` works just fine, but `int /= float` does not.)

proc `/=`*(a: var int, b: int) =
  a = a div b

proc `/=`*(a: var int, b: bool) =
  a = a / b

proc `/=`*(a: var float, b: (bool or int)) =
  a = a / b

proc `/=`*(a: var string, b: (bool or int or float)) =
  a = a / b

proc `/=`*(a: var seq[int], b: int) =
  a = a.map(v => v div b)

proc `/=`*(a: var seq[int], b: bool) =
  a = a.map(v => v / b)

proc `/=`*(a: var seq[float], b: (bool or int or float)) =
  a = a / b

proc `/=`*(a: var seq[int], b: seq[int]) =
  for i in 0 -> len(a) - 1:
    a[i] = a[i] div b[i]

proc `/=`*(a: var seq[int], b: seq[(bool or int)]) =
  a = a / b

proc `/=`*(a: var seq[float], b: seq[(bool or int or float)]) =
  a = a / b

proc `/=`*[T, U](a: var seq[T], b: U) =
  a = a / b

proc `/=`*[T, U](a: var seq[T], b: seq[U]) =
  a = a / b
