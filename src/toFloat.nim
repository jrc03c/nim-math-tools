import std/sequtils
import std/strutils
import std/sugar

proc toFloat*(x: bool): float =
  if x:
    return 1

  return 0

proc toFloat*(x: string): float =
  try:
    return parseFloat(x)

  except:
    return NaN

proc toFloat*(x: seq[int]): seq[float] =
  return x.map(v => float(v))

proc toFloat*[T](x: seq[T]): seq[untyped] =
  when T is seq:
    return x.map(v => toFloat(v))

  else:
    when T is SomeNumber:
      return x.map(v => toFloat(v))

    elif T is bool:
      return x.map(v => toFloat(v))

    elif T is string:
      var temp: seq[float] = @[]

      for v in x:
        try:
          temp.add(parseFloat(v))

        except:
          temp.add(NaN)

      return temp

    else:
      return x.map(v => NaN)

proc float*(x: bool): float =
  return toFloat(x)

proc float*(x: string): float =
  return toFloat(x)

proc float*(x: seq[int]): seq[float] =
  return toFloat(x)

proc float*[T](x: seq[T]): seq[untyped] =
  return toFloat(x)
