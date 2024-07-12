import std/sequtils
import std/strutils
import std/sugar

proc to_float*(x: float): float =
  return x

proc to_float*(x: bool): float =
  if x:
    return 1.0

  return 0.0

proc to_float*(x: string): float =
  try:
    return parse_float(x)

  except CatchableError:
    return NaN

proc to_float*(x: seq[int]): seq[float] =
  return x.map(v => float(v))

proc to_float*[T](x: seq[T]): seq[untyped] =
  when T is seq:
    return x.map(v => to_float(v))

  else:
    when T is SomeNumber:
      return x.map(v => to_float(v))

    elif T is bool:
      return x.map(v => to_float(v))

    elif T is string:
      var temp: seq[float] = @[]

      for v in x:
        try:
          temp.add(parse_float(v))

        except CatchableError:
          temp.add(NaN)

      return temp

    else:
      return x.map(v => NaN)

proc float*(x: float): float =
  return to_float(x)

proc float*(x: bool): float =
  return to_float(x)

proc float*(x: string): float =
  return to_float(x)

proc float*(x: seq[int]): seq[float] =
  return to_float(x)

proc float*[T](x: seq[T]): seq[untyped] =
  return to_float(x)
