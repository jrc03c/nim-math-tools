import sqrt
import variance

export variance

proc stdev*[T](x: seq[T]): float =
  return sqrt(variance(x))
