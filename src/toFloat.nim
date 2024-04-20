import std/sequtils
import std/strutils
import std/sugar

proc toFloat*(x: seq[int]): seq[float] =
  return x.map(v => float(v))

proc toFloat*[T](x: seq[T]): seq[untyped] =
  when T is seq:
    return x.map(v => toFloat(v))

  else:
    when T is SomeNumber:
      return x.map(v => toFloat(v))

    elif T is string:
      return x.map(v => parseFloat(v))

    else:
      return x.map(v => NaN)
