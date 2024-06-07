from math import sqrt
import variance

proc std*[T](x: seq[T]): float =
  return sqrt(variance(x))
