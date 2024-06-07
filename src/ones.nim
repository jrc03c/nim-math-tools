import std/sequtils
import std/sugar
import zeros

export zeros

template ones*(shape: openArray[int]): seq[untyped] =
  proc helper[T](x: seq[T]): seq[untyped] =
    when T is seq:
      return x.map(v => helper(v))

    else:
      return x.map(v => 1.0)

  helper(zeros(shape))
