import floor
import operator_range_seq
import reverse
import round
import std/sequtils
import std/sugar

proc `*`*(a: bool, b: bool): int =
  if a and b:
    return 1

  return 0

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

proc `*`*(a: string, b: bool): string =
  if b:
    return a

  return ""

proc `*`*(a: bool, b: string): string =
  if a:
    return b

  return ""

proc `*`*(a: string, b: int): string =
  var temp = ""

  if b == 0:
    return temp

  if b > 0:
    for _ in 0 .. b - 1:
      temp = temp & a

  else:
    for _ in 0 .. abs(int(b)) - 1:
      temp = temp & a

    temp = reverse(temp)

  return temp

proc `*`*(a: int, b: string): string =
  return b * a

proc `*`*(a: string, b: float): string =
  var temp = ""

  if b == 0.0:
    return temp

  if b > 0.0:
    for _ in 0 .. int(b) - 1:
      temp = temp & a

    temp = temp & a[0 .. int(round((b - floor(b)) * len(a))) - 1]

  else:
    for _ in 0 .. abs(int(b)) - 1:
      temp = temp & a

    temp = temp & a[0 .. int(round((abs(b) - floor(abs(b))) * len(a))) - 1]
    temp = reverse(temp)

  return temp

proc `*`*(a: float, b: string): string =
  return b * a

proc `*`*[T](a: seq[T], b: (bool or int or float)): seq[untyped] =
  return a.map(v => v * b)

proc `*`*[T](a: (bool or int or float or string), b: seq[T]): seq[untyped] =
  when T is not string:
    return b.map(v => a * v)

  else:
    raise new_exception(Exception, "$# values cannot be multiplied by $# values!" %
        [typeof a, T])

proc `*`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  return (0 ... len(a) - 1).map(i => a[i] * b[i])

proc `-`*(x: bool): bool =
  return not x

proc `-`*(x: string): string =
  return reverse(x)

proc `-`*[T](x: seq[T]): seq[T] =
  return x.map(v => -v)

# NOTE: I haven't decided yet whether or not to keep these `*=` operators. They create restrictions on multiplication that aren't created by multiplying two things and assigning them to a new variable. (For example, `new float = int * float` works just fine, but `int *= float` does not.)

proc `*=`*(a: var int, b: (bool or int)) =
  a = a * b

proc `*=`*(a: var float, b: (bool or int)) =
  a = a * b

proc `*=`*(a: var string, b: (bool or int or float)) =
  a = a * b

proc `*=`*(a: var seq[int], b: (bool or int)) =
  a = a * b

proc `*=`*(a: var seq[float], b: (bool or int or float)) =
  a = a * b

proc `*=`*(a: var seq[string], b: (bool or int or float)) =
  a = a * b

proc `*=`*(a: var seq[int], b: seq[(bool or int)]) =
  a = a * b

proc `*=`*(a: var seq[float], b: seq[(bool or int or float)]) =
  a = a * b

proc `*=`*(a: var seq[string], b: seq[(bool or int or float)]) =
  a = a * b

proc `*=`*[T, U](a: var seq[T], b: U) =
  a = a * b

proc `*=`*[T, U](a: var seq[T], b: seq[U]) =
  a = a * b
