from math import sqrt
import variance

export variance

proc std*[T](x: seq[T]): float =
  return sqrt(variance(x))

proc stdev*[T](x: seq[T]): float =
  return std(x)
