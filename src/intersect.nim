import inner_type
import set

export inner_type
export set

proc intersect*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  let aset = set[T](a)
  let bset = set[U](b)
  var temp: seq[inner_type(a)] = @[]

  for v in aset:
    if bset.contains(v):
      temp.add(v)

  return temp
