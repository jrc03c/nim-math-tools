proc rangeSeq*(a: int, b: int, step: int = 1): seq[int] =
  if step == 0 or a == b:
    return @[a]

  if b > a:
    var tempStep = step

    if tempStep < 0:
      tempStep *= -1

    var temp: seq[int] = @[]
    var n = a

    while n <= b:
      temp.add(n)
      n += tempStep

    return temp

  else:
    var tempStep = step

    if tempStep > 0:
      tempStep *= -1

    var temp: seq[int] = @[]
    var n = a

    while n >= b:
      temp.add(n)
      n += tempStep

    return temp

proc `...`*(a: int, b: int): seq[int] =
  return rangeSeq(a, b)
