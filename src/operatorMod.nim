from std/math import `mod`
import operatorRangeSeq
import std/sequtils
import std/sugar

proc `mod`*[T](a: seq[T], b: SomeNumber): seq[untyped] =
  return a.map(v => v mod b)

proc `mod`*[T](a: SomeNumber, b: seq[T]): seq[untyped] =
  return b.map(v => a mod v)

proc `mod`*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  assert len(a) == len(b)
  return (0 -> len(a) - 1).map(i => a[i] mod b[i])

template `%`*(a: typed, b: typed): untyped =
  a mod b
