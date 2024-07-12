import inner_type
import set

export inner_type
export set

# NOTE: This function only finds the elements in `a` that are not in `b`; it
# does NOT also find elements in `b` that are not in `a`!

proc diff*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  let aset = set[T](a)
  let bset = set[U](b)
  var temp: seq[inner_type(a)] = @[]

  for v in aset:
    if not bset.contains(v):
      temp.add(v)

  return temp

proc diff_both*[T, U](a: seq[T], b: seq[U]): seq[untyped] =
  var temp: seq[inner_type(a)] = @[]
  temp.add(diff(a, b))
  temp.add(diff(b, a))
  return temp
