import apply
import zeros

export apply
export zeros

template ones*(shape: seq[int]): seq[untyped] =
  apply(zeros(shape), proc(v: float): float = 1.0)

template ones*(n: int): seq[untyped] =
  ones(@[n])
