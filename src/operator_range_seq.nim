proc range_seq*(a: int, b: int, step: int = 1): seq[int] =
  if step == 0 or a == b:
    return @[a]

  if b > a:
    var temp_step = step

    if temp_step < 0:
      temp_step *= -1

    var temp: seq[int] = @[]
    var n = a

    while n <= b:
      temp.add(n)
      n += temp_step

    return temp

  else:
    var temp_step = step

    if temp_step > 0:
      temp_step *= -1

    var temp: seq[int] = @[]
    var n = a

    while n >= b:
      temp.add(n)
      n += temp_step

    return temp

proc `...`*(a: int, b: int): seq[int] =
  return range_seq(a, b)
