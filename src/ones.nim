import apply
import zeros

export zeros

template ones*(shape: seq[int]): seq[untyped] =
  apply(zeros(shape), proc(v: float): float = 1.0)
