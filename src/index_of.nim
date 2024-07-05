import std/sequtils

proc index_of*[T, U](x: seq[T], fn: proc(v: U): bool): seq[int] =
  when T is U:
    for i, other in x:
      if fn(other):
        return @[i]

  else:
    when T is seq:
      for i, other in x:
        let child = index_of(other, fn)

        if len(child) > 0:
          return concat(@[i], child)

    else:
      return newSeq[int]()

type NotProc = concept x
  x isnot proc

proc index_of*[T](x: seq[T], value: NotProc): seq[int] =
  when T is NotProc:
    for i, other in x:
      if other == value:
        return @[i]

  else:
    when T is seq:
      for i, other in x:
        let child = index_of(other, value)

        if len(child) > 0:
          return concat(@[i], child)

    else:
      return newSeq[int]()
