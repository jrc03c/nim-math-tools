import covariance
import shape
import std

proc correl*[T](a: seq[T], b: seq[T]): float =
  assert len(shape(a)) == 1
  assert len(shape(b)) == 1
  return covariance(a, b) / (std(a) * std(b))
