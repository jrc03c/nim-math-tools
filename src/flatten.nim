import inner_type

export inner_type

proc flatten*[T](x: T): seq[untyped] =
  var temp: seq[T] = @[x]
  return temp

proc flatten*[T](x: seq[T]): seq[untyped] =
  when T is seq:
    var temp: seq[inner_type(x)] = @[]

    for v in x:
      temp.add(flatten(v))

    return temp

  else:
    return x
