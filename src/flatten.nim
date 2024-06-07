template flatten*[T](x: seq[T]): untyped =
  when T is seq:
    if len(x) > 0:
      let firstRow = flatten(x[0])
      var temp: seq[typeof(firstRow[0])] = @[]
      temp.add(firstRow)

      for v in x[1..^1]:
        temp.add(flatten(v))

      temp

    else:
      newSeq[float]()

  else:
    x
