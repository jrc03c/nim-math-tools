import innerType

export innerType

proc flatten*[T](x: seq[T]): seq[untyped] =
  when T is seq:
    var temp: seq[innerType(x)] = @[]

    for v in x:
      temp.add(flatten(v))

    return temp

  else:
    return x
