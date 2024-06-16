import innerType
import set

export innerType
export set

proc intersect*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  let aset = set[T](a)
  let bset = set[U](b)
  var temp: seq[innerType(a)] = @[]

  for v in aset:
    if bset.contains(v):
      temp.add(v)

  return temp
