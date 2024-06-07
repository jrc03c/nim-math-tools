import ndarray

export ndarray

template zeros*(shape: seq[int]): untyped =
  ndarray(shape, float)
