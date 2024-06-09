import flatten

export flatten

template max*[T](x: seq[T]): untyped =
  when T is seq:
    max(flatten(x))

  else:
    var highest = low(T)

    for v in x:
      if v > highest:
        highest = v

    highest
