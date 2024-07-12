import flatten

export flatten

proc mean*[T](x: seq[T]): float =
  let xflat = flatten(x)
  var s = 0.0

  for v in xflat:
    s += v

  return s / float(len(xflat))
