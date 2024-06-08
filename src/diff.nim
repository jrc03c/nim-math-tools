import innerType
import set

export innerType
export set

proc diff*[T](a: seq[T], b: seq[T]): seq[untyped] =
  let aset = set[T](a)
  let bset = set[T](b)
  var temp: seq[innerType(a)] = @[]

  for v in aset:
    if not bset.contains(v):
      temp.add(v)

  return temp
