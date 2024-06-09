import std/sequtils
import std/strutils
import std/sugar

proc toInt*(x: int): int =
  return x

proc toInt*(x: bool): int =
  if x:
    return 1

  return 0

proc toInt*(x: string): int =
  try:
    return parseInt(x)

  except Exception:
    return parseInt(x.split(".")[0])

proc toInt*(x: seq[int]): seq[int] =
  return x.map(v => int(v))

proc toInt*[T](x: seq[T]): seq[untyped] =
  when T is seq:
    return x.map(v => toInt(v))

  else:
    when T is SomeNumber:
      return x.map(v => toInt(v))

    elif T is bool:
      return x.map(v => toInt(v))

    elif T is string:
      var temp: seq[int] = @[]

      for v in x:
        try:
          temp.add(parseInt(v))

        except:
          temp.add(NaN)

      return temp

    else:
      return x.map(v => NaN)

proc int*(x: int): int =
  return x

proc int*(x: float): int =
  return toInt(x)

proc int*(x: bool): int =
  return toInt(x)

proc int*(x: string): int =
  return toInt(x)

proc int*(x: seq[int]): seq[int] =
  return toInt(x)

proc int*[T](x: seq[T]): seq[untyped] =
  return toInt(x)
