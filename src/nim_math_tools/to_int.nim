import std/sequtils
import std/strutils
import std/sugar

proc to_int*(x: int): int =
  return x

proc to_int*(x: bool): int =
  if x:
    return 1

  return 0

proc to_int*(x: string): int =
  try:
    return parse_int(x)

  except Exception:
    return parse_int(x.split(".")[0])

proc to_int*(x: seq[int]): seq[int] =
  return x.map(v => int(v))

proc to_int*[T](x: seq[T]): seq[untyped] =
  when T is seq:
    return x.map(v => to_int(v))

  else:
    when T is SomeNumber:
      return x.map(v => to_int(v))

    elif T is bool:
      return x.map(v => to_int(v))

    elif T is string:
      var temp: seq[int] = @[]

      for v in x:
        try:
          temp.add(parse_int(v))

        except:
          temp.add(NaN)

      return temp

    else:
      return x.map(v => NaN)

proc int*(x: int): int =
  return x

proc int*(x: float): int =
  return to_int(x)

proc int*(x: bool): int =
  return to_int(x)

proc int*(x: string): int =
  return to_int(x)

proc int*(x: seq[int]): seq[int] =
  return to_int(x)

proc int*[T](x: seq[T]): seq[untyped] =
  return to_int(x)
