import flatten
import mean

proc variance*[T](x: seq[T]): float =
  let xflat = flatten(x)
  let m = mean(xflat)
  var s = 0.0

  for v in xflat:
    s += (v - m) * (v - m)

  return s / float(len(xflat))
