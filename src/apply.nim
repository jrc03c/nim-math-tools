import std/sequtils
import std/sugar

proc apply*[T, U](x: seq[T], fn: proc(v: U): U): seq[untyped] =
  when T is seq:
    return x.map(v => apply(v, fn))

  else:
    return x.map(v => fn(v))
