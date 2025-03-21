template ndarray*(shape: seq[int], T: typedesc = float): untyped =
  when len(shape) == 0:
    new_seq[T]()

  when len(shape) == 1:
    var temp: seq[T] = @[]

    for i in 0 .. shape[0] - 1:
      temp.add(default(T))

    temp

  elif len(shape) == 2:
    var temp: seq[seq[T]] = @[]

    for i in 0 .. shape[0] - 1:
      temp.add(ndarray(@[shape[1]], T))

    temp

  else:
    let row = ndarray(shape[1..^1], T)
    var temp: seq[typeof(row)] = @[]

    for i in 0 .. shape[0] - 1:
      temp.add(row)

    temp

template ndarray*(n: int, T: typedesc = float): untyped =
  ndarray(@[n], T)
