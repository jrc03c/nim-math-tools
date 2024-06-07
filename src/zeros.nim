import ndarray

export ndarray

template zeros*(shape: openArray[int]): untyped =
  ndarray(shape, float)
