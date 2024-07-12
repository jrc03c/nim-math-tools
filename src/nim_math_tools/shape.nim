# NOTE: This function does not detect jaggedness; It only looks at the 0th
# element at each level of depth in a sequence!

proc shape*[T](x: seq[T]): seq[int] =
  when T is seq:
    var temp: seq[int] = @[len(x)]
    temp.add(shape(x[0]))
    return temp

  else:
    return @[len(x)]
