import flatten
import inner_type

export flatten
export inner_type

proc set*[T](x: seq[T]): seq[untyped] =
  let xflat = flatten(x)
  var temp: seq[inner_type(x)] = @[]

  for v in xflat:
    if not (v in temp):
      temp.add(v)

  return temp
