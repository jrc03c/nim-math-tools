import operatorRangeSeq
import std/sequtils
import std/sugar

proc `+`*(a: bool, b: bool): int =
  if a:
    if b:
      return 2

    return 1

  if b:
    return 1

  return 0

proc `+`*(a: int, b: bool): int =
  if b:
    return a + 1

  return a

proc `+`*(a: bool, b: int): int =
  if a:
    return b + 1

  return b

proc `+`*(a: float, b: bool): float =
  if b:
    return a + 1.0

  return a

proc `+`*(a: bool, b: float): float =
  if a:
    return b + 1

  return b

proc `+`*(a: int, b: float): float =
  return float(a) + b

proc `+`*(a: float, b: int): float =
  return a + float(b)

proc `+`*(a: string, b: string): string =
  return a & b

proc `+`*(a: string, b: bool): string =
  return a & $b

proc `+`*(a: bool, b: string): string =
  return $a & b

proc `+`*(a: string, b: int): string =
  return a & $b

proc `+`*(a: int, b: string): string =
  return $a & b

proc `+`*(a: string, b: float): string =
  return a & $b

proc `+`*(a: float, b: string): string =
  return $a & b

proc `+`*[T](a: seq[T], b: (bool or int or float or string)): seq[untyped] =
  when T is seq or T is (bool or int or float or string):
    return a.map(v => v + b)

  else:
    raise newException(Exception, "$# and $# types cannot be added together!" %
          [T, typeof b])

proc `+`*[T](a: (bool or int or float or string), b: seq[T]): seq[untyped] =
  when T is seq or T is (bool or int or float or string):
    return b.map(v => a + v)

  else:
    raise newException(Exception, "$# and $# types cannot be added together!" %
          [typeof a, T])

proc `+`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  assert len(a) == len(b), "Two sequences can only be added together if they have the same length!"

  return (0 ... len(a) - 1).map(i => a[i] + b[i])

# NOTE: I haven't decided yet whether or not to keep these `+=` operators. They create restrictions on addition that aren't created by adding two things and assigning them to a new variable. (For example, `new float = int + float` works just fine, but `int += float` does not.)

proc `+=`*(a: var int, b: (bool or int)) =
  a = a + b

proc `+=`*(a: var float, b: (bool or int)) =
  a = a + b

proc `+=`*(a: var string, b: (bool or int or float or string)) =
  a = a + b

proc `+=`*(a: var seq[int], b: (bool or int)) =
  a = a + b

proc `+=`*(a: var seq[float], b: (bool or int or float)) =
  a = a + b

proc `+=`*(a: var seq[string], b: (bool or int or float or string)) =
  a = a + b

proc `+=`*(a: var seq[int], b: seq[(bool or int)]) =
  a = a + b

proc `+=`*(a: var seq[float], b: seq[(bool or int or float)]) =
  a = a + b

proc `+=`*(a: var seq[string], b: seq[(bool or int or float or string)]) =
  a = a + b

proc `+=`*[T, U](a: var seq[T], b: U) =
  a = a + b

proc `+=`*[T, U](a: var seq[T], b: seq[U]) =
  a = a + b
