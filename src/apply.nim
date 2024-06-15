import std/sequtils
import std/sugar

template apply*[T, U, V](x: T, fn: proc(u: U): V): untyped =
  when T is seq:
    x.map(v => apply(v, fn))

  else:
    fn(x)
