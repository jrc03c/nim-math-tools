import covariance
import shape
import stdev

proc correl*[T](a: seq[T], b: seq[T]): float =
  assert len(shape(a)) == 1
  assert len(shape(b)) == 1
  return covariance(a, b) / (stdev(a) * stdev(b))
