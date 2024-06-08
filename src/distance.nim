from std/math import sqrt
import flatten

export flatten
export sqrt

proc distance*[T](x: seq[T], y: seq[T]): float =
  when T is seq:
    return distance(flatten(x), flatten(y))

  elif T is float:
    assert len(x) == len(y)
    var d = 0.0

    for i in 0 .. len(x) - 1:
      d += (x[i] - y[i]) * (x[i] - y[i])

    return sqrt(d)
