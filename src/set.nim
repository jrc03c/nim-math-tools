import flatten
import innerType

export flatten
export innerType

proc set*[T](x: seq[T]): seq[untyped] =
  let xflat = flatten(x)
  var temp: seq[innerType(x)] = @[]

  for v in xflat:
    if not (v in temp):
      temp.add(v)

  return temp
