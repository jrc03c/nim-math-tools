import innerType
import set

export innerType
export set

# NOTE: This function only finds the elements in `a` that are not in `b`; it
# does NOT also find elements in `b` that are not in `a`!

proc diff*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  let aset = set[T](a)
  let bset = set[U](b)
  var temp: seq[innerType(a)] = @[]

  for v in aset:
    if not bset.contains(v):
      temp.add(v)

  return temp

proc diffBoth*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  var temp: seq[innerType(a)] = @[]
  temp.add(diff(a, b))
  temp.add(diff(b, a))
  return temp
