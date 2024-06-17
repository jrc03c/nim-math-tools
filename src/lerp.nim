import operatorRangeSeq
import std/sequtils
import std/sugar

proc lerp*(a: float, b: float, f: float): float =
  return f * (b - a) + a

proc lerp*[T](a: seq[T], b: seq[T], f: float): seq[untyped] =
  assert len(a) == len(b)
  return (0 ... len(a) - 1).map(i => lerp(a[i], b[i], f))

proc lerp*[T](a: float, b: float, f: seq[T]): seq[untyped] =
  return f.map(v => lerp(a, b, v))

proc lerp*[T](a: seq[T], b: seq[T], f: seq[T]): seq[untyped] =
  assert len(a) == len(b)
  assert len(b) == len(f)
  return (0 ... len(a) - 1).map(i => lerp(a[i], b[i], f[i]))
