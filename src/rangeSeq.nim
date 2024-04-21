proc rangeSeq*(a: int, b: int, step: int = 1): seq[int] =
  if step == 0:
    var temp: seq[int] = @[]
    return temp

  if step > 0:
    assert b > a

    var temp: seq[int] = @[]
    var n = a

    while n <= b:
      temp.add(n)
      n += step

    return temp

  else:
    assert a > b

    var temp: seq[int] = @[]
    var n = a

    while n >= b:
      temp.add(n)
      n += step

    return temp

