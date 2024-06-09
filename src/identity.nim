import ndarray

export ndarray

template identity*(n: int, T: typedesc = float): seq[seq[T]] =
  assert T is SomeNumber

  var temp: seq[seq[T]] = ndarray(@[n, n], T)

  for i in 0 .. n - 1:
    temp[i][i] = T(1.0)

  temp
