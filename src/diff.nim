import innerType
import set

export innerType
export set

# NOTE: This function only finds the elements in `a` that are not in `b`; it
# does NOT also find elements in `b` that are not in `a`!

proc diff*[T](a: seq[T], b: seq[T]): seq[untyped] =
  let aset = set[T](a)
  let bset = set[T](b)
  var temp: seq[innerType(a)] = @[]

  for v in aset:
    if not bset.contains(v):
      temp.add(v)

  return temp
