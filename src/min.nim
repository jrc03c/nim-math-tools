import flatten

export flatten

template min*[T](x: seq[T]): untyped =
  when T is seq:
    min(flatten(x))

  else:
    var lowest = high(T)

    for v in x:
      if v < lowest:
        lowest = v

    lowest
