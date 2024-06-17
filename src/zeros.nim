import ndarray

export ndarray

template zeros*[T](shape: T): untyped =
  when T is seq[int]:
    ndarray(shape, float)

  else:
    ndarray(@[shape], float)
