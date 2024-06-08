import std/typetraits

proc shape*[T](x: seq[T]): seq[int] =
  var temp: seq[int] = @[len(x)]

  when elementType(x) is seq:
    let s = shape(x[0])
    var allChildShapesAreIdentical = true

    for i in 1 .. len(x) - 1:
      if shape(x[i]) != s:
        allChildShapesAreIdentical = false
        break

    if allChildShapesAreIdentical:
      temp.add(s)

    else:
      temp.add(-1)

  return temp
