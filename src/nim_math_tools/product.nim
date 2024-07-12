import flatten

export flatten

proc product*[T](x: seq[T]): SomeNumber =
  when T is seq:
    return product(flatten(x))

  else:
    when T is int:
      var p = 1

    else:
      var p = 1.0

    for v in x:
      p *= v

    return p
