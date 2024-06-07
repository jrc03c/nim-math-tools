template zeros*(shape: openArray[int]): untyped =
  when len(shape) == 0:
    newSeq[float]()

  when len(shape) == 1:
    var temp: seq[float] = @[]

    for i in 0 .. shape[0] - 1:
      temp.add(0.0)

    temp

  elif len(shape) == 2:
    var temp: seq[seq[float]] = @[]

    for i in 0 .. shape[0] - 1:
      temp.add(zeros([shape[1]]))

    temp

  else:
    let row = zeros(shape[1..^1])
    var temp: seq[typeof(row)] = @[]

    for i in 0 .. shape[0] - 1:
      temp.add(row)

    temp
